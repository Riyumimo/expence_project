// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_bloc_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TransactionBlocEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getAll,
    required TResult Function() getById,
    required TResult Function(String accountUid, String type, String? url,
            String description, String category, double amount)
        add,
    required TResult Function() delete,
    required TResult Function() update,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getAll,
    TResult? Function()? getById,
    TResult? Function(String accountUid, String type, String? url,
            String description, String category, double amount)?
        add,
    TResult? Function()? delete,
    TResult? Function()? update,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getAll,
    TResult Function()? getById,
    TResult Function(String accountUid, String type, String? url,
            String description, String category, double amount)?
        add,
    TResult Function()? delete,
    TResult Function()? update,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetAllEvent value) getAll,
    required TResult Function(_GetByIdEvent value) getById,
    required TResult Function(_AddEvent value) add,
    required TResult Function(_DeletedEvent value) delete,
    required TResult Function(_UpdateEvent value) update,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetAllEvent value)? getAll,
    TResult? Function(_GetByIdEvent value)? getById,
    TResult? Function(_AddEvent value)? add,
    TResult? Function(_DeletedEvent value)? delete,
    TResult? Function(_UpdateEvent value)? update,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetAllEvent value)? getAll,
    TResult Function(_GetByIdEvent value)? getById,
    TResult Function(_AddEvent value)? add,
    TResult Function(_DeletedEvent value)? delete,
    TResult Function(_UpdateEvent value)? update,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionBlocEventCopyWith<$Res> {
  factory $TransactionBlocEventCopyWith(TransactionBlocEvent value,
          $Res Function(TransactionBlocEvent) then) =
      _$TransactionBlocEventCopyWithImpl<$Res, TransactionBlocEvent>;
}

/// @nodoc
class _$TransactionBlocEventCopyWithImpl<$Res,
        $Val extends TransactionBlocEvent>
    implements $TransactionBlocEventCopyWith<$Res> {
  _$TransactionBlocEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_GetAllEventCopyWith<$Res> {
  factory _$$_GetAllEventCopyWith(
          _$_GetAllEvent value, $Res Function(_$_GetAllEvent) then) =
      __$$_GetAllEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_GetAllEventCopyWithImpl<$Res>
    extends _$TransactionBlocEventCopyWithImpl<$Res, _$_GetAllEvent>
    implements _$$_GetAllEventCopyWith<$Res> {
  __$$_GetAllEventCopyWithImpl(
      _$_GetAllEvent _value, $Res Function(_$_GetAllEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_GetAllEvent implements _GetAllEvent {
  const _$_GetAllEvent();

  @override
  String toString() {
    return 'TransactionBlocEvent.getAll()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_GetAllEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getAll,
    required TResult Function() getById,
    required TResult Function(String accountUid, String type, String? url,
            String description, String category, double amount)
        add,
    required TResult Function() delete,
    required TResult Function() update,
  }) {
    return getAll();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getAll,
    TResult? Function()? getById,
    TResult? Function(String accountUid, String type, String? url,
            String description, String category, double amount)?
        add,
    TResult? Function()? delete,
    TResult? Function()? update,
  }) {
    return getAll?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getAll,
    TResult Function()? getById,
    TResult Function(String accountUid, String type, String? url,
            String description, String category, double amount)?
        add,
    TResult Function()? delete,
    TResult Function()? update,
    required TResult orElse(),
  }) {
    if (getAll != null) {
      return getAll();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetAllEvent value) getAll,
    required TResult Function(_GetByIdEvent value) getById,
    required TResult Function(_AddEvent value) add,
    required TResult Function(_DeletedEvent value) delete,
    required TResult Function(_UpdateEvent value) update,
  }) {
    return getAll(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetAllEvent value)? getAll,
    TResult? Function(_GetByIdEvent value)? getById,
    TResult? Function(_AddEvent value)? add,
    TResult? Function(_DeletedEvent value)? delete,
    TResult? Function(_UpdateEvent value)? update,
  }) {
    return getAll?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetAllEvent value)? getAll,
    TResult Function(_GetByIdEvent value)? getById,
    TResult Function(_AddEvent value)? add,
    TResult Function(_DeletedEvent value)? delete,
    TResult Function(_UpdateEvent value)? update,
    required TResult orElse(),
  }) {
    if (getAll != null) {
      return getAll(this);
    }
    return orElse();
  }
}

