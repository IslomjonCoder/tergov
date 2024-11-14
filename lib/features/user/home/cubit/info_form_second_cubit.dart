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

  InfoFormSecondModel build() {
    return state.copyWith(
      employeeFacts: employeeFactsController.text,
      longWaits: longWaitsController.text,
      rudeBehavior: rudeBehaviorController.text,
      psychologicalPressure: psychologicalPressureController.text,
    );
  }
}