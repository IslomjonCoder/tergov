import 'package:tergov/utils/constants/enums.dart';

class InfoFormSecondModel {
  String employeeFacts;
  YesNo longWaits;
  YesNo rudeBehavior;
  YesNo psychologicalPressure;
  YesNo physicalPressure;
  YesNo extortion;

  InfoFormSecondModel({
    this.employeeFacts = '',
    this.longWaits = YesNo.yes,
    this.rudeBehavior = YesNo.yes,
    this.psychologicalPressure = YesNo.yes,
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
      longWaits: YesNo.values.firstWhere((e) => e.name == map['longWaits'] as String, orElse: () => YesNo.yes),
      rudeBehavior:YesNo.values.firstWhere((e) => e.name == map['rudeBehavior'] as String, orElse: () => YesNo.yes),
      psychologicalPressure: YesNo.values.firstWhere((e) => e.name == map['psychologicalPressure'] as String, orElse: () => YesNo.yes),
      physicalPressure: YesNo.values.firstWhere((e) => e.name == map['physicalPressure'] as String, orElse: () => YesNo.yes),
      extortion: YesNo.values.firstWhere((e) => e.name == map['extortion'] as String, orElse: () => YesNo.yes),
    );
  }
}


extension InfoFormSecondModelCopyWith on InfoFormSecondModel {
  InfoFormSecondModel copyWith({
    String? employeeFacts,
    YesNo? longWaits,
    YesNo? rudeBehavior,
    YesNo? psychologicalPressure,
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
