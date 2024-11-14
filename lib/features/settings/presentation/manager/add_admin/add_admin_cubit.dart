import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:tergov/common/failure/failures.dart';
import 'package:tergov/features/authentication/data/repositories/auth_repository.dart';
import 'package:tergov/utils/constants/enums.dart';

part 'add_admin_state.dart';

class AddAdminCubit extends Cubit<AddAdminState> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final AuthRepository _authRepository;

  AddAdminCubit(this._authRepository) : super(AddAdminState());

  Future<void> addAdmin() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    final result = await _authRepository.register(email, password, {'role': state.role?.roleName});
    result.fold(
      (l) => emit(state.copyWith(status: FormzSubmissionStatus.failure, failure: l)),
      (r) => emit(state.copyWith(status: FormzSubmissionStatus.success)),
    );
  }

  // Clear controllers and reset form
  Future<void> clearForm() async {
    emailController.clear();
    passwordController.clear();
  }

  void changeRole(AdminType? role) => emit(state.copyWith(role: role, status: FormzSubmissionStatus.initial));
}
