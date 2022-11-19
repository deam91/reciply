import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart'
    show MockUser, MockFirebaseAuth;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:recipe_app/auth/controllers/auth_provider.dart';

import 'firebase_mock.dart';

// create a mock for the class we need to test
class MockAuthProvider extends Mock implements AuthProvider {}

// a generic Listener class, used to keep track of when a provider notifies its listeners
class Listener<T> extends Mock {
  void call(T? previous, T next) {
    print(previous);
    print(next);
  }
}

final _mockUser = MockUser(
  isAnonymous: false,
  uid: 'deamdiaz',
  email: 'deam@deam.dev',
  displayName: 'Deam',
);

Stream<User> mockAuthStateChanges() {
  return Stream.fromIterable([
    _mockUser,
  ]);
}

Stream<User> mockUserChanges() {
  return Stream.fromIterable([
    _mockUser,
  ]);
}

void main() {
  final MockFirebaseAuth mockAuth = MockFirebaseAuth();
  final MockUser _mockUser = MockUser();

  setUpAll(() async {});

  // a helper method to create a ProviderContainer that overrides the authRepositoryProvider
  ProviderContainer makeProviderContainer(MockAuthProvider authRepository) {
    final container = ProviderContainer(
      overrides: [
        authControllerProvider.overrideWithProvider(
          NotifierProvider<AuthProvider, Status>(AuthProvider.new),
        ),
      ],
    );
    addTearDown(container.dispose);
    return container;
  }

  // late MockGoogleSignIn googleSignIn;
  // late MockFirebaseAuth auth;
  tearDown(() {});

  setUpAll(() async {
    setupFirebaseAuthMocks();
    await Firebase.initializeApp();
  });

  setUp(() async {
    // googleSignIn = MockGoogleSignIn();
    // final signinAccount = await googleSignIn.signIn();
    // final googleAuth = await signinAccount?.authentication;
    // final AuthCredential credential = GoogleAuthProvider.credential(
    //   accessToken: googleAuth?.accessToken,
    //   idToken: googleAuth?.idToken,
    // );
    // auth = MockFirebaseAuth(mockUser: user, signedIn: true);
  });

  test('initial state is Status.unauthenticated', () async {
    // when(() => mockAuth.authStateChanges).thenAnswer(mockAuthStateChanges);
    final authRepository = MockAuthProvider();
    // create the ProviderContainer with the mock auth repository
    final container = makeProviderContainer(authRepository);
    // create a listener
    final listener = Listener<Status>();
    // listen to the provider and call [listener] whenever its value changes
    container.listen(
      authControllerProvider,
      listener,
      fireImmediately: true,
    );

    // verify
    verify(
      // the build method returns a value immediately, so we expect AsyncData
      () => listener(null, Status.unauthenticated),
    );
    // verify that the listener is no longer called
    verifyNoMoreInteractions(listener);
  });
}
