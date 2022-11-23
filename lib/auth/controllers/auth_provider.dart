import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:recipe_app/auth/models/user_profile.dart';
import 'package:recipe_app/common/controllers/common_providers.dart';
import 'package:recipe_app/favorites/controllers/favorites_provider.dart';

enum Status {
  loading,
  uninitialized,
  authenticated,
  authenticating,
  registering,
  authenticatingWithGoogle,
  unauthenticated,
  authError,
}

final authControllerProvider =
    NotifierProvider<AuthProvider, Status>(AuthProvider.new);

class AuthProvider extends Notifier<Status> {
  late final GoogleSignIn _googleSignIn;
  String _error = '';
  bool _loading = false;
  User? _user;

  @override
  build() {
    _init();
    return Status.unauthenticated;
  }

  _init() async {
    if (kIsWeb) {
      await FirebaseFirestore.instance
          .enablePersistence(const PersistenceSettings(synchronizeTabs: true));
    } else {
      FirebaseFirestore.instance.settings =
          const Settings(persistenceEnabled: true);
    }
    _googleSignIn = GoogleSignIn(scopes: ['email']);
    FirebaseAuth.instance.authStateChanges().listen(_onAuthStateChanged);
    FirebaseAuth.instance.userChanges().listen(_onUserChanged);
  }

  String get error => _error;
  Status get status => state;
  User? get fbUser => _user;
  bool get isLoading => _loading;

  Future<void> signIn(String email, String password) async {
    try {
      _loading = true;
      state = Status.authenticating;
      final userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      _checkUserProfile(userCredential);
      _error = '';
      _loading = false;
      state = Status.authenticated;
    } on FirebaseAuthException catch (e, _) {
      _error = e.message ?? '';
      _loading = false;
      state = Status.authError;
    }
  }

  Future<bool> signUp(UserProfile profile, String password) async {
    try {
      _error = '';
      state = Status.registering;
      final userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: profile.email,
        password: password,
      );
      final exist = FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user?.uid);
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user?.uid)
          .set(profile.toJson());
      state = Status.unauthenticated;
      return true;
    } on FirebaseAuthException catch (e, _) {
      if (e.code == 'weak-password') {
        _error = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        _error = 'The account already exists for that email.';
      } else if (e.code == 'operation-not-allowed') {
        _error = 'The user/password authenticating is not allowed.';
      } else if (e.code == 'invalid-email') {
        _error = 'The email is not valid.';
      } else {
        _error = e.message ?? '';
      }
      state = Status.authError;
      return false;
    } catch (e) {
      log(e.toString());
      state = Status.unauthenticated;
      return false;
    }
  }

  _checkUserProfile(UserCredential userCredential) async {
    final exist = FirebaseFirestore.instance
        .collection('users')
        .doc(userCredential.user?.uid);
    debugPrint('checking profile...');
    if (!(await exist.get()).exists) {
      final userProfile = UserProfile(
        name: userCredential.user?.displayName ?? '',
        email: userCredential.user?.email ?? '',
        aboutMe: '',
        work: '',
        photoUrl: userCredential.user?.photoURL ?? '',
        recipes: [],
        following: 0,
      );
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user?.uid)
          .set(userProfile.toJson());
    }
  }

  Future<UserCredential?> signInWithGoogle() async {
    try {
      state = Status.authenticatingWithGoogle;
      debugPrint('Authenticating...');
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      _error = '';
      debugPrint('signInWithCredential...');
      final userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      _checkUserProfile(userCredential);
    } on FirebaseAuthException catch (e, _) {
      _error = e.message ?? '';
      debugPrint('FirebaseAuthException');
      debugPrint(e.message.toString());
      _loading = false;
      state = Status.authError;
      return null;
    } on Exception catch (err, _) {
      _error = err.toString();
      debugPrint('err.toString()');
      debugPrint(err.toString());
      _loading = false;
      state = Status.authError;
      debugPrint(err.toString());
    }
    return null;
  }

  Future<UserCredential> signInWithGoogleWeb() async {
    // Create a new provider
    GoogleAuthProvider googleProvider = GoogleAuthProvider();

    googleProvider.addScope('email');
    googleProvider.setCustomParameters({'login_hint': 'user@example.com'});

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithPopup(googleProvider);

    // Or use signInWithRedirect
    // return await FirebaseAuth.instance.signInWithRedirect(googleProvider);
  }

  Future<void> signOut() async {
    FirebaseAuth.instance.signOut();
    _googleSignIn.signOut();
    state = Status.unauthenticated;
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
      state = Status.unauthenticated;
    } else {
      log('firebase user...');
      _user = firebaseUser;
      final exist =
          FirebaseFirestore.instance.collection('users').doc(_user?.uid);
      if ((await exist.get()).exists) {
        await exist.update({
          "lastLoggedIn": FieldValue.serverTimestamp(),
        });
      }
      log('created/saved user...');
      final token = await ref.read(notificationProvider).getToken();
      if (token != null) {
        FirebaseFirestore.instance.collection('users').doc(_user?.uid).set(
          {
            'notificationTokens': {token: true}
          },
          SetOptions(merge: true),
        );
      }
      ref.read(bookmarkControllerProvider);
      state = Status.authenticated;
    }
  }

  Future<void> _onUserChanged(User? firebaseUser) async {
    if (firebaseUser == null) {
      _user = null;
      state = Status.unauthenticated;
    } else {
      if (_user != firebaseUser) {
        _user = firebaseUser;
        final exist =
            FirebaseFirestore.instance.collection('users').doc(_user?.uid);
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
      state = Status.authenticated;
    }
  }
}
