import 'package:magic_magnet_engine/domain/parameters/search_parameters.dart';

abstract class SearchEvent {}

class SearchForMagnetLinksEvent implements SearchEvent {
  final SearchParameters parameters;

  SearchForMagnetLinksEvent(this.parameters);
}
