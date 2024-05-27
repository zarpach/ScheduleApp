import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class SearchEvent extends Equatable {
  const SearchEvent();
}

class FetchSlotSearchParametersEvent extends SearchEvent {
  @override
  List<Object?> get props => [];
}