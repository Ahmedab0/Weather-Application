
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('Search City',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Theme.of(context).primaryColor,
            //Theme.of(context).primaryColor.withOpacity(0.8),
            Theme.of(context).primaryColor.withOpacity(0.6),
            Theme.of(context).primaryColor.withOpacity(0.4),
            Theme.of(context).primaryColor.withOpacity(0.2),
          ],
              begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        child: Center(
          child: Card(
            elevation: 6,
            child: TextField(
              onSubmitted: (value) {
                BlocProvider.of<GetWeatherCubit>(context).getWeather(value);
                Navigator.pop(context);
              },
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 32,horizontal: 16),
                suffixIcon: Icon(Icons.search),
                label: Text('Search'),
                labelStyle: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black),
                hintText: 'Enter Your City Name',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black45),
                  ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black45),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black45),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}