part of 'account_bloc.dart';

@freezed
class AccountEvent with _$AccountEvent {
  const factory AccountEvent.started() = _Started;
  const factory AccountEvent.add(String accountType, String accountName,
      String name, int initialBalance) = _AddEvent;
  const factory AccountEvent.update() = _UpdateEvent;
  const factory AccountEvent.delete() = _DeletedEvent;
}
