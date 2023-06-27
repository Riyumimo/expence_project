part of 'authentication_bloc.dart';

@freezed
class AuthenticationEvent with _$AuthenticationEvent {
  const factory AuthenticationEvent.signInWithGoogle() = _SignInWithGoogleEvent;
  const factory AuthenticationEvent.getSignIn(FirebaseAuth firebaseAuth) =
      _GetSignInEvent;
  const factory AuthenticationEvent.signOut() = _SignOutEvent;
  const factory AuthenticationEvent.signInWithEmail() = _SignInWithEmailEvent;
  const factory AuthenticationEvent.registerWithEmail() =
      registerWithEmailEvent;
}
