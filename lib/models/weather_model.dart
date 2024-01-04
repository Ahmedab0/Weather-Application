class WeatherModel {
  final String cityName;
  final DateTime date;
  final String img;
  final double temp;
  final double maxTemp;
  final double minTemp;
  final String weatherCond;

  WeatherModel({
    required this.cityName,
    required this.date,
    required this.img,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
    required this.weatherCond,
  });

  factory WeatherModel.fromJson(json) {
    return WeatherModel(
      cityName: json["location"]["name"],
      date: DateTime.parse(json['current']['last_updated']),
      img: json["forecast"]["forecastday"][0]["day"]["condition"]["icon"],
      temp: json["forecast"]["forecastday"][0]["day"]['avgtemp_c'],
      maxTemp: json["forecast"]["forecastday"][0]["day"]['maxtemp_c'],
      minTemp: json["forecast"]["forecastday"][0]["day"]['mintemp_c'],
      weatherCond: json["forecast"]['forecastday'][0]["day"]["condition"]['text'],
    );
  }
}
