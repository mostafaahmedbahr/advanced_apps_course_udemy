abstract class NewsStates{}

class NewsInitState extends NewsStates{}

class NewsLoadingState extends NewsStates{}
class NewsSuccessState extends NewsStates{}
class NewsErrorState extends NewsStates{
  final String error;

  NewsErrorState(this.error);

}