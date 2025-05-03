import 'package:flutter/material.dart';
import 'package:flutter_advanced_applications_course_udemy_2025/weather_app/cubit/weather_states.dart';
 import 'package:flutter_advanced_applications_course_udemy_2025/core/end_points.dart';
import 'package:flutter_advanced_applications_course_udemy_2025/weather_app/models/weather_data_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/dio.dart';

class WeatherCubit extends Cubit<WeatherStates> {
  WeatherCubit() : super(WeatherInitState());

  static WeatherCubit get(context) => BlocProvider.of(context);


  WeatherDataModel? weatherDataModel;
  getWeatherData({required String location})
  {
    emit(WeatherLoadingState());
    DioHelper.getData(url: "$currentUrl?key=$apiKey&q=$location&aqi=yes")
        .then((value){
         // print(value.data);
        weatherDataModel = WeatherDataModel.fromJson(value.data);
          emit(WeatherSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(WeatherErrorState(error.toString()));
    });
  }

}