abstract class _GetAllEvent implements TransactionBlocEvent {
  const factory _GetAllEvent() = _$_GetAllEvent;
}

/// @nodoc
abstract class _$$_GetByIdEventCopyWith<$Res> {
  factory _$$_GetByIdEventCopyWith(
          _$_GetByIdEvent value, $Res Function(_$_GetByIdEvent) then) =
      __$$_GetByIdEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_GetByIdEventCopyWithImpl<$Res>
    extends _$TransactionBlocEventCopyWithImpl<$Res, _$_GetByIdEvent>
    implements _$$_GetByIdEventCopyWith<$Res> {
  __$$_GetByIdEventCopyWithImpl(
      _$_GetByIdEvent _value, $Res Function(_$_GetByIdEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_GetByIdEvent implements _GetByIdEvent {
  const _$_GetByIdEvent();

  @override
  String toString() {
    return 'TransactionBlocEvent.getById()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_GetByIdEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getAll,
    required TResult Function() getById,
    required TResult Function(String accountUid, String type, String? url,
            String description, String category, double amount)
        add,
    required TResult Function() delete,
    required TResult Function() update,
  }) {
    return getById();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getAll,
    TResult? Function()? getById,
    TResult? Function(String accountUid, String type, String? url,
            String description, String category, double amount)?
        add,
    TResult? Function()? delete,
    TResult? Function()? update,
  }) {
    return getById?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getAll,
    TResult Function()? getById,
    TResult Function(String accountUid, String type, String? url,
            String description, String category, double amount)?
        add,
    TResult Function()? delete,
    TResult Function()? update,
    required TResult orElse(),
  }) {
    if (getById != null) {
      return getById();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetAllEvent value) getAll,
    required TResult Function(_GetByIdEvent value) getById,
    required TResult Function(_AddEvent value) add,
    required TResult Function(_DeletedEvent value) delete,
    required TResult Function(_UpdateEvent value) update,
  }) {
    return getById(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetAllEvent value)? getAll,
    TResult? Function(_GetByIdEvent value)? getById,
    TResult? Function(_AddEvent value)? add,
    TResult? Function(_DeletedEvent value)? delete,
    TResult? Function(_UpdateEvent value)? update,
  }) {
    return getById?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetAllEvent value)? getAll,
    TResult Function(_GetByIdEvent value)? getById,
    TResult Function(_AddEvent value)? add,
    TResult Function(_DeletedEvent value)? delete,
    TResult Function(_UpdateEvent value)? update,
    required TResult orElse(),
  }) {
    if (getById != null) {
      return getById(this);
    }
    return orElse();
  }
}

abstract class _GetByIdEvent implements TransactionBlocEvent {
  const factory _GetByIdEvent() = _$_GetByIdEvent;
}

/// @nodoc
abstract class _$$_AddEventCopyWith<$Res> {
  factory _$$_AddEventCopyWith(
          _$_AddEvent value, $Res Function(_$_AddEvent) then) =
      __$$_AddEventCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String accountUid,
      String type,
      String? url,
      String description,
      String category,
      double amount});
}

