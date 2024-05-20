// Group class
import 'department.dart';

class Group {
  final int id;
  final int departmentId;
  final Department department;
  final int organizationId;
  final int year;
  final String code;
  final String departmentCode;

  Group({
    required this.id,
    required this.departmentId,
    required this.department,
    required this.organizationId,
    required this.year,
    required this.code,
    required this.departmentCode,
  });

  factory Group.fromJson(Map<String, dynamic> json) {
    return Group(
      id: json['id'],
      departmentId: json['departmentId'],
      department: Department.fromJson(json['department']),
      organizationId: json['organizationId'],
      year: json['year'],
      code: json['code'],
      departmentCode: json['departmentCode'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'departmentId': departmentId,
      'department': department.toJson(),
      'organizationId': organizationId,
      'year': year,
      'code': code,
      'departmentCode': departmentCode,
    };
  }
}
