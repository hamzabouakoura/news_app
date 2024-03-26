import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/favorite/presentation/manager/favorite_cubit/favorite_cubit.dart';
import 'package:news_app/features/favorite/presentation/manager/list_of_favorites.dart';
import 'package:news_app/features/home/data/models/news_model/news_model.dart';

import 'widgets/news_details_view_body.dart';

class NewsDetailsView extends StatelessWidget {
  const NewsDetailsView({super.key, required this.newsModel});
  final NewsModel newsModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              if (favorites.contains(newsModel)) {
                log('news already added to favorite list');
              } else {
                BlocProvider.of<FavoriteCubit>(context)
                    .addFavoriteNews(newsModel);

                log('favorite news added');
              }
            },
            icon: const Icon(Icons.favorite),
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: NewsDetailsViewBody(
        newsModel: newsModel,
      ),
    );
  }
}
