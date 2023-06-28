// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'authentication_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthenticationEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() signInWithGoogle,
    required TResult Function(FirebaseAuth firebaseAuth) getSignIn,
    required TResult Function() signOut,
    required TResult Function(String email, String password) signInWithEmail,
    required TResult Function(String email, String password, String fullName)
        registerWithEmail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? signInWithGoogle,
    TResult? Function(FirebaseAuth firebaseAuth)? getSignIn,
    TResult? Function()? signOut,
    TResult? Function(String email, String password)? signInWithEmail,
    TResult? Function(String email, String password, String fullName)?
        registerWithEmail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? signInWithGoogle,
    TResult Function(FirebaseAuth firebaseAuth)? getSignIn,
    TResult Function()? signOut,
    TResult Function(String email, String password)? signInWithEmail,
    TResult Function(String email, String password, String fullName)?
        registerWithEmail,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SignInWithGoogleEvent value) signInWithGoogle,
    required TResult Function(_GetSignInEvent value) getSignIn,
    required TResult Function(_SignOutEvent value) signOut,
    required TResult Function(_SignInWithEmailEvent value) signInWithEmail,
    required TResult Function(_RegisterWithEmailEvent value) registerWithEmail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SignInWithGoogleEvent value)? signInWithGoogle,
    TResult? Function(_GetSignInEvent value)? getSignIn,
    TResult? Function(_SignOutEvent value)? signOut,
    TResult? Function(_SignInWithEmailEvent value)? signInWithEmail,
    TResult? Function(_RegisterWithEmailEvent value)? registerWithEmail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SignInWithGoogleEvent value)? signInWithGoogle,
    TResult Function(_GetSignInEvent value)? getSignIn,
    TResult Function(_SignOutEvent value)? signOut,
    TResult Function(_SignInWithEmailEvent value)? signInWithEmail,
    TResult Function(_RegisterWithEmailEvent value)? registerWithEmail,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthenticationEventCopyWith<$Res> {
  factory $AuthenticationEventCopyWith(
          AuthenticationEvent value, $Res Function(AuthenticationEvent) then) =
      _$AuthenticationEventCopyWithImpl<$Res, AuthenticationEvent>;
}

/// @nodoc
class _$AuthenticationEventCopyWithImpl<$Res, $Val extends AuthenticationEvent>
    implements $AuthenticationEventCopyWith<$Res> {
  _$AuthenticationEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_SignInWithGoogleEventCopyWith<$Res> {
  factory _$$_SignInWithGoogleEventCopyWith(_$_SignInWithGoogleEvent value,
          $Res Function(_$_SignInWithGoogleEvent) then) =
      __$$_SignInWithGoogleEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SignInWithGoogleEventCopyWithImpl<$Res>
    extends _$AuthenticationEventCopyWithImpl<$Res, _$_SignInWithGoogleEvent>
    implements _$$_SignInWithGoogleEventCopyWith<$Res> {
  __$$_SignInWithGoogleEventCopyWithImpl(_$_SignInWithGoogleEvent _value,
      $Res Function(_$_SignInWithGoogleEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_SignInWithGoogleEvent implements _SignInWithGoogleEvent {
  const _$_SignInWithGoogleEvent();

  @override
  String toString() {
    return 'AuthenticationEvent.signInWithGoogle()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_SignInWithGoogleEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() signInWithGoogle,
    required TResult Function(FirebaseAuth firebaseAuth) getSignIn,
    required TResult Function() signOut,
    required TResult Function(String email, String password) signInWithEmail,
    required TResult Function(String email, String password, String fullName)
        registerWithEmail,
  }) {
    return signInWithGoogle();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? signInWithGoogle,
    TResult? Function(FirebaseAuth firebaseAuth)? getSignIn,
    TResult? Function()? signOut,
    TResult? Function(String email, String password)? signInWithEmail,
    TResult? Function(String email, String password, String fullName)?
        registerWithEmail,
  }) {
    return signInWithGoogle?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? signInWithGoogle,
    TResult Function(FirebaseAuth firebaseAuth)? getSignIn,
    TResult Function()? signOut,
    TResult Function(String email, String password)? signInWithEmail,
    TResult Function(String email, String password, String fullName)?
        registerWithEmail,
    required TResult orElse(),
  }) {
    if (signInWithGoogle != null) {
      return signInWithGoogle();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SignInWithGoogleEvent value) signInWithGoogle,
    required TResult Function(_GetSignInEvent value) getSignIn,
    required TResult Function(_SignOutEvent value) signOut,
    required TResult Function(_SignInWithEmailEvent value) signInWithEmail,
    required TResult Function(_RegisterWithEmailEvent value) registerWithEmail,
  }) {
    return signInWithGoogle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SignInWithGoogleEvent value)? signInWithGoogle,
    TResult? Function(_GetSignInEvent value)? getSignIn,
    TResult? Function(_SignOutEvent value)? signOut,
    TResult? Function(_SignInWithEmailEvent value)? signInWithEmail,
    TResult? Function(_RegisterWithEmailEvent value)? registerWithEmail,
  }) {
    return signInWithGoogle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SignInWithGoogleEvent value)? signInWithGoogle,
    TResult Function(_GetSignInEvent value)? getSignIn,
    TResult Function(_SignOutEvent value)? signOut,
    TResult Function(_SignInWithEmailEvent value)? signInWithEmail,
    TResult Function(_RegisterWithEmailEvent value)? registerWithEmail,
    required TResult orElse(),
  }) {
    if (signInWithGoogle != null) {
      return signInWithGoogle(this);
    }
    return orElse();
  }
}

