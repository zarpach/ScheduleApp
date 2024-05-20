// Department class
class Department {
  final int id;
  final String code;
  final String nameEng;
  final String nameRus;
  final String nameKir;
  final int organizationId;
  final int importCode;
  final bool isActive;

  Department({
    required this.id,
    required this.code,
    required this.nameEng,
    required this.nameRus,
    required this.nameKir,
    required this.organizationId,
    required this.importCode,
    required this.isActive,
  });

  factory Department.fromJson(Map<String, dynamic> json) {
    return Department(
      id: json['id'],
      code: json['code'],
      nameEng: json['nameEng'],
      nameRus: json['nameRus'],
      nameKir: json['nameKir'],
      organizationId: json['organizationId'],
      importCode: json['importCode'],
      isActive: json['isActive'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'code': code,
      'nameEng': nameEng,
      'nameRus': nameRus,
      'nameKir': nameKir,
      'organizationId': organizationId,
      'importCode': importCode,
      'isActive': isActive,
    };
  }
}
