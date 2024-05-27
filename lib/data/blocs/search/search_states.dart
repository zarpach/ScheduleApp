import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import '../../../domain/search_parameters/slot_search_parameters.dart';

@immutable
abstract class SearchState extends Equatable {}

class SearchParametersLoadedState extends SearchState {
  final SlotSearchParameters parameters;
  SearchParametersLoadedState(this.parameters);

  @override
  List<Object?> get props => [parameters];
}

class SearchParametersLoadingState extends SearchState {
  @override
  List<Object?> get props => [];
}

class SearchParametersErrorState extends SearchState {
  final String error;
  SearchParametersErrorState(this.error);

  @override
  List<Object?> get props => [error];
}