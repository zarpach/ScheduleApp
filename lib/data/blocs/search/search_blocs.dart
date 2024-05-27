import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schedule_app/data/blocs/search/search_events.dart';
import 'package:schedule_app/data/blocs/search/search_states.dart';

import '../../bloc/search_repository.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchRepository _searchRepository;

  SearchBloc(this._searchRepository) : super(SearchParametersLoadingState()) {
    on<FetchSlotSearchParametersEvent>((event, emit) async {
      emit(SearchParametersLoadingState());
      try {
        final parameters = await _searchRepository.getSlotSearchParameters();
      emit(SearchParametersLoadedState(parameters));
      } catch (e) {
      emit(SearchParametersErrorState(e.toString()));
      }
    });
  }
}