/// @nodoc
class __$$_AddEventCopyWithImpl<$Res>
    extends _$TransactionBlocEventCopyWithImpl<$Res, _$_AddEvent>
    implements _$$_AddEventCopyWith<$Res> {
  __$$_AddEventCopyWithImpl(
      _$_AddEvent _value, $Res Function(_$_AddEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountUid = null,
    Object? type = null,
    Object? url = freezed,
    Object? description = null,
    Object? category = null,
    Object? amount = null,
  }) {
    return _then(_$_AddEvent(
      null == accountUid
          ? _value.accountUid
          : accountUid // ignore: cast_nullable_to_non_nullable
              as String,
      null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$_AddEvent implements _AddEvent {
  const _$_AddEvent(this.accountUid, this.type, this.url, this.description,
      this.category, this.amount);

  @override
  final String accountUid;
  @override
  final String type;
  @override
  final String? url;
  @override
  final String description;
  @override
  final String category;
  @override
  final double amount;

  @override
  String toString() {
    return 'TransactionBlocEvent.add(accountUid: $accountUid, type: $type, url: $url, description: $description, category: $category, amount: $amount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddEvent &&
            (identical(other.accountUid, accountUid) ||
                other.accountUid == accountUid) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, accountUid, type, url, description, category, amount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddEventCopyWith<_$_AddEvent> get copyWith =>
      __$$_AddEventCopyWithImpl<_$_AddEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getAll,
    required TResult Function() getById,
    required TResult Function(String accountUid, String type, String? url,
            String description, String category, double amount)
        add,
    required TResult Function() delete,
    required TResult Function() update,
  }) {
    return add(accountUid, type, url, description, category, amount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getAll,
    TResult? Function()? getById,
    TResult? Function(String accountUid, String type, String? url,
            String description, String category, double amount)?
        add,
    TResult? Function()? delete,
    TResult? Function()? update,
  }) {
    return add?.call(accountUid, type, url, description, category, amount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getAll,
    TResult Function()? getById,
    TResult Function(String accountUid, String type, String? url,
            String description, String category, double amount)?
        add,
    TResult Function()? delete,
    TResult Function()? update,
    required TResult orElse(),
  }) {
    if (add != null) {
      return add(accountUid, type, url, description, category, amount);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetAllEvent value) getAll,
    required TResult Function(_GetByIdEvent value) getById,
    required TResult Function(_AddEvent value) add,
    required TResult Function(_DeletedEvent value) delete,
    required TResult Function(_UpdateEvent value) update,
  }) {
    return add(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetAllEvent value)? getAll,
    TResult? Function(_GetByIdEvent value)? getById,
    TResult? Function(_AddEvent value)? add,
    TResult? Function(_DeletedEvent value)? delete,
    TResult? Function(_UpdateEvent value)? update,
  }) {
    return add?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetAllEvent value)? getAll,
    TResult Function(_GetByIdEvent value)? getById,
    TResult Function(_AddEvent value)? add,
    TResult Function(_DeletedEvent value)? delete,
    TResult Function(_UpdateEvent value)? update,
    required TResult orElse(),
  }) {
    if (add != null) {
      return add(this);
    }
    return orElse();
  }
}

abstract class _AddEvent implements TransactionBlocEvent {
  const factory _AddEvent(
      final String accountUid,
      final String type,
      final String? url,
      final String description,
      final String category,
      final double amount) = _$_AddEvent;

  String get accountUid;
  String get type;
  String? get url;
  String get description;
  String get category;
  double get amount;
  @JsonKey(ignore: true)
  _$$_AddEventCopyWith<_$_AddEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_DeletedEventCopyWith<$Res> {
  factory _$$_DeletedEventCopyWith(
          _$_DeletedEvent value, $Res Function(_$_DeletedEvent) then) =
      __$$_DeletedEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_DeletedEventCopyWithImpl<$Res>
    extends _$TransactionBlocEventCopyWithImpl<$Res, _$_DeletedEvent>
    implements _$$_DeletedEventCopyWith<$Res> {
  __$$_DeletedEventCopyWithImpl(
      _$_DeletedEvent _value, $Res Function(_$_DeletedEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_DeletedEvent implements _DeletedEvent {
  const _$_DeletedEvent();

  @override
  String toString() {
    return 'TransactionBlocEvent.delete()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_DeletedEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getAll,
    required TResult Function() getById,
    required TResult Function(String accountUid, String type, String? url,
            String description, String category, double amount)
        add,
    required TResult Function() delete,
    required TResult Function() update,
  }) {
    return delete();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getAll,
    TResult? Function()? getById,
    TResult? Function(String accountUid, String type, String? url,
            String description, String category, double amount)?
        add,
    TResult? Function()? delete,
    TResult? Function()? update,
  }) {
    return delete?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getAll,
    TResult Function()? getById,
    TResult Function(String accountUid, String type, String? url,
            String description, String category, double amount)?
        add,
    TResult Function()? delete,
    TResult Function()? update,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetAllEvent value) getAll,
    required TResult Function(_GetByIdEvent value) getById,
    required TResult Function(_AddEvent value) add,
    required TResult Function(_DeletedEvent value) delete,
    required TResult Function(_UpdateEvent value) update,
  }) {
    return delete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetAllEvent value)? getAll,
    TResult? Function(_GetByIdEvent value)? getById,
    TResult? Function(_AddEvent value)? add,
    TResult? Function(_DeletedEvent value)? delete,
    TResult? Function(_UpdateEvent value)? update,
  }) {
    return delete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetAllEvent value)? getAll,
    TResult Function(_GetByIdEvent value)? getById,
    TResult Function(_AddEvent value)? add,
    TResult Function(_DeletedEvent value)? delete,
    TResult Function(_UpdateEvent value)? update,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(this);
    }
    return orElse();
  }
}