abstract class _SignInWithGoogleEvent implements AuthenticationEvent {
  const factory _SignInWithGoogleEvent() = _$_SignInWithGoogleEvent;
}

/// @nodoc
abstract class _$$_GetSignInEventCopyWith<$Res> {
  factory _$$_GetSignInEventCopyWith(
          _$_GetSignInEvent value, $Res Function(_$_GetSignInEvent) then) =
      __$$_GetSignInEventCopyWithImpl<$Res>;
  @useResult
  $Res call({FirebaseAuth firebaseAuth});
}

/// @nodoc
class __$$_GetSignInEventCopyWithImpl<$Res>
    extends _$AuthenticationEventCopyWithImpl<$Res, _$_GetSignInEvent>
    implements _$$_GetSignInEventCopyWith<$Res> {
  __$$_GetSignInEventCopyWithImpl(
      _$_GetSignInEvent _value, $Res Function(_$_GetSignInEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firebaseAuth = null,
  }) {
    return _then(_$_GetSignInEvent(
      null == firebaseAuth
          ? _value.firebaseAuth
          : firebaseAuth // ignore: cast_nullable_to_non_nullable
              as FirebaseAuth,
    ));
  }
}

/// @nodoc

class _$_GetSignInEvent implements _GetSignInEvent {
  const _$_GetSignInEvent(this.firebaseAuth);

  @override
  final FirebaseAuth firebaseAuth;

