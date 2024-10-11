
import 'package:tergov/features/dashboard/data/models/participant_roles.dart';

class InfoFormFirstModel {
  String participantFullName;
  String placeOfResidence;
  String phoneNumber;
  ParticipantRole? participantRole;
  String interviewConducted;
  String investigatorFullName;
  String officerFullName;
  String article211Explanation;
  bool interviewRecorded;
  String? interviewStartDate;

   InfoFormFirstModel({
    this.participantFullName = '',
    this.placeOfResidence = '',
    this.phoneNumber = '',
    this.participantRole,
    this.interviewConducted = '',
    this.investigatorFullName = '',
    this.officerFullName = '',
    this.article211Explanation = '',
    this.interviewRecorded = false,
    this.interviewStartDate = '',
  });

  @override
  String toString() {
    return 'InfoFormFirstModel{participantFullName: $participantFullName, placeOfResidence: $placeOfResidence, phoneNumber: $phoneNumber, participantRole: $participantRole, interviewConducted: $interviewConducted, investigatorFullName: $investigatorFullName, officerFullName: $officerFullName, article211Explanation: $article211Explanation, interviewRecorded: $interviewRecorded, interviewStartDate: $interviewStartDate,}';
  }

  Map<String, dynamic> toMap() {
    return {
      'participantFullName': participantFullName,
      'placeOfResidence': placeOfResidence,
      'phoneNumber': phoneNumber,
      'participant_roles': participantRole,
      'interviewConducted': interviewConducted,
      'investigatorFullName': investigatorFullName,
      'officerFullName': officerFullName,
      'article211Explanation': article211Explanation,
      'interviewRecorded': interviewRecorded,
      'interviewStartDate': interviewStartDate,
    };
  }

  factory InfoFormFirstModel.fromMap(Map<String, dynamic> map) {
    return InfoFormFirstModel(
      participantFullName: map['participantFullName'] as String,
      placeOfResidence: map['placeOfResidence'] as String,
      phoneNumber: map['phoneNumber'] as String,
      participantRole: ParticipantRole.fromJson(map['participant_roles'] as Map<String, dynamic>),
      interviewConducted: map['interviewConducted'] as String,
      investigatorFullName: map['investigatorFullName'] as String,
      officerFullName: map['officerFullName'] as String,
      article211Explanation: map['article211Explanation'] as String,
      interviewRecorded: map['interviewRecorded'] as bool,
      interviewStartDate: map['interviewStartDate'] as String,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InfoFormFirstModel &&
          runtimeType == other.runtimeType &&
          participantFullName == other.participantFullName &&
          placeOfResidence == other.placeOfResidence &&
          phoneNumber == other.phoneNumber &&
          participantRole == other.participantRole &&
          interviewConducted == other.interviewConducted &&
          investigatorFullName == other.investigatorFullName &&
          officerFullName == other.officerFullName &&
          article211Explanation == other.article211Explanation &&
          interviewRecorded == other.interviewRecorded &&
          interviewStartDate == other.interviewStartDate;

  @override

  int get hashCode =>
      participantFullName.hashCode ^
      placeOfResidence.hashCode ^
      phoneNumber.hashCode ^
      participantRole.hashCode ^
      interviewConducted.hashCode ^
      investigatorFullName.hashCode ^
      officerFullName.hashCode ^
      article211Explanation.hashCode ^
      interviewRecorded.hashCode ^
      interviewStartDate.hashCode;
}

extension InfoFormModelCopyWith on InfoFormFirstModel {
  InfoFormFirstModel copyWith({
    String? participantFullName,
    String? placeOfResidence,
    String? phoneNumber,
    ParticipantRole? participantRole,
    String? interviewConducted,
    String? investigatorFullName,
    String? officerFullName,
    String? article211Explanation,
    bool? interviewRecorded,
    String? interviewStartDate,
  }) {
    return InfoFormFirstModel(
      participantFullName: participantFullName ?? this.participantFullName,
      placeOfResidence: placeOfResidence ?? this.placeOfResidence,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      participantRole: participantRole ?? this.participantRole,
      interviewConducted: interviewConducted ?? this.interviewConducted,
      investigatorFullName: investigatorFullName ?? this.investigatorFullName,
      officerFullName: officerFullName ?? this.officerFullName,
      article211Explanation: article211Explanation ?? this.article211Explanation,
      interviewRecorded: interviewRecorded ?? this.interviewRecorded,
      interviewStartDate: interviewStartDate ?? this.interviewStartDate,
    );
  }
}
