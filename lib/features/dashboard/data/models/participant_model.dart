import 'package:tergov/features/dashboard/data/models/participant_roles.dart';
import 'package:tergov/features/user/home/presentation/pages/user_dashboard/model/info_first_model.dart';
import 'package:tergov/features/user/home/presentation/pages/user_dashboard/model/info_form_second_model.dart';
import 'package:tergov/utils/constants/enums.dart';

class Participant {
  final int id;
  final String participantFullName;
  final String placeOfResidence;
  final String phoneNumber;
  final ParticipantRole participantRole;
  final String interviewConducted;
  final String investigatorFullName;
  final String officerFullName;
  final String article211Explanation;
  final bool interviewRecorded;
  final DateTime interviewStartDate;
  final String employeeFacts;
  final YesNo longWaits;
  final YesNo rudeBehavior;
  final YesNo psychologicalPressure;
  final YesNo physicalPressure;
  final YesNo extortion;

  Participant({
    required this.id,
    required this.participantFullName,
    required this.placeOfResidence,
    required this.phoneNumber,
    required this.participantRole,
    required this.interviewConducted,
    required this.investigatorFullName,
    required this.officerFullName,
    required this.article211Explanation,
    required this.interviewRecorded,
    required this.interviewStartDate,
    required this.employeeFacts,
    required this.longWaits,
    required this.rudeBehavior,
    required this.psychologicalPressure,
    required this.physicalPressure,
    required this.extortion,
  });

  // Factory method to create a Participant from two models
  factory Participant.fromInfoForms({
    required InfoFormFirstModel firstModel,
    required InfoFormSecondModel secondModel,
    int participantId = 0,
    required DateTime interviewStartDate,
  }) {
    return Participant(
      id: participantId,
      participantFullName: firstModel.participantFullName,
      placeOfResidence: firstModel.placeOfResidence,
      phoneNumber: firstModel.phoneNumber,
      participantRole: firstModel.participantRole ??
          ParticipantRole(id: 0, roleName: '', translations: [
            Translation(id: 0, uzbekTranslation: '', russianTranslation: '', englishTranslation: '', roleId: 0),
          ],),
      interviewConducted: firstModel.interviewConducted == YesNo.yes ? 'yes' : 'no',
      investigatorFullName: firstModel.investigatorFullName,
      officerFullName: firstModel.officerFullName,
      article211Explanation: firstModel.article211Explanation == YesNo.yes ? 'yes' : 'no',
      interviewRecorded: firstModel.interviewRecorded.isRecorded,
      interviewStartDate: interviewStartDate,
      employeeFacts: secondModel.employeeFacts,
      longWaits: secondModel.longWaits,
      rudeBehavior: secondModel.rudeBehavior,
      psychologicalPressure: secondModel.psychologicalPressure,
      physicalPressure: secondModel.physicalPressure,
      extortion: secondModel.extortion,
    );
  }

  // From JSON
  factory Participant.fromJson(Map<String, dynamic> json) {
    return Participant(
      id: json['id'] as int,
      participantFullName: json['participant_full_name'] as String,
      placeOfResidence: json['place_of_residence'] as String,
      phoneNumber: json['phone_number'] as String,
      participantRole: ParticipantRole.fromJson(json['participant_roles'] as Map<String, dynamic>),
      interviewConducted: json['interview_conducted'] as String,
      investigatorFullName: json['investigator_full_name'] as String,
      officerFullName: json['officer_full_name'] as String,
      article211Explanation: json['article_211_explanation'] as String,
      interviewRecorded: json['interview_recorded'] as bool,
      interviewStartDate: DateTime.parse(json['interview_start_date'] as String),
      employeeFacts: json['employee_facts'] as String,
      longWaits: json['long_waits'] == 'yes' ? YesNo.yes : YesNo.no,
      rudeBehavior: json['rude_behavior'] == 'yes' ? YesNo.yes : YesNo.no,
      psychologicalPressure:  json['psychological_pressure'] == 'yes' ? YesNo.yes : YesNo.no,
      physicalPressure: json['physical_pressure'] == 'yes' ? YesNo.yes : YesNo.no,
      extortion: json['extortion'] == 'yes' ? YesNo.yes : YesNo.no,
    );
  }

  // To JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'participant_full_name': participantFullName,
      'place_of_residence': placeOfResidence,
      'phone_number': phoneNumber,
      'participant_roles': participantRole,
      'interview_conducted': interviewConducted,
      'investigator_full_name': investigatorFullName,
      'officer_full_name': officerFullName,
      'article_211_explanation': article211Explanation,
      'interview_recorded': interviewRecorded,
      'interview_start_date': interviewStartDate.toIso8601String(),
      'employee_facts': employeeFacts,
      'long_waits': longWaits,
      'rude_behavior': rudeBehavior,
      'psychological_pressure': psychologicalPressure,
      'physical_pressure': physicalPressure == YesNo.yes ? 'yes' : 'no',
      'extortion': extortion == YesNo.yes ? 'yes' : 'no',
    };
  }

  Map<String, dynamic> toUploadJson() => toJson()..remove('id');

  //   List get fields => [name, status, phoneNumber, job, address, maritalStatus];
  List get fields => [
        participantFullName,
        participantRole,
        phoneNumber,
        placeOfResidence,
      ];
}