  @override
  String toString() {
    return 'AuthenticationEvent.getSignIn(firebaseAuth: $firebaseAuth)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetSignInEvent &&
            (identical(other.firebaseAuth, firebaseAuth) ||
                other.firebaseAuth == firebaseAuth));
  }

  @override
  int get hashCode => Object.hash(runtimeType, firebaseAuth);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetSignInEventCopyWith<_$_GetSignInEvent> get copyWith =>
      __$$_GetSignInEventCopyWithImpl<_$_GetSignInEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() signInWithGoogle,
    required TResult Function(FirebaseAuth firebaseAuth) getSignIn,
    required TResult Function() signOut,
    required TResult Function(String email, String password) signInWithEmail,
    required TResult Function(String email, String password, String fullName)
        registerWithEmail,
  }) {
    return getSignIn(firebaseAuth);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? signInWithGoogle,
    TResult? Function(FirebaseAuth firebaseAuth)? getSignIn,
    TResult? Function()? signOut,
    TResult? Function(String email, String password)? signInWithEmail,
    TResult? Function(String email, String password, String fullName)?
        registerWithEmail,
  }) {
    return getSignIn?.call(firebaseAuth);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? signInWithGoogle,
    TResult Function(FirebaseAuth firebaseAuth)? getSignIn,
    TResult Function()? signOut,
    TResult Function(String email, String password)? signInWithEmail,
    TResult Function(String email, String password, String fullName)?
        registerWithEmail,
    required TResult orElse(),
  }) {
    if (getSignIn != null) {
      return getSignIn(firebaseAuth);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SignInWithGoogleEvent value) signInWithGoogle,
    required TResult Function(_GetSignInEvent value) getSignIn,
    required TResult Function(_SignOutEvent value) signOut,
    required TResult Function(_SignInWithEmailEvent value) signInWithEmail,
    required TResult Function(_RegisterWithEmailEvent value) registerWithEmail,
  }) {
    return getSignIn(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SignInWithGoogleEvent value)? signInWithGoogle,
    TResult? Function(_GetSignInEvent value)? getSignIn,
    TResult? Function(_SignOutEvent value)? signOut,
    TResult? Function(_SignInWithEmailEvent value)? signInWithEmail,
    TResult? Function(_RegisterWithEmailEvent value)? registerWithEmail,
  }) {
    return getSignIn?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SignInWithGoogleEvent value)? signInWithGoogle,
    TResult Function(_GetSignInEvent value)? getSignIn,
    TResult Function(_SignOutEvent value)? signOut,
    TResult Function(_SignInWithEmailEvent value)? signInWithEmail,
    TResult Function(_RegisterWithEmailEvent value)? registerWithEmail,
    required TResult orElse(),
  }) {
    if (getSignIn != null) {
      return getSignIn(this);
    }
    return orElse();
  }
}

abstract class _GetSignInEvent implements AuthenticationEvent {
  const factory _GetSignInEvent(final FirebaseAuth firebaseAuth) =
      _$_GetSignInEvent;

  FirebaseAuth get firebaseAuth;
  @JsonKey(ignore: true)
  _$$_GetSignInEventCopyWith<_$_GetSignInEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SignOutEventCopyWith<$Res> {
  factory _$$_SignOutEventCopyWith(
          _$_SignOutEvent value, $Res Function(_$_SignOutEvent) then) =
      __$$_SignOutEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SignOutEventCopyWithImpl<$Res>
    extends _$AuthenticationEventCopyWithImpl<$Res, _$_SignOutEvent>
    implements _$$_SignOutEventCopyWith<$Res> {
  __$$_SignOutEventCopyWithImpl(
      _$_SignOutEvent _value, $Res Function(_$_SignOutEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_SignOutEvent implements _SignOutEvent {
  const _$_SignOutEvent();

  @override
  String toString() {
    return 'AuthenticationEvent.signOut()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_SignOutEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() signInWithGoogle,
    required TResult Function(FirebaseAuth firebaseAuth) getSignIn,
    required TResult Function() signOut,
    required TResult Function(String email, String password) signInWithEmail,
    required TResult Function(String email, String password, String fullName)
        registerWithEmail,
  }) {
    return signOut();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? signInWithGoogle,
    TResult? Function(FirebaseAuth firebaseAuth)? getSignIn,
    TResult? Function()? signOut,
    TResult? Function(String email, String password)? signInWithEmail,
    TResult? Function(String email, String password, String fullName)?
        registerWithEmail,
  }) {
    return signOut?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? signInWithGoogle,
    TResult Function(FirebaseAuth firebaseAuth)? getSignIn,
    TResult Function()? signOut,
    TResult Function(String email, String password)? signInWithEmail,
    TResult Function(String email, String password, String fullName)?
        registerWithEmail,
    required TResult orElse(),
  }) {
    if (signOut != null) {
      return signOut();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SignInWithGoogleEvent value) signInWithGoogle,
    required TResult Function(_GetSignInEvent value) getSignIn,
    required TResult Function(_SignOutEvent value) signOut,
    required TResult Function(_SignInWithEmailEvent value) signInWithEmail,
    required TResult Function(_RegisterWithEmailEvent value) registerWithEmail,
  }) {
    return signOut(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SignInWithGoogleEvent value)? signInWithGoogle,
    TResult? Function(_GetSignInEvent value)? getSignIn,
    TResult? Function(_SignOutEvent value)? signOut,
    TResult? Function(_SignInWithEmailEvent value)? signInWithEmail,
    TResult? Function(_RegisterWithEmailEvent value)? registerWithEmail,
  }) {
    return signOut?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SignInWithGoogleEvent value)? signInWithGoogle,
    TResult Function(_GetSignInEvent value)? getSignIn,
    TResult Function(_SignOutEvent value)? signOut,
    TResult Function(_SignInWithEmailEvent value)? signInWithEmail,
    TResult Function(_RegisterWithEmailEvent value)? registerWithEmail,
    required TResult orElse(),
  }) {
    if (signOut != null) {
      return signOut(this);
    }
    return orElse();
  }
}

