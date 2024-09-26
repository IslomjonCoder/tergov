import 'package:flutter_bloc/flutter_bloc.dart';

class SidebarHoverCubit extends Cubit<bool> {
  SidebarHoverCubit() : super(false);

  void changeHover(bool hover) => emit(hover);
}
