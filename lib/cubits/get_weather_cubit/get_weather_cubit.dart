
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/models/weather_model.dart';

import '../../services/weatherServices.dart';
import 'get_weather_state.dart';

// 2 # create cubit
class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(InitialWeatherState());

  WeatherModel? weatherModel;

// 3 # create function
  getWeather (value) async {
    try {
      weatherModel= await WeatherServices().fetchWeatherInfo(value);
      emit(WeatherLoadSuccessState());
    } catch (e) {
      emit(WeatherFailureState());
    }
  }

}