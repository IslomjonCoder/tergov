part of 'users_list_cubit.dart';

class UsersListState {
  final List<UserModel> users;
  final List<UserModel> filteredUsers;
  final List<bool> selectedUsers;
  final int selectedColumnIndex;
  final bool sortAscending;
  final String searchQuery ;

  UsersListState({
    this.users = const [],
    this.filteredUsers = const [],
    this.selectedUsers = const [],
    this.selectedColumnIndex = 0,
    this.sortAscending = true,
    this.searchQuery = '',
  });

  UsersListState copyWith({
    List<UserModel>? users,
    List<UserModel>? filteredUsers,
    List<bool>? selectedUsers,
    int? selectedColumnIndex,
    bool? sortAscending,
    String? searchQuery,
  }) {
    return UsersListState(
      users: users ?? this.users,
      filteredUsers: filteredUsers ?? this.filteredUsers,
      selectedUsers: selectedUsers ?? this.selectedUsers,
      selectedColumnIndex: selectedColumnIndex ?? this.selectedColumnIndex,
      sortAscending: sortAscending ?? this.sortAscending,
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }
}

class UserModel {
  final String name, image, status, phoneNumber, job, address, maritalStatus;

  UserModel({
    required this.name,
    required this.image,
    required this.status,
    required this.phoneNumber,
    required this.job,
    required this.address,
    required this.maritalStatus,
  });

  UserModel copyWith({
    String? name,
    String? image,
    String? status,
    String? phoneNumber,
    String? job,
    String? address,
    String? maritalStatus,
  }) {
    return UserModel(
      name: name ?? this.name,
      image: image ?? this.image,
      status: status ?? this.status,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      job: job ?? this.job,
      address: address ?? this.address,
      maritalStatus: maritalStatus ?? this.maritalStatus,
    );
  }

  List get fields => [name, status, phoneNumber, job, address, maritalStatus];
}
