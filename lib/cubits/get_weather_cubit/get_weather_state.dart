
// 1 # create state

abstract class WeatherState {}
class InitialWeatherState extends WeatherState {}

class WeatherLoadingState extends WeatherState {}

class WeatherLoadSuccessState extends WeatherState {
 /* WeatherLoadSuccessState(this.weatherModel);
  final WeatherModel weatherModel;*/
}
class WeatherFailureState extends WeatherState {
 final String errorMsg;

  WeatherFailureState({required this.errorMsg});
}