abstract class _SignOutEvent implements AuthenticationEvent {
  const factory _SignOutEvent() = _$_SignOutEvent;
}

/// @nodoc
abstract class _$$_SignInWithEmailEventCopyWith<$Res> {
  factory _$$_SignInWithEmailEventCopyWith(_$_SignInWithEmailEvent value,
          $Res Function(_$_SignInWithEmailEvent) then) =
      __$$_SignInWithEmailEventCopyWithImpl<$Res>;
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class __$$_SignInWithEmailEventCopyWithImpl<$Res>
    extends _$AuthenticationEventCopyWithImpl<$Res, _$_SignInWithEmailEvent>
    implements _$$_SignInWithEmailEventCopyWith<$Res> {
  __$$_SignInWithEmailEventCopyWithImpl(_$_SignInWithEmailEvent _value,
      $Res Function(_$_SignInWithEmailEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_$_SignInWithEmailEvent(
      null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SignInWithEmailEvent implements _SignInWithEmailEvent {
  const _$_SignInWithEmailEvent(this.email, this.password);

  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'AuthenticationEvent.signInWithEmail(email: $email, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SignInWithEmailEvent &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SignInWithEmailEventCopyWith<_$_SignInWithEmailEvent> get copyWith =>
      __$$_SignInWithEmailEventCopyWithImpl<_$_SignInWithEmailEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() signInWithGoogle,
    required TResult Function(FirebaseAuth firebaseAuth) getSignIn,
    required TResult Function() signOut,
    required TResult Function(String email, String password) signInWithEmail,
    required TResult Function(String email, String password, String fullName)
        registerWithEmail,
  }) {
    return signInWithEmail(email, password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? signInWithGoogle,
    TResult? Function(FirebaseAuth firebaseAuth)? getSignIn,
    TResult? Function()? signOut,
    TResult? Function(String email, String password)? signInWithEmail,
    TResult? Function(String email, String password, String fullName)?
        registerWithEmail,
  }) {
    return signInWithEmail?.call(email, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? signInWithGoogle,
    TResult Function(FirebaseAuth firebaseAuth)? getSignIn,
    TResult Function()? signOut,
    TResult Function(String email, String password)? signInWithEmail,
    TResult Function(String email, String password, String fullName)?
        registerWithEmail,
    required TResult orElse(),
  }) {
    if (signInWithEmail != null) {
      return signInWithEmail(email, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SignInWithGoogleEvent value) signInWithGoogle,
    required TResult Function(_GetSignInEvent value) getSignIn,
    required TResult Function(_SignOutEvent value) signOut,
    required TResult Function(_SignInWithEmailEvent value) signInWithEmail,
    required TResult Function(_RegisterWithEmailEvent value) registerWithEmail,
  }) {
    return signInWithEmail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SignInWithGoogleEvent value)? signInWithGoogle,
    TResult? Function(_GetSignInEvent value)? getSignIn,
    TResult? Function(_SignOutEvent value)? signOut,
    TResult? Function(_SignInWithEmailEvent value)? signInWithEmail,
    TResult? Function(_RegisterWithEmailEvent value)? registerWithEmail,
  }) {
    return signInWithEmail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SignInWithGoogleEvent value)? signInWithGoogle,
    TResult Function(_GetSignInEvent value)? getSignIn,
    TResult Function(_SignOutEvent value)? signOut,
    TResult Function(_SignInWithEmailEvent value)? signInWithEmail,
    TResult Function(_RegisterWithEmailEvent value)? registerWithEmail,
    required TResult orElse(),
  }) {
    if (signInWithEmail != null) {
      return signInWithEmail(this);
    }
    return orElse();
  }
}

