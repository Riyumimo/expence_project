import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:expence_project/data/firebase_service/storage_repository.dart';
import 'package:expence_project/data/models/transaction_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_bloc_event.dart';
part 'transaction_bloc_state.dart';
part 'transaction_bloc_bloc.freezed.dart';

class TransactionBlocBloc
    extends Bloc<TransactionBlocEvent, TransactionBlocState> {
  final StorageRepository _storageRepository;
  TransactionBlocBloc(this._storageRepository) : super(const _Initial()) {
    on<_GetAllEvent>((event, emit) {
      _storageRepository.getAllTransaction();
    });
    on<_AddEvent>((event, emit) async {
      String? fileUrl;
      if (event.url != null) {
        fileUrl =
            await _storageRepository.uploadImageToFirebase(event.url as File);
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
