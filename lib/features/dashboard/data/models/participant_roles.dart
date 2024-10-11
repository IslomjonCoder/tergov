class ParticipantRole {
  final int id;
  final String roleName;
  final List<Translation> translations;

  ParticipantRole({
    required this.id,
    required this.roleName,
    required this.translations,
  });

  // Factory constructor to create an instance from JSON
  factory ParticipantRole.fromJson(Map<String, dynamic> json) {
    return ParticipantRole(
      id: json['id'],
      roleName: json['role_name'],
      translations: List<Translation>.from(json['translations'].map((x) => Translation.fromJson(x))),
    );
  }

  // Method to convert an instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'role_name': roleName,
    };
  }
}

class Translation {
  final int id;
  final int roleId;
  final String uzbekTranslation;
  final String russianTranslation;
  final String englishTranslation;

  Translation({
    required this.id,
    required this.roleId,
    required this.uzbekTranslation,
    required this.russianTranslation,
    required this.englishTranslation,
  });

  // Factory constructor to create an instance from JSON
  factory Translation.fromJson(Map<String, dynamic> json) {
    return Translation(
      id: json['id'],
      roleId: json['role_id'],
      uzbekTranslation: json['uzbek_translation'],
      russianTranslation: json['russian_translation'],
      englishTranslation: json['english_translation'],
    );
  }

  String getTranslatedRoleName(String locale) {
    switch (locale) {
      case 'uz':
        return uzbekTranslation;
      case 'ru':
        return russianTranslation;
      default:
        return englishTranslation;
    }
  }

  // Method to convert an instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'role_id': roleId,
      'uzbek_translation': uzbekTranslation,
      'russian_translation': russianTranslation,
      'english_translation': englishTranslation,
    };
  }
}
