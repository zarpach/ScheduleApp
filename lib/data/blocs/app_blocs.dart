import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schedule_app/data/bloc/slot_repository.dart';
import 'package:schedule_app/data/blocs/app_events.dart';
import 'package:schedule_app/data/blocs/app_states.dart';

class SlotBloc extends Bloc<SlotEvent, SlotState> {
  final SlotRepository _slotRepository;

  SlotBloc(this._slotRepository) : super(SlotLoadingState()) {
    on<LoadSlotEvent>((event, emit) async {
      emit(SlotLoadingState());
      try {
        final slots = await _slotRepository.getSlots();
        emit(SlotLoadedState(slots));
      } catch (e) {
        emit(SlotErrorState(e.toString()));
      }
    });
  }
}