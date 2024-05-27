import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schedule_app/data/bloc/slot_repository.dart';
import 'package:schedule_app/data/blocs/app/app_events.dart';
import 'package:schedule_app/data/blocs/app/app_states.dart';
import 'package:schedule_app/data/local_storage_service.dart';

class SlotBloc extends Bloc<SlotEvent, SlotState> {
  final SlotRepository _slotRepository;


  SlotBloc(this._slotRepository) : super(SlotLoadingState()) {
    on<LoadSlotEvent>((event, emit) async {
      emit(SlotLoadingState());
      try {
        final options = await LocalStorageService.loadSlotParameters();
        final slots = await _slotRepository.getSlots(
            departmentId: options['departmentId']!,
            groupId: options['groupId']!,
            dayOfWeek: options['dayOfWeek']!
        );
        emit(SlotLoadedState(slots));
      } catch (e) {
        emit(SlotErrorState(e.toString()));
      }
    });
  }
}