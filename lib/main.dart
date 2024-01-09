import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_state.dart';

import 'views/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) {
          return BlocBuilder<GetWeatherCubit,WeatherState>(
            builder: (context, state) =>
            MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primaryColor: _getWeatherColor(BlocProvider.of<GetWeatherCubit>(context).weatherModel?.weatherCond),
                primarySwatch: _getWeatherColor(BlocProvider.of<GetWeatherCubit>(context).weatherModel?.weatherCond),
                //colorScheme: const ColorScheme.light(primary: Colors.blue),
                useMaterial3: true,
              ),
              home: const HomePage(),
            ),
          );
        }
      ),
    );
  }
}


MaterialColor _getWeatherColor(String? condition) {

  if (condition == null) {
    return Colors.blue;
  }

  if (condition == 'Sunny' || condition == 'Clear') {
    return Colors.orange;
  } else if (condition.contains('snow') ||
      condition.contains('sleet') ||
      condition.contains('freezing') ||
      condition.contains('blizzard') ||
      //condition.contains('Cloudy') ||
      condition.contains('rain') ||
      condition.contains('ice pellets')) {
    return Colors.grey;
  } else {
    return Colors.blue;
  }
}