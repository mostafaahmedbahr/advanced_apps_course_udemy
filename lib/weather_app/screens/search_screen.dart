import 'package:flutter/material.dart';
import 'package:flutter_advanced_applications_course_udemy_2025/weather_app/cubit/weather_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatelessWidget {
    SearchScreen({super.key,   this.location});
    String? location;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              onChanged: (data){
                location = data;

              },
              onSubmitted: (data) async{
                location = data;
                context.read<WeatherCubit>().getWeatherData(location: location!);
                Navigator.pop(context);
              },
            ),
            const SizedBox(height: 20,),
            ElevatedButton(onPressed: (){
              context.read<WeatherCubit>().getWeatherData(location: location!);
              Navigator.pop(context);
            }, child: const Text("Search")),
          ],
        ),
      ),
    );
  }
}