abstract class _SignInWithEmailEvent implements AuthenticationEvent {
  const factory _SignInWithEmailEvent(
      final String email, final String password) = _$_SignInWithEmailEvent;

  String get email;
  String get password;
  @JsonKey(ignore: true)
  _$$_SignInWithEmailEventCopyWith<_$_SignInWithEmailEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_RegisterWithEmailEventCopyWith<$Res> {
  factory _$$_RegisterWithEmailEventCopyWith(_$_RegisterWithEmailEvent value,
          $Res Function(_$_RegisterWithEmailEvent) then) =
      __$$_RegisterWithEmailEventCopyWithImpl<$Res>;
  @useResult
  $Res call({String email, String password, String fullName});
}

/// @nodoc
class __$$_RegisterWithEmailEventCopyWithImpl<$Res>
    extends _$AuthenticationEventCopyWithImpl<$Res, _$_RegisterWithEmailEvent>
    implements _$$_RegisterWithEmailEventCopyWith<$Res> {
  __$$_RegisterWithEmailEventCopyWithImpl(_$_RegisterWithEmailEvent _value,
      $Res Function(_$_RegisterWithEmailEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? fullName = null,
  }) {
    return _then(_$_RegisterWithEmailEvent(
      null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_RegisterWithEmailEvent implements _RegisterWithEmailEvent {
  const _$_RegisterWithEmailEvent(this.email, this.password, this.fullName);

  @override
  final String email;
  @override
  final String password;
  @override
  final String fullName;

  @override
  String toString() {
    return 'AuthenticationEvent.registerWithEmail(email: $email, password: $password, fullName: $fullName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RegisterWithEmailEvent &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, password, fullName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RegisterWithEmailEventCopyWith<_$_RegisterWithEmailEvent> get copyWith =>
      __$$_RegisterWithEmailEventCopyWithImpl<_$_RegisterWithEmailEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() signInWithGoogle,
    required TResult Function(FirebaseAuth firebaseAuth) getSignIn,
    required TResult Function() signOut,
    required TResult Function(String email, String password) signInWithEmail,
    required TResult Function(String email, String password, String fullName)
        registerWithEmail,
  }) {
    return registerWithEmail(email, password, fullName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? signInWithGoogle,
    TResult? Function(FirebaseAuth firebaseAuth)? getSignIn,
    TResult? Function()? signOut,
    TResult? Function(String email, String password)? signInWithEmail,
    TResult? Function(String email, String password, String fullName)?
        registerWithEmail,
  }) {
    return registerWithEmail?.call(email, password, fullName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? signInWithGoogle,
    TResult Function(FirebaseAuth firebaseAuth)? getSignIn,
    TResult Function()? signOut,
    TResult Function(String email, String password)? signInWithEmail,
    TResult Function(String email, String password, String fullName)?
        registerWithEmail,
    required TResult orElse(),
  }) {
    if (registerWithEmail != null) {
      return registerWithEmail(email, password, fullName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SignInWithGoogleEvent value) signInWithGoogle,
    required TResult Function(_GetSignInEvent value) getSignIn,
    required TResult Function(_SignOutEvent value) signOut,
    required TResult Function(_SignInWithEmailEvent value) signInWithEmail,
    required TResult Function(_RegisterWithEmailEvent value) registerWithEmail,
  }) {
    return registerWithEmail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SignInWithGoogleEvent value)? signInWithGoogle,
    TResult? Function(_GetSignInEvent value)? getSignIn,
    TResult? Function(_SignOutEvent value)? signOut,
    TResult? Function(_SignInWithEmailEvent value)? signInWithEmail,
    TResult? Function(_RegisterWithEmailEvent value)? registerWithEmail,
  }) {
    return registerWithEmail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SignInWithGoogleEvent value)? signInWithGoogle,
    TResult Function(_GetSignInEvent value)? getSignIn,
    TResult Function(_SignOutEvent value)? signOut,
    TResult Function(_SignInWithEmailEvent value)? signInWithEmail,
    TResult Function(_RegisterWithEmailEvent value)? registerWithEmail,
    required TResult orElse(),
  }) {
    if (registerWithEmail != null) {
      return registerWithEmail(this);
    }
    return orElse();
  }
}

