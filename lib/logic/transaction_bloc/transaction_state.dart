part of 'transaction_bloc.dart';

@freezed
class TransactionBlocState with _$TransactionBlocState {
  const factory TransactionBlocState.initial() = _Initial;
  const factory TransactionBlocState.loading() = _Loading;
  const factory TransactionBlocState.loaded(
      List<TransactionModel> transactionModel) = _Loaded;
  const factory TransactionBlocState.error() = _Error;
}
