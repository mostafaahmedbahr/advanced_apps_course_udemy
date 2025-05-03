import 'package:dio/dio.dart';
import 'package:flutter_advanced_applications_course_udemy_2025/weather_app/dio/end_points.dart';
import 'package:flutter_advanced_applications_course_udemy_2025/weather_app/dio/sh.dart';



class DioHelper
{
  static Dio? dio;
  static init()
  {
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    Map<String ,dynamic>? query,
    String? token,
  }) async
  {
    dio!.options.headers=
    {
      // "Accept":"application/json",
      // "Content-Type":"application/json",
      // if(SharedPreferencesHelper.getData(key: "token") !=null )
      //   "token":"${SharedPreferencesHelper.getData(key: "token")}",
    };
    return await dio!.get(
      url,
      queryParameters: query,
    );
  }


  static Future<Response> postData({
    required String url,
    dynamic data,
    String? token,
  })async
  {
    dio!.options.headers=
    {
      "Accept":"application/json",
      "Content-Type" :"application/json",
      if(SharedPreferencesHelper.getData(key: "token") !=null )
        "token":"${SharedPreferencesHelper.getData(key: "token")}",
    };
    return   await dio!.post(
      url,
      data: data,
    );
  }

  static Future<Response> putData({
    required String url,
    Map<String ,dynamic>? query,
    dynamic data,
    String lang = "en",
    String? token,
  })async
  {
    dio!.options.headers=
    {
      "Accept":"application/json",
      if(SharedPreferencesHelper.getData(key: "token") !=null )
        "token":"${SharedPreferencesHelper.getData(key: "token")}",
    };
    return await dio!.put(
      url,
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response> deleteData({
    required String url,
    Map<String ,dynamic>? query,
    required Map<String,dynamic> data,
    String? token,
  })async
  {
    dio!.options.headers=
    {
      "Accept":"application/json",
      if(SharedPreferencesHelper.getData(key: "token") !=null )
        "token":"${SharedPreferencesHelper.getData(key: "token")}",

    };
    return await dio!.delete(
      url,
      queryParameters: query,
      data: data,
    );
  }


  static Future<Response> patchData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String? token,
  }) async {
    dio!.options.headers = {
      "Accept": "application/json",
      if (SharedPreferencesHelper.getData(key: "token") != null)
        "token": "${SharedPreferencesHelper.getData(key: "token")}",
    };
    try {
      // Make the PATCH request
      return await dio!.patch(
        url,
        queryParameters: query,
        data: data,
      );
    } catch (error) {
      // Handle any errors that occur during the request
      rethrow;
    }
  }


}