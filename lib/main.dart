 import 'package:flutter/material.dart';
import 'package:flutter_advanced_applications_course_udemy_2025/news_app/cubit/news_cubit.dart';
import 'package:flutter_advanced_applications_course_udemy_2025/note_app/note_cubit/notes_cubit.dart';
  import 'package:flutter_advanced_applications_course_udemy_2025/core/sh.dart';
 import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'core/bloc_observer.dart';
import 'core/dio.dart';
 import 'note_app/note_screens/notes_on_boarding_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
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
       // BlocProvider(create: (context)=>WeatherCubit()..getWeatherData(location: "giza"),),
        BlocProvider(create: (context)=>NewsCubit()..getNewsData(country: "us",category: "technology"),),
        BlocProvider(create: (context)=>NotesCubit()..initHive(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const OnBoardingNoteScreen(),
        builder: (context, child) => ResponsiveBreakpoints.builder(
          child: child!,
          breakpoints: _getResponsiveBreakpoints(),
        ),
      ),
    );
  }
}

 List<Breakpoint> _getResponsiveBreakpoints() {
   return [
     const Breakpoint(start: 0, end: 450, name: MOBILE),
     const Breakpoint(start: 451, end: 800, name: TABLET),
     const Breakpoint(start: 801, end: 1920, name: DESKTOP),
     const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
   ];
 }

