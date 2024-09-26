import 'package:flutter_bloc/flutter_bloc.dart';

class RememberCubit extends Cubit<bool> {
  RememberCubit() : super(true);

  void toggle(bool? check) => emit(check ?? true);
}
