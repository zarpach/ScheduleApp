import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../domain/model/slot.dart';

@immutable
abstract class SlotState extends Equatable {}

class SlotLoadingState extends SlotState {
  @override
  List<Object?> get props => [];
}

class SlotLoadedState extends SlotState {
  final List<Slot> slots;
  SlotLoadedState(this.slots);
  @override
  List<Object?> get props => [slots];
}

class SlotErrorState extends SlotState {
  final String error;
  SlotErrorState(this.error);
  @override
  List<Object?> get props => [error];
}