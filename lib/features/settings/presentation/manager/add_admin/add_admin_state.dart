part of 'add_admin_cubit.dart';

class AddAdminState {
  final FormzSubmissionStatus status;
  final AdminType? role;
  final Failure? failure;

  AddAdminState({
    this.status = FormzSubmissionStatus.initial,
    this.role,
    this.failure,
  });

  AddAdminState copyWith({
    FormzSubmissionStatus? status,
    AdminType? role,
    Failure? failure,
  }) {
    return AddAdminState(
      status: status ?? this.status,
      role: role ?? this.role,
      failure: failure ?? this.failure,
    );
  }
}
