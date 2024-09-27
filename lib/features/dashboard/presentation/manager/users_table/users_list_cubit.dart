import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:faker/faker.dart' as fk;

part 'users_list_state.dart';

class UsersListCubit extends Cubit<UsersListState> {
  final searchController = TextEditingController();

  UsersListCubit() : super(UsersListState()) {
    fetchUsers();
  }

  void search(String query) {
    emit(state.copyWith(
      filteredUsers: state.users.where((user) => user.name.toLowerCase().contains(query.toLowerCase())).toList(),
      searchQuery: query,
    ));
  }

  void sortById(int sortColumnIndex, bool ascending) {
    emit(state.copyWith(
      sortAscending: ascending,
      selectedColumnIndex: sortColumnIndex,
      filteredUsers: state.filteredUsers
        ..sort((a, b) {
          if (ascending) {
            return a.fields[sortColumnIndex].compareTo(b.fields[sortColumnIndex]);
          } else {
            return a.fields[sortColumnIndex].compareTo(b.fields[sortColumnIndex]);
          }
        }),
    ));
  }

  void fetchUsers() {
    final faker = fk.Faker();
    final users = List.generate(
      50,
      (index) => UserModel(
        name: faker.person.name(),
        address: faker.address.streetAddress(),
        phoneNumber: faker.phoneNumber.ja(),
        job: faker.job.title(),
        maritalStatus: 'Wife',
        image: 'https://picsum.photos/40',
        status: 'Victim',
      ),
    );

    emit(state.copyWith(filteredUsers: users, users: users));
  }
}
