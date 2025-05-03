import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_applications_course_udemy_2025/weather_app/cubit/weather_cubit.dart';
import 'package:flutter_advanced_applications_course_udemy_2025/weather_app/dio/dio.dart';
import 'package:flutter_advanced_applications_course_udemy_2025/weather_app/dio/sh.dart';
import 'package:flutter_advanced_applications_course_udemy_2025/weather_app/screens/weather_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/bloc_observer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesHelper.init();
  DioHelper.init();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>WeatherCubit()..getWeatherData(location: "giza"),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const WeatherScreen(),
      ),
    );
  }
}


