class InfoFormFirstModel {
  String participantFullName;
  String placeOfResidence;
  String phoneNumber;
  String participantStatus;
  String interviewConducted;
  String investigatorFullName;
  String officerFullName;
  String article211Explanation;
  String interviewRecorded;
  DateTime? interviewStartDate;
  DateTime? interviewEndDate;

  InfoFormFirstModel({
    this.participantFullName = '',
    this.placeOfResidence = '',
    this.phoneNumber = '',
    this.participantStatus = '',
    this.interviewConducted = '',
    this.investigatorFullName = '',
    this.officerFullName = '',
    this.article211Explanation = '',
    this.interviewRecorded = '',
    this.interviewStartDate,
    this.interviewEndDate,
  });

  @override
  String toString() {
    return 'InfoFormFirstModel{participantFullName: $participantFullName, placeOfResidence: $placeOfResidence, phoneNumber: $phoneNumber, participantStatus: $participantStatus, interviewConducted: $interviewConducted, investigatorFullName: $investigatorFullName, officerFullName: $officerFullName, article211Explanation: $article211Explanation, interviewRecorded: $interviewRecorded, interviewStartDate: $interviewStartDate, interviewEndDate: $interviewEndDate}';
  }
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
    String? interviewRecorded,
    DateTime? interviewStartDate,
    DateTime? interviewEndDate,
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
      interviewEndDate: interviewEndDate ?? this.interviewEndDate,
    );
  }
}

