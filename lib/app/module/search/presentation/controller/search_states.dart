abstract class SearchState {}

class InitialState implements SearchState {}

class SearchingState implements SearchState {}

class ReceivedMagnetLinkState implements SearchState {}

class NoSearchProvidersState implements SearchState {}

class InvalidSearchQueryState implements SearchState {}

class UnexpectedErrorState implements SearchState {}

class FinishedSearchState implements SearchState {}
