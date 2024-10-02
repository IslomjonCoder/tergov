class InfoFormSecondModel {
  String employeeFacts;
  String longWaits;
  String rudeBehavior;
  String psychologicalPressure;
  String physicalPressure;
  String extortion;

  InfoFormSecondModel({
    this.employeeFacts = '',
    this.longWaits = '',
    this.rudeBehavior = '',
    this.psychologicalPressure = '',
    this.physicalPressure = '',
    this.extortion = '',
  });
}

extension InfoFormSecondModelCopyWith on InfoFormSecondModel {
  InfoFormSecondModel copyWith({
    String? employeeFacts,
    String? longWaits,
    String? rudeBehavior,
    String? psychologicalPressure,
    String? physicalPressure,
    String? extortion,
  }) {
    return InfoFormSecondModel(
      employeeFacts: employeeFacts ?? this.employeeFacts,
      longWaits: longWaits ?? this.longWaits,
      rudeBehavior: rudeBehavior ?? this.rudeBehavior,
      psychologicalPressure: psychologicalPressure ?? this.psychologicalPressure,
      physicalPressure: physicalPressure ?? this.physicalPressure,
      extortion: extortion ?? this.extortion,
    );
  }
}
