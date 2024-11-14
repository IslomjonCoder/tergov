import 'package:tergov/utils/constants/enums.dart';

class InfoFormSecondModel {
  String employeeFacts;
  String longWaits;
  String rudeBehavior;
  String psychologicalPressure;
  YesNo physicalPressure;
  YesNo extortion;

  InfoFormSecondModel({
    this.employeeFacts = '',
    this.longWaits = '',
    this.rudeBehavior = '',
    this.psychologicalPressure = '',
    this.physicalPressure = YesNo.yes,
    this.extortion = YesNo.yes,
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
      'physicalPressure': physicalPressure.name,
      'extortion': extortion.name,
    };
  }

  factory InfoFormSecondModel.fromMap(Map<String, dynamic> map) {
    return InfoFormSecondModel(
      employeeFacts: map['employeeFacts'] as String,
      longWaits: map['longWaits'] as String,
      rudeBehavior: map['rudeBehavior'] as String,
      psychologicalPressure: map['psychologicalPressure'] as String,
      physicalPressure: YesNo.values.firstWhere((e) => e.name == map['physicalPressure'] as String, orElse: () => YesNo.yes),
      extortion: YesNo.values.firstWhere((e) => e.name == map['extortion'] as String, orElse: () => YesNo.yes),
    );
  }
}


extension InfoFormSecondModelCopyWith on InfoFormSecondModel {
  InfoFormSecondModel copyWith({
    String? employeeFacts,
    String? longWaits,
    String? rudeBehavior,
    String? psychologicalPressure,
    YesNo? physicalPressure,
    YesNo? extortion,
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
