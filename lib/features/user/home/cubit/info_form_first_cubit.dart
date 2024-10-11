import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tergov/features/dashboard/data/models/participant_roles.dart';

import 'package:tergov/features/user/home/presentation/pages/user_dashboard/model/info_first_model.dart';

class InfoFormFirstCubit extends Cubit<InfoFormFirstModel> {
  InfoFormFirstCubit() : super(InfoFormFirstModel());

  void updateFullName(String value) {
    emit(state.copyWith(participantFullName: value));
  }

  void updatePlaceOfResidence(String value) {
    emit(state.copyWith(placeOfResidence: value));
  }

  void updatePhoneNumber(String value) {
    emit(state.copyWith(phoneNumber: value));
  }

  void updateParticipantStatus(ParticipantRole value) {
    emit(state.copyWith(participantRole: value));
  }

  void updateInterviewConducted(String value) {
    emit(state.copyWith(interviewConducted: value));
  }

  void updateInvestigatorFullName(String value) {
    emit(state.copyWith(investigatorFullName: value));
  }

  void updateOfficerFullName(String value) {
    emit(state.copyWith(officerFullName: value));
  }

  void updateArticle211Explanation(String value) {
    emit(state.copyWith(article211Explanation: value));
  }

  void updateInterviewRecorded(String value) {
    emit(state.copyWith(interviewRecorded: value == 'yes'));
  }

  void updateInterviewStartDate(String value) {
    emit(state.copyWith(interviewStartDate: value));
  }

  @override
  void onChange(Change<InfoFormFirstModel> change) {

    if (change.currentState == change.nextState) return;
    super.onChange(change);
  }
}
