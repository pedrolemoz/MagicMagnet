import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:magic_magnet_engine/domain/entities/magnet_links.dart';
import 'package:magic_magnet_engine/domain/errors/global_exceptions.dart';
import 'package:magic_magnet_engine/domain/usecases/search_for_magnet_links.dart';

import 'search_events.dart';
import 'search_states.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchForMagnetLinks _searchForMagnetLinks;

  SearchBloc(this._searchForMagnetLinks) : super(InitialState()) {
    on<SearchForMagnetLinksEvent>(onSearchForMagnetLinksEvent);
  }

  var magnetLinks = <MagnetLink>[];

  Future<void> onSearchForMagnetLinksEvent(
    SearchForMagnetLinksEvent event,
    Emitter<SearchState> emit,
  ) async {
    emit(SearchingState());
    try {
      final stream = _searchForMagnetLinks(event.parameters);
      await emit.forEach<MagnetLink>(
        stream,
        onData: (magnetLink) {
          magnetLinks.add(magnetLink);
          return ReceivedMagnetLinkState();
        },
      );
      emit(FinishedSearchState());
    } on InvalidSearchQueryException {
      emit(InvalidSearchQueryState());
    } on NoSearchProvidersException {
      emit(NoSearchProvidersState());
    } catch (exception) {
      emit(UnexpectedErrorState());
    }
  }
}
