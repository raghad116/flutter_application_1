abstract class NewsStates {}

class ChangeNav extends NewsStates {}

class InitialState extends NewsStates {}

class NewsgetSuccess extends NewsStates {}

class NewsgetError extends NewsStates {
  final String? error;
  NewsgetError(this.error);
}
class NewsgetLoading extends NewsStates {}

class NewsSportsgetSuccess extends NewsStates {}

class NewsSportsgetError extends NewsStates {
  final String? error;
  NewsSportsgetError(this.error);
}
class NewsSportsgetLoading extends NewsStates {}

class NewsScincegetSuccess extends NewsStates {}

class NewsScincegetError extends NewsStates {
  final String? error;
  NewsScincegetError(this.error);
}
class NewsScincegetLoading extends NewsStates {}

class NewsChangeMode extends NewsStates {}

// class NewsSearchError extends NewsStates {
//   final String? error;
//   NewsSearchError(this.error);
// }
// class NewsSearchLoading extends NewsStates {}

// class NewsSearchSuccess extends NewsStates {}

