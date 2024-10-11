import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tergov/features/user/home/presentation/pages/user_dashboard/model/info_form_second_model.dart';

class InfoFormSecondCubit extends Cubit<InfoFormSecondModel> {
  InfoFormSecondCubit() : super(InfoFormSecondModel());

  void updateEmployeeFacts(String value) {
    emit(state.copyWith(employeeFacts: value));
  }

  void updateLongWaits(String value) {
    emit(state.copyWith(longWaits: value));
  }

  void updateRudeBehavior(String value) {
    emit(state.copyWith(rudeBehavior: value));
  }

  void updatePsychologicalPressure(String value) {
    emit(state.copyWith(psychologicalPressure: value));
  }

  void updatePhysicalPressure(String value) {
    emit(state.copyWith(physicalPressure: value));
  }

  void updateExtortion(String value) {
    emit(state.copyWith(extortion: value));
  }
}
