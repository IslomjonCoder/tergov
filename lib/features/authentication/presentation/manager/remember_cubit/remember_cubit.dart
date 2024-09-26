import 'package:flutter_bloc/flutter_bloc.dart';

class RememberCubit extends Cubit<bool> {
  RememberCubit() : super(false);

  void toggle(bool? check) => emit(check ?? false);
}
