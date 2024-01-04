import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherInfo extends StatelessWidget {
  const WeatherInfo({super.key});

  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel = BlocProvider.of<GetWeatherCubit>(context,listen: true).weatherModel!;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Theme.of(context).primaryColor,
          Theme.of(context).primaryColor.withOpacity(0.8),
          Theme.of(context).primaryColor.withOpacity(0.6),
          Theme.of(context).primaryColor.withOpacity(0.4),
          Theme.of(context).primaryColor.withOpacity(0.2),
        ],
            begin: Alignment.topCenter, end: Alignment.bottomCenter),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            weatherModel.cityName,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 28,
            ),
          ),
          Text(
            'Update at ${weatherModel.date.hour} : ${weatherModel.date.minute}',
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 28,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FadeInImage(
                fit: BoxFit.fill,
                width: 65,
                height: 65,
                placeholder: const AssetImage('asset/images/clear.png'),
                image: NetworkImage('https:${weatherModel.img}'),
              ),
              Text(
                weatherModel.temp.round().toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                ),
              ),
              Column(
                children: [
                  Text(
                    'MaxTemp: ${weatherModel.maxTemp.round()}',
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'MinTemp: ${weatherModel.minTemp.round()}',
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 32,
          ),
          Text(
            weatherModel.weatherCond,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 28,
            ),
          ),
        ],
      ),
    );
  }
}
