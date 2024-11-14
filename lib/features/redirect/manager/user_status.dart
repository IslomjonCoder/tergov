import 'package:hydrated_bloc/hydrated_bloc.dart';

class UserStatusCubit extends HydratedCubit<bool?> {
  UserStatusCubit() : super(null);

  void setUserStatus(bool isUser) => emit(isUser);

  void setAdminStatus() => emit(false);

  void removeUser() => emit(null);

  void setUser() => emit(true);

  @override
  bool? fromJson(Map<String, dynamic> json) {
    return json['isUser'];
  }

  @override
  Map<String, dynamic>? toJson(bool? state) {
    return {'isUser': state};
  }
}
