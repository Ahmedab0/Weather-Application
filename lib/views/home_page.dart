import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/widget/weather_info.dart';

import '../cubits/get_weather_cubit/get_weather_state.dart';
import '../widget/no_weather_widget.dart';
import 'search_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Today\'s Weather', style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold)),
        //centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        //foregroundColor: Colors.white,
        //backgroundColor: Theme.of(context).colorScheme.primary,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const SearchScreen()));
            },
            icon: const Icon(Icons.search,size: 30),
          ),
        ],
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is InitialWeatherState) {
            return const NoWeather();
          } else if (state is WeatherLoadSuccessState) {
            return const WeatherInfo();
          } else {
            return const Center(
                child: Text(
              'Oops There was an error!',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ));
          }
        },
      ),
    );
  }
}
