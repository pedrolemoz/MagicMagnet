abstract class SearchEvent {}

class SearchForMagnetLinksEvent implements SearchEvent {
  final String query;

  SearchForMagnetLinksEvent(this.query);
}
