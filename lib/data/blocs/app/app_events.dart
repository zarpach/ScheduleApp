import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class SlotEvent extends Equatable {
  const SlotEvent();
}

class LoadSlotEvent extends SlotEvent {
  @override
  List<Object?> get props => [];
}
