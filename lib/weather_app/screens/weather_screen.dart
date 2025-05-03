import 'package:flutter/material.dart';
import 'package:flutter_advanced_applications_course_udemy_2025/weather_app/cubit/weather_cubit.dart';
import 'package:flutter_advanced_applications_course_udemy_2025/weather_app/cubit/weather_states.dart';
import 'package:flutter_advanced_applications_course_udemy_2025/weather_app/screens/search_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit,WeatherStates>(
      builder: (context,state){
        var weatherCubit = WeatherCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context){
                  return   SearchScreen();
                }));
              }, icon: const Icon(Icons.search)),
            ],
            title: const Text("Weather App"),
          ),
          body:
          state is WeatherLoadingState ? const Center(child: CircularProgressIndicator()):
              state is WeatherErrorState ? Center(child: Text(state.error.toString())):
                  weatherCubit.weatherDataModel==null ? const Text("No Data"):
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  const SizedBox(height: 50,),
                  Image.network("https:${weatherCubit.weatherDataModel!.current!.condition!.icon}"),
                  const SizedBox(height: 20,),
                  Text("${weatherCubit.weatherDataModel!.current!.tempC} C",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                  ),),
                  Text("${weatherCubit.weatherDataModel!.location!.name}",
                    style: const TextStyle(
                      fontSize: 30,
                    ),),
                ],
              ),
            ),
          ),
        );
      },

    );
  }
}
