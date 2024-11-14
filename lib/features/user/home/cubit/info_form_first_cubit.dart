import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:tergov/features/dashboard/data/models/participant_roles.dart';

import 'package:tergov/features/user/home/presentation/pages/user_dashboard/model/info_first_model.dart';
import 'package:tergov/utils/constants/enums.dart';

class InfoFormFirstCubit extends Cubit<InfoFormFirstModel> {
  final fullNameController = TextEditingController();
  final placeOfResidenceController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final investigatorFullNameController = TextEditingController();
  final officerFullNameController = TextEditingController();
  final interviewStartDate = TextEditingController();
  final formKey = GlobalKey<FormState>();

  InfoFormFirstCubit() : super(const InfoFormFirstModel());

  final maskFormatter = MaskTextInputFormatter(
    mask: '+998 ## ### ## ##',
    filter: {"#": RegExp('[0-9]')},
  );




  void updateParticipantStatus(ParticipantRole? value) {
    emit(state.copyWith(participantRole: value));
  }

  void updateInterviewConducted(YesNo? value) {
    emit(state.copyWith(interviewConducted: value));
  }

  void updateArticle211Explanation(YesNo? value) {
    emit(state.copyWith(article211Explanation: value));
  }

  void updateInterviewRecorded(RecordType? value) {
    emit(state.copyWith(interviewRecorded: value));
  }

  void updateInterviewStartDate(DateTime value) {
    interviewStartDate.text = DateFormat.yMd().format(value);
    emit(state.copyWith(interviewStartDate: value));
  }

  @override
  void onChange(Change<InfoFormFirstModel> change) {
    if (change.currentState == change.nextState) return;
    super.onChange(change);
  }

  InfoFormFirstModel build() {
    return state.copyWith(
      participantFullName: fullNameController.text,
      placeOfResidence: placeOfResidenceController.text,
      phoneNumber: phoneNumberController.text,
      investigatorFullName: investigatorFullNameController.text,
      officerFullName: officerFullNameController.text,
    );
  }
}
