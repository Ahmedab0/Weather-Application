
// 1 # create state

class WeatherState {}
class InitialWeatherState extends WeatherState {}
class WeatherLoadSuccessState extends WeatherState {
 /* WeatherLoadSuccessState(this.weatherModel);
  final WeatherModel weatherModel;*/
}
class WeatherFailureState extends WeatherState {}