import 'package:bloc/bloc.dart';
import 'package:expence_project/data/firebase_service/storage_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/user_model.dart';

part 'user_event.dart';
part 'user_state.dart';
part 'user_bloc.freezed.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  StorageRepository _storageRepository;
  UserBloc(this._storageRepository) : super(const _InitialState()) {
    on<_Started>((event, emit) async {
      final data = await _storageRepository.getUser();
      emit(_LoadedState(data));
    });
  }
}
