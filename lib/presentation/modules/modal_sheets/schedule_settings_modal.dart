import 'package:awesome_select/awesome_select.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ScheduleModalContent extends StatefulWidget {
  final List<S2Choice<String>> options;
  final List<Map<int, String>> days;

  const ScheduleModalContent({
    super.key,
    required this.options,
    required this.days,
  });

  @override
  _ScheduleModalContentState createState() => _ScheduleModalContentState();
}

class _ScheduleModalContentState extends State<ScheduleModalContent> {
  late String selectedDepartment;
  late String selectedGroup;
  late int selectedDayIndex;

  @override
  void initState() {
    super.initState();
    selectedDepartment = '';
    selectedGroup = '';
    selectedDayIndex = 1;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SmartSelect<String>.single(
          title: 'Department',
          selectedValue: selectedDepartment,
          choiceItems: widget.options,
          modalType: S2ModalType.popupDialog,
          onChange: (state) => setState(() => selectedDepartment = state.value),
        ),
        SmartSelect<String>.single(
          title: 'Group',
          selectedValue: selectedGroup,
          choiceItems: widget.options,
          modalType: S2ModalType.popupDialog,
          onChange: (state) => setState(() => selectedGroup = state.value),
        ),
        const Text('Day of week'),
        const Gap(10.0),
        Wrap(
          spacing: 5.0,
          children: List<Widget>.generate(widget.days.length, (int index) {
            return ChoiceChip(
              label: Text(widget.days.elementAt(index).entries.first.value),
              selected: selectedDayIndex == index,
              onSelected: (bool selected) {
                setState(() {
                  selectedDayIndex = selected ? index : 0;
                });
              },
            );
          }).toList(),
        ),
      ],
    );
  }
}