class GroupOption {
  final int id;
  final String code;
  final String departmentCode;

  GroupOption({required this.id, required this.code, required this.departmentCode});

  factory GroupOption.fromJson(Map<String, dynamic> json) {
    return GroupOption(
      id: json['groupId'],
      code: json['groupCode'],
      departmentCode: json['groupDepartment']
    );
  }
}