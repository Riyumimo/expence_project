part of 'authentication_bloc.dart';

@freezed
class AuthenticationState with _$AuthenticationState {
  const factory AuthenticationState.intial() = _Initial;

  const factory AuthenticationState.authenticated() = _Authenticated;
  const factory AuthenticationState.loaded({@Default(false) bool isLoading}) =
      _Loaded;
  const factory AuthenticationState.error(String message) = _ErrorState;
  const factory AuthenticationState.unauthenticated() = _Unauthenticated;
}
