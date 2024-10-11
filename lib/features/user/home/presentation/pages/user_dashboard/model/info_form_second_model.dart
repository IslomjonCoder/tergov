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

  @override
  String toString() {
    return 'InfoFormSecondModel{employeeFacts: $employeeFacts, longWaits: $longWaits, rudeBehavior: $rudeBehavior, psychologicalPressure: $psychologicalPressure, physicalPressure: $physicalPressure, extortion: $extortion}';
  }

  Map<String, dynamic> toMap() {
    return {
      'employeeFacts': employeeFacts,
      'longWaits': longWaits,
      'rudeBehavior': rudeBehavior,
      'psychologicalPressure': psychologicalPressure,
      'physicalPressure': physicalPressure,
      'extortion': extortion,
    };
  }

  factory InfoFormSecondModel.fromMap(Map<String, dynamic> map) {
    return InfoFormSecondModel(
      employeeFacts: map['employeeFacts'] as String,
      longWaits: map['longWaits'] as String,
      rudeBehavior: map['rudeBehavior'] as String,
      psychologicalPressure: map['psychologicalPressure'] as String,
      physicalPressure: map['physicalPressure'] as String,
      extortion: map['extortion'] as String,
    );
  }
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
