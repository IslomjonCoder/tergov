import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tergov/features/authentication/data/repositories/auth_repository.dart';
import 'package:tergov/features/authentication/presentation/manager/remember_cubit/remember_cubit.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository _authRepository;
  final RememberCubit rememberCubit;
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  LoginCubit(this._authRepository, {required this.rememberCubit}) : super(LoginInitial());

  Future<void> login() async {
    if (!formKey.currentState!.validate()) return;

    emit(LoginLoading());

    final result = await _authRepository.login(emailController.text, passwordController.text);
    result.fold(
      (failure) => emit(LoginError(message: failure.message)),
      (value) => emit(LoginSuccess()),
    );
  }
}
