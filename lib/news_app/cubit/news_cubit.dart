 import 'package:flutter_advanced_applications_course_udemy_2025/core/end_points.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/dio.dart';
import '../models/news_data_model.dart';
import 'news_states.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitState());

  static NewsCubit get(context) => BlocProvider.of(context);


  NewsDataModel? newsDataModel;
  getNewsData({required String country,required String category})
  {
    emit(NewsLoadingState());
    DioHelper.getData(url: "$newsCurrentUrl?country=$country&category=$category&apiKey=$newsApiKey")
        .then((value){
     newsDataModel = NewsDataModel.fromJson(value.data);
     print(newsDataModel!.articles!.length);
          emit(NewsSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(NewsErrorState(error.toString()));
    });
  }

}