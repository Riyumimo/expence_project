part of 'transaction_bloc_bloc.dart';

@freezed
class TransactionBlocEvent with _$TransactionBlocEvent {
  const factory TransactionBlocEvent.getAll() = _GetAllEvent;
  const factory TransactionBlocEvent.getById() = _GetByIdEvent;
  const factory TransactionBlocEvent.add(
    String accountUid,
    String type,
    File? url,
    String description,
    String category,
    double amount,
  ) = _AddEvent;
  const factory TransactionBlocEvent.delete() = _DeletedEvent;
  const factory TransactionBlocEvent.update() = _UpdateEvent;
}
