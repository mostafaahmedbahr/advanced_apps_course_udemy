abstract class WeatherStates{}

class WeatherInitState extends WeatherStates{}

class WeatherLoadingState extends WeatherStates{}
class WeatherSuccessState extends WeatherStates{}
class WeatherErrorState extends WeatherStates{
  final String error;

  WeatherErrorState(this.error);

}