abstract class _RegisterWithEmailEvent implements AuthenticationEvent {
  const factory _RegisterWithEmailEvent(
          final String email, final String password, final String fullName) =
      _$_RegisterWithEmailEvent;

  String get email;
  String get password;
  String get fullName;
  @JsonKey(ignore: true)
  _$$_RegisterWithEmailEventCopyWith<_$_RegisterWithEmailEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AuthenticationState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() intial,
    required TResult Function() authenticated,
    required TResult Function(bool isLoading) loaded,
    required TResult Function(String message) error,
    required TResult Function() unauthenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? intial,
    TResult? Function()? authenticated,
    TResult? Function(bool isLoading)? loaded,
    TResult? Function(String message)? error,
    TResult? Function()? unauthenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? intial,
    TResult Function()? authenticated,
    TResult Function(bool isLoading)? loaded,
    TResult Function(String message)? error,
    TResult Function()? unauthenticated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) intial,
    required TResult Function(_Authenticated value) authenticated,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_ErrorState value) error,
    required TResult Function(_Unauthenticated value) unauthenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? intial,
    TResult? Function(_Authenticated value)? authenticated,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_ErrorState value)? error,
    TResult? Function(_Unauthenticated value)? unauthenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? intial,
    TResult Function(_Authenticated value)? authenticated,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_ErrorState value)? error,
    TResult Function(_Unauthenticated value)? unauthenticated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthenticationStateCopyWith<$Res> {
  factory $AuthenticationStateCopyWith(
          AuthenticationState value, $Res Function(AuthenticationState) then) =
      _$AuthenticationStateCopyWithImpl<$Res, AuthenticationState>;
}

/// @nodoc
class _$AuthenticationStateCopyWithImpl<$Res, $Val extends AuthenticationState>
    implements $AuthenticationStateCopyWith<$Res> {
  _$AuthenticationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$AuthenticationStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'AuthenticationState.intial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() intial,
    required TResult Function() authenticated,
    required TResult Function(bool isLoading) loaded,
    required TResult Function(String message) error,
    required TResult Function() unauthenticated,
  }) {
    return intial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? intial,
    TResult? Function()? authenticated,
    TResult? Function(bool isLoading)? loaded,
    TResult? Function(String message)? error,
    TResult? Function()? unauthenticated,
  }) {
    return intial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? intial,
    TResult Function()? authenticated,
    TResult Function(bool isLoading)? loaded,
    TResult Function(String message)? error,
    TResult Function()? unauthenticated,
    required TResult orElse(),
  }) {
    if (intial != null) {
      return intial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) intial,
    required TResult Function(_Authenticated value) authenticated,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_ErrorState value) error,
    required TResult Function(_Unauthenticated value) unauthenticated,
  }) {
    return intial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? intial,
    TResult? Function(_Authenticated value)? authenticated,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_ErrorState value)? error,
    TResult? Function(_Unauthenticated value)? unauthenticated,
  }) {
    return intial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? intial,
    TResult Function(_Authenticated value)? authenticated,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_ErrorState value)? error,
    TResult Function(_Unauthenticated value)? unauthenticated,
    required TResult orElse(),
  }) {
    if (intial != null) {
      return intial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements AuthenticationState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$$_AuthenticatedCopyWith<$Res> {
  factory _$$_AuthenticatedCopyWith(
          _$_Authenticated value, $Res Function(_$_Authenticated) then) =
      __$$_AuthenticatedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_AuthenticatedCopyWithImpl<$Res>
    extends _$AuthenticationStateCopyWithImpl<$Res, _$_Authenticated>
    implements _$$_AuthenticatedCopyWith<$Res> {
  __$$_AuthenticatedCopyWithImpl(
      _$_Authenticated _value, $Res Function(_$_Authenticated) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Authenticated implements _Authenticated {
  const _$_Authenticated();

  @override
  String toString() {
    return 'AuthenticationState.authenticated()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Authenticated);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() intial,
    required TResult Function() authenticated,
    required TResult Function(bool isLoading) loaded,
    required TResult Function(String message) error,
    required TResult Function() unauthenticated,
  }) {
    return authenticated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? intial,
    TResult? Function()? authenticated,
    TResult? Function(bool isLoading)? loaded,
    TResult? Function(String message)? error,
    TResult? Function()? unauthenticated,
  }) {
    return authenticated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? intial,
    TResult Function()? authenticated,
    TResult Function(bool isLoading)? loaded,
    TResult Function(String message)? error,
    TResult Function()? unauthenticated,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) intial,
    required TResult Function(_Authenticated value) authenticated,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_ErrorState value) error,
    required TResult Function(_Unauthenticated value) unauthenticated,
  }) {
    return authenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? intial,
    TResult? Function(_Authenticated value)? authenticated,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_ErrorState value)? error,
    TResult? Function(_Unauthenticated value)? unauthenticated,
  }) {
    return authenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? intial,
    TResult Function(_Authenticated value)? authenticated,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_ErrorState value)? error,
    TResult Function(_Unauthenticated value)? unauthenticated,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(this);
    }
    return orElse();
  }
}

