class DepartmentOption {
  final int id;
  final String code;

  DepartmentOption({required this.id, required this.code});

  factory DepartmentOption.fromJson(Map<String, dynamic> json) {
    return DepartmentOption(
      id: json['departmentId'],
      code: json['department'],
    );
  }
}