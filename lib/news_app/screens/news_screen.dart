import 'package:flutter/material.dart';
import 'package:flutter_advanced_applications_course_udemy_2025/news_app/cubit/news_cubit.dart';
import 'package:flutter_advanced_applications_course_udemy_2025/news_app/cubit/news_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/article_item.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit,NewsStates>(
      builder: (context,state){
        var newsCubit = NewsCubit.get(context);

        return Scaffold(
          appBar: AppBar(
            title: const Text("News App"),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child:
            state is NewsLoadingState?const Center(child: CircularProgressIndicator(),):
            ListView.separated(
                itemBuilder: (context,index){
                  var article = newsCubit.newsDataModel!.articles![index];
                  return ArticleItem(
                    image:

                    article.urlToImage.toString(),
                  );
                },
                separatorBuilder:  (context,index){
                  return const SizedBox(height: 10,);
                },
                itemCount: newsCubit.newsDataModel!.articles!.length,
            ),
          ),
        );
      },

    );
  }
}
