import 'package:tergov/features/dashboard/data/models/participant_roles.dart';
import 'package:tergov/utils/constants/enums.dart';

class InfoFormFirstModel {
 final String participantFullName;
 final String placeOfResidence;
 final String phoneNumber;
 final ParticipantRole? participantRole;
 final YesNo interviewConducted;
 final String investigatorFullName;
 final String officerFullName;
 final YesNo article211Explanation;
 final RecordType interviewRecorded;
 final DateTime? interviewStartDate;

 const  InfoFormFirstModel({
    this.participantFullName = '',
    this.placeOfResidence = '',
    this.phoneNumber = '',
    this.participantRole,
    this.interviewConducted = YesNo.yes,
    this.investigatorFullName = '',
    this.officerFullName = '',
    this.article211Explanation = YesNo.yes,
    this.interviewRecorded = RecordType.recorded,
    this.interviewStartDate ,
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
      interviewConducted: (map['interviewConducted'] as String) == "yes" ? YesNo.yes : YesNo.no,
      investigatorFullName: map['investigatorFullName'] as String,
      officerFullName: map['officerFullName'] as String,
      article211Explanation: (map['article211Explanation'] as String) == "yes" ? YesNo.yes : YesNo.no,
      interviewRecorded: (map['interviewRecorded'] as String) == "yes" ? RecordType.recorded : RecordType.notRecorded,
      interviewStartDate: DateTime.parse(map['interviewStartDate'] as String),
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
    YesNo? interviewConducted,
    String? investigatorFullName,
    String? officerFullName,
    YesNo? article211Explanation,
    RecordType? interviewRecorded,
    DateTime? interviewStartDate,
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