abstract class _DeletedEvent implements TransactionBlocEvent {
  const factory _DeletedEvent() = _$_DeletedEvent;
}

/// @nodoc
abstract class _$$_UpdateEventCopyWith<$Res> {
  factory _$$_UpdateEventCopyWith(
          _$_UpdateEvent value, $Res Function(_$_UpdateEvent) then) =
      __$$_UpdateEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_UpdateEventCopyWithImpl<$Res>
    extends _$TransactionBlocEventCopyWithImpl<$Res, _$_UpdateEvent>
    implements _$$_UpdateEventCopyWith<$Res> {
  __$$_UpdateEventCopyWithImpl(
      _$_UpdateEvent _value, $Res Function(_$_UpdateEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_UpdateEvent implements _UpdateEvent {
  const _$_UpdateEvent();

  @override
  String toString() {
    return 'TransactionBlocEvent.update()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_UpdateEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getAll,
    required TResult Function() getById,
    required TResult Function(String accountUid, String type, String? url,
            String description, String category, double amount)
        add,
    required TResult Function() delete,
    required TResult Function() update,
  }) {
    return update();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getAll,
    TResult? Function()? getById,
    TResult? Function(String accountUid, String type, String? url,
            String description, String category, double amount)?
        add,
    TResult? Function()? delete,
    TResult? Function()? update,
  }) {
    return update?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getAll,
    TResult Function()? getById,
    TResult Function(String accountUid, String type, String? url,
            String description, String category, double amount)?
        add,
    TResult Function()? delete,
    TResult Function()? update,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetAllEvent value) getAll,
    required TResult Function(_GetByIdEvent value) getById,
    required TResult Function(_AddEvent value) add,
    required TResult Function(_DeletedEvent value) delete,
    required TResult Function(_UpdateEvent value) update,
  }) {
    return update(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetAllEvent value)? getAll,
    TResult? Function(_GetByIdEvent value)? getById,
    TResult? Function(_AddEvent value)? add,
    TResult? Function(_DeletedEvent value)? delete,
    TResult? Function(_UpdateEvent value)? update,
  }) {
    return update?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetAllEvent value)? getAll,
    TResult Function(_GetByIdEvent value)? getById,
    TResult Function(_AddEvent value)? add,
    TResult Function(_DeletedEvent value)? delete,
    TResult Function(_UpdateEvent value)? update,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(this);
    }
    return orElse();
  }
}

abstract class _UpdateEvent implements TransactionBlocEvent {
  const factory _UpdateEvent() = _$_UpdateEvent;
}

/// @nodoc
mixin _$TransactionBlocState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<TransactionModel> transactionModel) loaded,
    required TResult Function() error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<TransactionModel> transactionModel)? loaded,
    TResult? Function()? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<TransactionModel> transactionModel)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionBlocStateCopyWith<$Res> {
  factory $TransactionBlocStateCopyWith(TransactionBlocState value,
          $Res Function(TransactionBlocState) then) =
      _$TransactionBlocStateCopyWithImpl<$Res, TransactionBlocState>;
}

