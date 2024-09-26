import 'package:flutter_bloc/flutter_bloc.dart';

class SideBarActiveCubit extends Cubit<String> {
  SideBarActiveCubit() : super("dashboard");

  void changeActive(String active) => emit(active);
}
