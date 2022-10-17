import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:recipe_app/auth/models/user_profile.dart';

enum Status { uninitialized, authenticated, authenticating, unauthenticated }

final authControllerProvider = ChangeNotifierProvider<AuthProvider>((ref) {
  return AuthProvider();
});

class AuthProvider with ChangeNotifier {
  late final FirebaseAuth _auth;
  late final FirebaseFirestore _db;
  late final GoogleSignIn _googleSignIn;
  late String _error;
  late final bool _loading;
  User? _user;
  Status _status = Status.uninitialized;

  AuthProvider() {
    _init();
  }

  _init() async {
    _auth = FirebaseAuth.instance;
    _db = FirebaseFirestore.instance;
    if (kIsWeb) {
      await _db
          .enablePersistence(const PersistenceSettings(synchronizeTabs: true));
    } else {
      _db.settings = const Settings(persistenceEnabled: true);
    }
    _googleSignIn = GoogleSignIn(scopes: ['email']);
    _error = '';
    _loading = true;
    _auth.authStateChanges().listen(_onAuthStateChanged);
    _auth.userChanges().listen(_onUserChanged);
  }

  String get error => _error;
  Status get status => _status;
  User? get fbUser => _user;
  bool get isLoading => _loading;

  Future<void> signIn(String email, String password) async {
    try {
      _status = Status.authenticating;
      notifyListeners();
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      _error = '';
      _status = Status.authenticated;
      notifyListeners();
    } on FirebaseAuthException catch (e, _) {
      _error = e.message ?? '';
      _status = Status.unauthenticated;
      notifyListeners();
    }
  }

  Future<void> signup(String email, String password) async {
    try {
      _error = '';
      _status = Status.authenticating;
      notifyListeners();
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await signIn(email, password);
      _status = Status.authenticated;
      notifyListeners();
    } on FirebaseAuthException catch (e, _) {
      _error = e.message ?? '';
      if (e.code == 'weak-password') {
        log('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        log('The account already exists for that email.');
      } else if (e.code == 'operation-not-allowed') {
        log('The user/password authenticating is not allowed.');
      } else if (e.code == 'invalid-email') {
        log('The email is not valid.');
      }
      _status = Status.unauthenticated;
      notifyListeners();
    } catch (e) {
      log(e.toString());
      _status = Status.unauthenticated;
      notifyListeners();
    }
  }

  Future<UserCredential?> signInWithGoogle() async {
    try {
      _status = Status.authenticating;
      notifyListeners();
      print('Authenticating...');
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      print(googleUser.toString());
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      print(googleAuth.toString());
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      _error = '';
      return await _auth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e, _) {
      _error = e.message ?? '';
      print(e.message.toString());
      _status = Status.unauthenticated;
      notifyListeners();
      return null;
    } on Exception catch (err, _) {
      print(err.toString());
    }
    return null;
  }

  Future<UserCredential> signInWithGoogleWeb() async {
    // Create a new provider
    GoogleAuthProvider googleProvider = GoogleAuthProvider();

    googleProvider
        .addScope('https://www.googleapis.com/auth/contacts.readonly');
    googleProvider.setCustomParameters({'login_hint': 'user@example.com'});

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithPopup(googleProvider);

    // Or use signInWithRedirect
    // return await FirebaseAuth.instance.signInWithRedirect(googleProvider);
  }

  Future signOut() async {
    _auth.signOut();
    _googleSignIn.signOut();
    _status = Status.unauthenticated;
    notifyListeners();
    return Future.delayed(Duration.zero);
  }

  void updateProfile(UserProfile userProfile) async {
    if (_user != null && _user!.providerData.isNotEmpty) {
      final providerProfile = _user!.providerData.first;
      // ID of the provider (google.com, apple.com, etc.)
      final provider = providerProfile.providerId;
      // UID specific to the provider
      final uid = providerProfile.uid;
      // Name, email address, and profile photo URL
      final name = providerProfile.displayName;
      final emailAddress = providerProfile.email;
      final profilePhoto = providerProfile.photoURL;
      try {
        await _user?.updateDisplayName(name);
        await _user?.updateEmail(emailAddress ?? '');
        await _user?.updatePhotoURL(profilePhoto);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'invalid-email') {
        } else if (e.code == 'email-already-in-use') {
        } else if (e.code == 'requires-recent-login') {}
      }
    }
  }

  Future<void> _onAuthStateChanged(User? firebaseUser) async {
    if (firebaseUser == null) {
      _user = null;
      _status = Status.unauthenticated;
      notifyListeners();
    } else {
      log('firebase user...');
      _user = firebaseUser;
      final exist = _db.collection('users').doc(_user?.uid);
      if ((await exist.get()).exists) {
        await exist.update({
          "lastLoggedIn": FieldValue.serverTimestamp(),
        });
      } else {
        await _db.collection('users').doc(_user?.uid).set({
          "email": _user?.email ?? '',
          "name": _user?.displayName ?? '',
          "photoUrl": _user?.photoURL ?? '',
          "registrationDate": FieldValue.serverTimestamp(),
          "lastLoggedIn": FieldValue.serverTimestamp(),
        });
      }
      log('created/saved user...');
      _status = Status.authenticated;
      notifyListeners();
    }
  }

  Future<void> _onUserChanged(User? firebaseUser) async {
    if (firebaseUser == null) {
      _user = null;
      _status = Status.unauthenticated;
    } else {
      if (_user != firebaseUser) {
        _user = firebaseUser;
        final exist = _db.collection('users').doc(_user?.uid);
        if ((await exist.get()).exists) {
          await exist.update({
            "email": _user?.email ?? '',
            "name": _user?.displayName ?? '',
            "photoUrl": _user?.photoURL ?? '',
            "registrationDate": FieldValue.serverTimestamp(),
            "lastLoggedIn": FieldValue.serverTimestamp(),
          });
        }
      }
      _status = Status.authenticated;
    }
    notifyListeners();
  }
}
