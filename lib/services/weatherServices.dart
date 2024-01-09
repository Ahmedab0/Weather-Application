
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherServices {
  final dio = Dio();

  String baseUrl = 'http://api.weatherapi.com/v1';
  String apiKey = 'f5d2f1a12fec4406b90221038233112';

  Future<WeatherModel> fetchWeatherInfo(String country) async {
    final String url = "$baseUrl/forecast.json?key=$apiKey&q=$country&days=1";

    try {
      final response = await dio.get(url);
      var jsonData = response.data;
      WeatherModel weatherModel = WeatherModel.fromJson(jsonData);
      log('Fetch Data Calling');
      log(weatherModel.cityName);
      return weatherModel;
    } on DioException catch (e) {
      final String messageError = e.response?.data['error']['message'] ??
          'OOPS There was an error, try later';
      throw Exception(messageError);
    } catch (e) {
      log('$e');
      throw Exception('OOPS There was an error, try later');
    }
  }
}
