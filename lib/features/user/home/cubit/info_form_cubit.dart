import 'package:flutter_bloc/flutter_bloc.dart';

class FormCubit extends Cubit<bool> {
  FormCubit() : super(false);

  void toggleForm() => emit(!state);
}
