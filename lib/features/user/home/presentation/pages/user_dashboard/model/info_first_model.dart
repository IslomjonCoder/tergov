
class InfoFormFirstModel {
  String participantFullName;
  String placeOfResidence;
  String phoneNumber;
  String participantStatus;
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
    this.participantStatus = '',
    this.interviewConducted = '',
    this.investigatorFullName = '',
    this.officerFullName = '',
    this.article211Explanation = '',
    this.interviewRecorded = false,
    this.interviewStartDate = '',
  });

  @override
  String toString() {
    return 'InfoFormFirstModel{participantFullName: $participantFullName, placeOfResidence: $placeOfResidence, phoneNumber: $phoneNumber, participantStatus: $participantStatus, interviewConducted: $interviewConducted, investigatorFullName: $investigatorFullName, officerFullName: $officerFullName, article211Explanation: $article211Explanation, interviewRecorded: $interviewRecorded, interviewStartDate: $interviewStartDate,}';
  }

  Map<String, dynamic> toMap() {
    return {
      'participantFullName': participantFullName,
      'placeOfResidence': placeOfResidence,
      'phoneNumber': phoneNumber,
      'participantStatus': participantStatus,
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
      participantStatus: map['participantStatus'] as String,
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
          participantStatus == other.participantStatus &&
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
      participantStatus.hashCode ^
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
    String? participantStatus,
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
      participantStatus: participantStatus ?? this.participantStatus,
      interviewConducted: interviewConducted ?? this.interviewConducted,
      investigatorFullName: investigatorFullName ?? this.investigatorFullName,
      officerFullName: officerFullName ?? this.officerFullName,
      article211Explanation: article211Explanation ?? this.article211Explanation,
      interviewRecorded: interviewRecorded ?? this.interviewRecorded,
      interviewStartDate: interviewStartDate ?? this.interviewStartDate,
    );
  }
}

