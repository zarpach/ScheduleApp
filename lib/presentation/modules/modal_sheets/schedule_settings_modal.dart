import 'package:awesome_select/awesome_select.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:schedule_app/data/blocs/app/app_blocs.dart';
import 'package:schedule_app/data/blocs/app/app_events.dart';
import 'package:schedule_app/data/local_storage_service.dart';

import '../../../data/blocs/search/search_blocs.dart';
import '../../../data/blocs/search/search_states.dart';

class ScheduleModalContent extends StatefulWidget {
  const ScheduleModalContent({super.key});

  @override
  ScheduleModalContentState createState() => ScheduleModalContentState();
}

class ScheduleModalContentState extends State<ScheduleModalContent> {
  List<Map<int, String>> days = [
    {1: 'Monday'},
    {2: 'Tuesday'},
    {3: 'Wednesday'},
    {4: 'Thursday'},
    {5: 'Friday'},
    {6: 'Saturday'},
  ];

  final String departmentString = 'Department';
  final String groupString = 'Group';
  final String dayOfWeekString = 'Day of week';
  final String loadingString = 'Loading...';
  int selectedDepartment = 0;
  int selectedGroup = 0;
  int selectedDayIndex = 1;
  List<S2Choice<int>> departmentOptions = [];
  List<S2Choice<int>> groupOptions = [];

  @override
  void initState() {
    super.initState();
    loadOptions();
  }

  Future<void> loadOptions() async {
    final options = await LocalStorageService.loadSlotParameters();
    setState(() {
      selectedDepartment = options['departmentId'] ?? 14;
      selectedGroup = options['groupId'] ?? 55;
      selectedDayIndex = options['dayOfWeek'] ?? 1;
    });
  }

  Future<void> saveOptions() async {
    await LocalStorageService.saveSlotParameters(
      departmentId: selectedDepartment,
      groupId: selectedGroup,
      dayOfWeek: selectedDayIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        if (state is SearchParametersLoadingState) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SmartSelect.single(
                title: departmentString,
                onChange: (state) {},
                choiceItems: const <S2Choice<Object?>>[],
                tileBuilder: (context, state) {
                  return S2Tile(
                    isLoading: true,
                    loadingText: loadingString,
                    value: state.titleWidget,
                    onTap: () {  },
                    title: Text(departmentString),
                  );
                },
                selectedValue: null,
                ),
              SmartSelect.single(
                title: groupString,
                onChange: (state) {},
                choiceItems: const <S2Choice<Object?>>[],
                tileBuilder: (context, state) {
                  return S2Tile(
                    isLoading: true,
                    loadingText: loadingString,
                    value: state.titleWidget,
                    onTap: () {  },
                    title: Text(groupString),
                  );
                },
                selectedValue: null,
              ),
              const Text('Day of week'),
              const Gap(10.0),
              Wrap(
                spacing: 5.0,
                children: List<Widget>.generate(6, (int index) {
                  return ChoiceChip(
                    label: Text(days[index].values.first),
                    selected: selectedDayIndex == index,
                    onSelected: (bool selected) {
                      setState(() {
                        selectedDayIndex = selected ? index : 1;
                      });
                      saveOptions();
                    },
                  );
                }).toList(),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    OutlinedButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const SizedBox(
                        width: double.infinity,
                        child: Center(child: Text('Cancel')),
                      ),
                    ),

                    FilledButton(
                      onPressed: () => {
                        context.read<SlotBloc>().add(LoadSlotEvent()),
                        Navigator.of(context).pop(),
                      },
                      child: const SizedBox(
                        width: double.infinity,
                        child: Center(child: Text('Save')),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }
        if (state is SearchParametersLoadedState) {
          departmentOptions = state.parameters.departments
              .map<S2Choice<int>>((d) => S2Choice<int>(value: d.id, title: d.code))
              .toList();
          groupOptions = state.parameters.groups
              .map<S2Choice<int>>((g) => S2Choice<int>(value: g.id, title: '${g.departmentCode}-${g.code}'))
              .toList();
        }

        if (state is SearchParametersErrorState) {
          return const Column(
            children: [
            Text("Couldn't load departments and groups:/")
          ],
          );
        }

        return Padding(
          padding: const EdgeInsets.only(top: 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SmartSelect<int>.single(
                title: departmentString,
                selectedValue: selectedDepartment,
                choiceItems: departmentOptions,
                modalType: S2ModalType.bottomSheet,
                onChange: (state) {
                  setState(() {
                    selectedDepartment = state.value;
                    groupOptions = groupOptions.where((item) => item.value == selectedDepartment).toList();
                  });
                  saveOptions();
                },
              ),
              SmartSelect<int>.single(
                title: groupString,
                selectedValue: selectedGroup,
                choiceItems: groupOptions,
                modalType: S2ModalType.bottomSheet,
                onChange: (state) {
                  setState(() {
                    selectedGroup = state.value;
                  });
                  saveOptions();
                },
              ),
              const Text('Day of week'),
              const Gap(10.0),
              Wrap(
                spacing: 5.0,
                children: List<Widget>.generate(6, (int index) {
                  return ChoiceChip(
                    label: Text(days[index].values.first),
                    selected: selectedDayIndex == index + 1,
                    onSelected: (bool selected) {
                      setState(() {
                        selectedDayIndex = selected ? index + 1 : 1;
                      });
                      saveOptions();
                    },
                  );
                }).toList(),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    OutlinedButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const SizedBox(
                        width: double.infinity,
                        child: Center(child: Text('Cancel')),
                      ),
                    ),

                    FilledButton(
                      onPressed: () => {
                        context.read<SlotBloc>().add(LoadSlotEvent()),
                        Navigator.of(context).pop(),
                      },
                      child: const SizedBox(
                        width: double.infinity,
                        child: Center(child: Text('Save')),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
