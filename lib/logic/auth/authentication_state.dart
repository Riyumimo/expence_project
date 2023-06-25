part of 'authentication_bloc.dart';

@freezed
class AuthenticationState with _$AuthenticationState {
  const factory AuthenticationState.intial() = _Initial;
  const factory AuthenticationState.authenticated() = _Authenticated;
  const factory AuthenticationState.loaded() = _Loaded;
  const factory AuthenticationState.unauthenticated() = _Unauthenticated;
}
