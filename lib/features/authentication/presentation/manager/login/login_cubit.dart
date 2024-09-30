import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tergov/features/authentication/presentation/manager/remember_cubit/remember_cubit.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final RememberCubit rememberCubit;
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  LoginCubit({required this.rememberCubit}) : super(LoginInitial());

  void login() async {
    if (!formKey.currentState!.validate()) return;

    emit(LoginLoading());

    await Future.delayed(const Duration(seconds: 2));

    emit(LoginSuccess());

  }
}
