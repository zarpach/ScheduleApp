// Course class
class Course {
  final int id;
  final String nameEng;
  final String nameRus;
  final String? nameKir;
  final String abbreviation;
  final String number;
  final int departmentId;
  final int languageId;
  final int organizationId;
  final int importCode;

  Course({
    required this.id,
    required this.nameEng,
    required this.nameRus,
    required this.nameKir,
    required this.abbreviation,
    required this.number,
    required this.departmentId,
    required this.languageId,
    required this.organizationId,
    required this.importCode,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['id'],
      nameEng: json['nameEng'],
      nameRus: json['nameRus'],
      nameKir: json['nameKir'],
      abbreviation: json['abbreviation'],
      number: json['number'],
      departmentId: json['departmentId'],
      languageId: json['languageId'],
      organizationId: json['organizationId'],
      importCode: json['importCode'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nameEng': nameEng,
      'nameRus': nameRus,
      'nameKir': nameKir,
      'abbreviation': abbreviation,
      'number': number,
      'departmentId': departmentId,
      'languageId': languageId,
      'organizationId': organizationId,
      'importCode': importCode,
    };
  }
}