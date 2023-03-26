abstract class SearchStates {}
class NewsSearchError extends SearchStates {
  final String? error;
  NewsSearchError(this.error);
}
class NewsSearchLoading extends SearchStates {}

class NewsSearchSuccess extends SearchStates {}
