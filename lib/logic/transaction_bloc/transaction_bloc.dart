import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:expence_project/data/firebase_service/storage_repository.dart';
import 'package:expence_project/data/models/transaction_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_event.dart';
part 'transaction_state.dart';
part 'transaction_bloc.freezed.dart';

class TransactionBloc extends Bloc<TransactionBlocEvent, TransactionBlocState> {
  final StorageRepository _storageRepository;
  TransactionBloc(this._storageRepository) : super(const _Initial()) {
    List<TransactionModel> listTransaction = [];
    on<_GetAllEvent>((event, emit) async {
      final data = await _storageRepository.getAllTransaction();
      listTransaction = data!;
      emit(_Loaded(listTransaction));
    });

    on<_AddEvent>((event, emit) async {
      String? fileUrl;
      if (event.url != null) {
        fileUrl = await _storageRepository.uploadImageToFirebase(event.url!);
      }
      _storageRepository.addTransaction(
          TransactionModel(
              accountUid: event.accountUid,
              type: event.type,
              url: fileUrl,
              amount: event.amount,
              description: event.description,
              category: event.category,
              createdAt: DateTime.now(),
              updatedAt: DateTime.now()),
          event.accountUid);
    });
  }
}
