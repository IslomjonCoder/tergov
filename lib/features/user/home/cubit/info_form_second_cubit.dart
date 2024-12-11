import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tergov/features/user/home/presentation/pages/user_dashboard/model/info_form_second_model.dart';
import 'package:tergov/utils/constants/enums.dart';

class InfoFormSecondCubit extends Cubit<InfoFormSecondModel> {
  final formKey = GlobalKey<FormState>();
  final employeeFactsController = TextEditingController();
  final longWaitsController = TextEditingController();
  final rudeBehaviorController = TextEditingController();
  final psychologicalPressureController = TextEditingController();

  InfoFormSecondCubit() : super(InfoFormSecondModel());

  void updatePhysicalPressure(YesNo? value) {
    emit(state.copyWith(physicalPressure: value));
  }

  void updateExtortion(YesNo? value) {
    emit(state.copyWith(extortion: value));
  }

  void updateLongWaits(YesNo? value) {
    emit(state.copyWith(longWaits: value));
  }
  void updateRudeBehavior(YesNo? value) {
    emit(state.copyWith(rudeBehavior: value));
  }

  void updatePsychologicalPressure(YesNo? value) {
    emit(state.copyWith(psychologicalPressure: value));
  }
  InfoFormSecondModel build() {
    return state.copyWith(
      employeeFacts: employeeFactsController.text,
      longWaits: state.longWaits,
      rudeBehavior: state.rudeBehavior,
      psychologicalPressure: state.psychologicalPressure,
    );
  }
}