/* --
      LIST OF Enums
      They cannot be created inside a class.
-- */

import 'package:tergov/common/widgets/images/t_rounded_image.dart';

/// [ImageType] is used in [TRoundedImage]
enum ImageType { network, asset, file, memory }

/// [YesNo] is used in [TInfoFormFirstModel]
enum YesNo { yes, no }

/// [RecordType] is used in [TInfoFormFirstModel] for record type (Recorded or Not Recorded)
enum RecordType { recorded, notRecorded }

enum AdminType {
  simpleAdmin("simple_admin", 'Simple Admin'),
  superAdmin("super_admin", 'Super Admin');

  const AdminType(this.roleName, this.name);

  final String roleName;
  final String name;
}

extension YesNoExtension on YesNo {
//   for from json and to json

  String get name => this == YesNo.yes ? "Yes" : "No";

  static YesNo? fromJson(String value) {
    return YesNo.values.firstWhere((e) => e.name == value, orElse: () => YesNo.yes);
  }

  String toJson() => name;

}

extension RecordTypeExtension on RecordType {
//   fromString

  static RecordType fromString(String value) {
    return RecordType.values.firstWhere((e) => e.name == value, orElse: () => RecordType.recorded);
  }

  String toJson() {
    if (this == RecordType.recorded) {
      return 'yes';
    } else {
      return "no";
    }
  }
  static RecordType fromJson(String json) {
    switch (json) {
      case 'yes':
        return RecordType.recorded;
      case 'no':
        return RecordType.notRecorded;
      default:
        throw Exception('Unknown UserRole: $json');
    }
  }

  bool get isRecorded => this == RecordType.recorded;
}
