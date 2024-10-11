part of 'users_list_cubit.dart';

class UsersListState {
  final FormzSubmissionStatus status;
  final List<Participant> users;
final List<Participant> filteredUsers;
  final List<bool> selectedUsers;
  final int selectedColumnIndex;
  final bool sortAscending;
  final String searchQuery ;
  final Failure? failure;

  UsersListState({
    this.status = FormzSubmissionStatus.initial,
    this.users = const [],
    this.filteredUsers = const [],
    this.selectedUsers = const [],
    this.selectedColumnIndex = 0,
    this.sortAscending = true,
    this.searchQuery = '',
    this.failure,
  });

  UsersListState copyWith({
    FormzSubmissionStatus? status,
    List<Participant>? users,
    List<Participant>? filteredUsers,
    List<bool>? selectedUsers,
    int? selectedColumnIndex,
    bool? sortAscending,
    String? searchQuery,
    Failure? failure,
  }) {
    return UsersListState(
      status: status ?? this.status,
      users: users ?? this.users,
      filteredUsers: filteredUsers ?? this.filteredUsers,
      selectedUsers: selectedUsers ?? this.selectedUsers,
      selectedColumnIndex: selectedColumnIndex ?? this.selectedColumnIndex,
      sortAscending: sortAscending ?? this.sortAscending,
      searchQuery: searchQuery ?? this.searchQuery,
      failure: failure ?? this.failure,
    );
  }
}

