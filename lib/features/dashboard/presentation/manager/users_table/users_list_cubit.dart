import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:tergov/common/failure/failures.dart';
import 'package:tergov/features/dashboard/data/models/participant_model.dart';
import 'package:tergov/features/dashboard/data/repositories/participant_repository.dart';

part 'users_list_state.dart';

class UsersListCubit extends Cubit<UsersListState> {
  final searchController = TextEditingController();
  final ParticipantRepository _participantRepository;

  UsersListCubit(this._participantRepository) : super(UsersListState()) {
    fetchUsers();
  }

  void search(String query) {
    emit(state.copyWith(
      filteredUsers: state.users.where((user) => user.participantFullName.toLowerCase().contains(query.toLowerCase())).toList(),
      searchQuery: query,
    ),);
  }

  void sortById(int sortColumnIndex, bool ascending) {
    emit(state.copyWith(
      sortAscending: ascending,
      selectedColumnIndex: sortColumnIndex,
      filteredUsers: state.filteredUsers
        ..sort((a, b) {
          if (ascending) {
            return (a.fields[sortColumnIndex]as String).compareTo(b.fields[sortColumnIndex]);
          } else {
            return( a.fields[sortColumnIndex] as String).compareTo(b.fields[sortColumnIndex]);
          }
        }),
    ),);
  }

  Future<void> fetchUsers() async {
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));

    final users = await _participantRepository.getAllParticipants();
    users.fold(
      (failure) => emit(state.copyWith(status: FormzSubmissionStatus.failure,failure: failure)),
      (user) => emit(state.copyWith(status: FormzSubmissionStatus.success, users: user, filteredUsers: user)),
    );

  }
}