abstract class _Authenticated implements AuthenticationState {
  const factory _Authenticated() = _$_Authenticated;
}

/// @nodoc
abstract class _$$_LoadedCopyWith<$Res> {
  factory _$$_LoadedCopyWith(_$_Loaded value, $Res Function(_$_Loaded) then) =
      __$$_LoadedCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isLoading});
}

/// @nodoc
class __$$_LoadedCopyWithImpl<$Res>
    extends _$AuthenticationStateCopyWithImpl<$Res, _$_Loaded>
    implements _$$_LoadedCopyWith<$Res> {
  __$$_LoadedCopyWithImpl(_$_Loaded _value, $Res Function(_$_Loaded) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
  }) {
    return _then(_$_Loaded(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_Loaded implements _Loaded {
  const _$_Loaded({this.isLoading = false});

  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'AuthenticationState.loaded(isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Loaded &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoadedCopyWith<_$_Loaded> get copyWith =>
      __$$_LoadedCopyWithImpl<_$_Loaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() intial,
    required TResult Function() authenticated,
    required TResult Function(bool isLoading) loaded,
    required TResult Function(String message) error,
    required TResult Function() unauthenticated,
  }) {
    return loaded(isLoading);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? intial,
    TResult? Function()? authenticated,
    TResult? Function(bool isLoading)? loaded,
    TResult? Function(String message)? error,
    TResult? Function()? unauthenticated,
  }) {
    return loaded?.call(isLoading);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? intial,
    TResult Function()? authenticated,
    TResult Function(bool isLoading)? loaded,
    TResult Function(String message)? error,
    TResult Function()? unauthenticated,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(isLoading);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) intial,
    required TResult Function(_Authenticated value) authenticated,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_ErrorState value) error,
    required TResult Function(_Unauthenticated value) unauthenticated,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? intial,
    TResult? Function(_Authenticated value)? authenticated,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_ErrorState value)? error,
    TResult? Function(_Unauthenticated value)? unauthenticated,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? intial,
    TResult Function(_Authenticated value)? authenticated,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_ErrorState value)? error,
    TResult Function(_Unauthenticated value)? unauthenticated,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements AuthenticationState {
  const factory _Loaded({final bool isLoading}) = _$_Loaded;

  bool get isLoading;
  @JsonKey(ignore: true)
  _$$_LoadedCopyWith<_$_Loaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ErrorStateCopyWith<$Res> {
  factory _$$_ErrorStateCopyWith(
          _$_ErrorState value, $Res Function(_$_ErrorState) then) =
      __$$_ErrorStateCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$_ErrorStateCopyWithImpl<$Res>
    extends _$AuthenticationStateCopyWithImpl<$Res, _$_ErrorState>
    implements _$$_ErrorStateCopyWith<$Res> {
  __$$_ErrorStateCopyWithImpl(
      _$_ErrorState _value, $Res Function(_$_ErrorState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$_ErrorState(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ErrorState implements _ErrorState {
  const _$_ErrorState(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'AuthenticationState.error(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ErrorState &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ErrorStateCopyWith<_$_ErrorState> get copyWith =>
      __$$_ErrorStateCopyWithImpl<_$_ErrorState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() intial,
    required TResult Function() authenticated,
    required TResult Function(bool isLoading) loaded,
    required TResult Function(String message) error,
    required TResult Function() unauthenticated,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? intial,
    TResult? Function()? authenticated,
    TResult? Function(bool isLoading)? loaded,
    TResult? Function(String message)? error,
    TResult? Function()? unauthenticated,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? intial,
    TResult Function()? authenticated,
    TResult Function(bool isLoading)? loaded,
    TResult Function(String message)? error,
    TResult Function()? unauthenticated,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) intial,
    required TResult Function(_Authenticated value) authenticated,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_ErrorState value) error,
    required TResult Function(_Unauthenticated value) unauthenticated,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? intial,
    TResult? Function(_Authenticated value)? authenticated,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_ErrorState value)? error,
    TResult? Function(_Unauthenticated value)? unauthenticated,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? intial,
    TResult Function(_Authenticated value)? authenticated,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_ErrorState value)? error,
    TResult Function(_Unauthenticated value)? unauthenticated,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _ErrorState implements AuthenticationState {
  const factory _ErrorState(final String message) = _$_ErrorState;

  String get message;
  @JsonKey(ignore: true)
  _$$_ErrorStateCopyWith<_$_ErrorState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_UnauthenticatedCopyWith<$Res> {
  factory _$$_UnauthenticatedCopyWith(
          _$_Unauthenticated value, $Res Function(_$_Unauthenticated) then) =
      __$$_UnauthenticatedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_UnauthenticatedCopyWithImpl<$Res>
    extends _$AuthenticationStateCopyWithImpl<$Res, _$_Unauthenticated>
    implements _$$_UnauthenticatedCopyWith<$Res> {
  __$$_UnauthenticatedCopyWithImpl(
      _$_Unauthenticated _value, $Res Function(_$_Unauthenticated) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Unauthenticated implements _Unauthenticated {
  const _$_Unauthenticated();

  @override
  String toString() {
    return 'AuthenticationState.unauthenticated()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Unauthenticated);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() intial,
    required TResult Function() authenticated,
    required TResult Function(bool isLoading) loaded,
    required TResult Function(String message) error,
    required TResult Function() unauthenticated,
  }) {
    return unauthenticated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? intial,
    TResult? Function()? authenticated,
    TResult? Function(bool isLoading)? loaded,
    TResult? Function(String message)? error,
    TResult? Function()? unauthenticated,
  }) {
    return unauthenticated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? intial,
    TResult Function()? authenticated,
    TResult Function(bool isLoading)? loaded,
    TResult Function(String message)? error,
    TResult Function()? unauthenticated,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) intial,
    required TResult Function(_Authenticated value) authenticated,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_ErrorState value) error,
    required TResult Function(_Unauthenticated value) unauthenticated,
  }) {
    return unauthenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? intial,
    TResult? Function(_Authenticated value)? authenticated,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_ErrorState value)? error,
    TResult? Function(_Unauthenticated value)? unauthenticated,
  }) {
    return unauthenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? intial,
    TResult Function(_Authenticated value)? authenticated,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_ErrorState value)? error,
    TResult Function(_Unauthenticated value)? unauthenticated,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated(this);
    }
    return orElse();
  }
}

abstract class _Unauthenticated implements AuthenticationState {
  const factory _Unauthenticated() = _$_Unauthenticated;
}