/// @nodoc
class _$TransactionBlocStateCopyWithImpl<$Res,
        $Val extends TransactionBlocState>
    implements $TransactionBlocStateCopyWith<$Res> {
  _$TransactionBlocStateCopyWithImpl(this._value, this._then);

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
    extends _$TransactionBlocStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'TransactionBlocState.initial()';
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
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<TransactionModel> transactionModel) loaded,
    required TResult Function() error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<TransactionModel> transactionModel)? loaded,
    TResult? Function()? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<TransactionModel> transactionModel)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements TransactionBlocState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$$_LoadingCopyWith<$Res> {
  factory _$$_LoadingCopyWith(
          _$_Loading value, $Res Function(_$_Loading) then) =
      __$$_LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LoadingCopyWithImpl<$Res>
    extends _$TransactionBlocStateCopyWithImpl<$Res, _$_Loading>
    implements _$$_LoadingCopyWith<$Res> {
  __$$_LoadingCopyWithImpl(_$_Loading _value, $Res Function(_$_Loading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Loading implements _Loading {
  const _$_Loading();

  @override
  String toString() {
    return 'TransactionBlocState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<TransactionModel> transactionModel) loaded,
    required TResult Function() error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<TransactionModel> transactionModel)? loaded,
    TResult? Function()? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<TransactionModel> transactionModel)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements TransactionBlocState {
  const factory _Loading() = _$_Loading;
}

/// @nodoc
abstract class _$$_LoadedCopyWith<$Res> {
  factory _$$_LoadedCopyWith(_$_Loaded value, $Res Function(_$_Loaded) then) =
      __$$_LoadedCopyWithImpl<$Res>;
  @useResult
  $Res call({List<TransactionModel> transactionModel});
}

/// @nodoc
class __$$_LoadedCopyWithImpl<$Res>
    extends _$TransactionBlocStateCopyWithImpl<$Res, _$_Loaded>
    implements _$$_LoadedCopyWith<$Res> {
  __$$_LoadedCopyWithImpl(_$_Loaded _value, $Res Function(_$_Loaded) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionModel = null,
  }) {
    return _then(_$_Loaded(
      null == transactionModel
          ? _value._transactionModel
          : transactionModel // ignore: cast_nullable_to_non_nullable
              as List<TransactionModel>,
    ));
  }
}

/// @nodoc

class _$_Loaded implements _Loaded {
  const _$_Loaded(final List<TransactionModel> transactionModel)
      : _transactionModel = transactionModel;

  final List<TransactionModel> _transactionModel;
  @override
  List<TransactionModel> get transactionModel {
    if (_transactionModel is EqualUnmodifiableListView)
      return _transactionModel;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_transactionModel);
  }

  @override
  String toString() {
    return 'TransactionBlocState.loaded(transactionModel: $transactionModel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Loaded &&
            const DeepCollectionEquality()
                .equals(other._transactionModel, _transactionModel));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_transactionModel));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoadedCopyWith<_$_Loaded> get copyWith =>
      __$$_LoadedCopyWithImpl<_$_Loaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<TransactionModel> transactionModel) loaded,
    required TResult Function() error,
  }) {
    return loaded(transactionModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<TransactionModel> transactionModel)? loaded,
    TResult? Function()? error,
  }) {
    return loaded?.call(transactionModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<TransactionModel> transactionModel)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(transactionModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements TransactionBlocState {
  const factory _Loaded(final List<TransactionModel> transactionModel) =
      _$_Loaded;

  List<TransactionModel> get transactionModel;
  @JsonKey(ignore: true)
  _$$_LoadedCopyWith<_$_Loaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ErrorCopyWith<$Res> {
  factory _$$_ErrorCopyWith(_$_Error value, $Res Function(_$_Error) then) =
      __$$_ErrorCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ErrorCopyWithImpl<$Res>
    extends _$TransactionBlocStateCopyWithImpl<$Res, _$_Error>
    implements _$$_ErrorCopyWith<$Res> {
  __$$_ErrorCopyWithImpl(_$_Error _value, $Res Function(_$_Error) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Error implements _Error {
  const _$_Error();

  @override
  String toString() {
    return 'TransactionBlocState.error()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Error);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<TransactionModel> transactionModel) loaded,
    required TResult Function() error,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<TransactionModel> transactionModel)? loaded,
    TResult? Function()? error,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<TransactionModel> transactionModel)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements TransactionBlocState {
  const factory _Error() = _$_Error;
}
