import 'department_option.dart';
import 'group_option.dart';

class SlotSearchParameters {
  final List<DepartmentOption> departments;
  final List<GroupOption> groups;

  SlotSearchParameters({required this.departments, required this.groups});
}