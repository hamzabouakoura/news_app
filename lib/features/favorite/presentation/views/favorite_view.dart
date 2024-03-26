import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/utils/custom_error_widget.dart';
import 'package:news_app/core/utils/custom_loading_widget.dart';
import 'package:news_app/features/favorite/presentation/manager/favorite_cubit/favorite_cubit.dart';

import '../../../../core/utils/styles.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<FavoriteCubit, FavoriteState>(
          listener: (context, state) {
            if (state is FavoriteAdded) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('News added to favorite list'),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is FavoriteSuccess) {
              BlocProvider.of<FavoriteCubit>(context).fetchFavoriteNews();

              return ListView.builder(
                itemCount: state.favNews.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      GoRouter.of(context)
                          .pushNamed('details', extra: state.favNews[index]);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      child: Row(
                        children: [
                          SizedBox(
                            height: 90,
                            child: AspectRatio(
                              aspectRatio: 3.5 / 3,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: CachedNetworkImage(
                                  fit: BoxFit.cover,
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                  imageUrl: state.favNews[index].urlToImage ??
                                      'https://images.pexels.com/photos/16693267/pexels-photo-16693267/free-photo-of-vintage-peugeot-404.jpeg?auto=compress&cs=tinysrgb&w=600',
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  state.favNews[index].title ?? 'Non title',
                                  style: Styles.boldMeduimTitlesStyle,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: 110,
                                      child: Text(
                                        state.favNews[index].source!.name ?? '',
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: Styles.subtitleStyle,
                                      ),
                                    ),
                                    Text(
                                      state.favNews[index].publishedAt!
                                          .substring(0, 10),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: Styles.subtitleStyle,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else if (state is FavoriteFailure) {
              return const CustomErrorWidget();
            } else if (state is FavoriteLoading) {
              return const CustomLoadingWidget();
            } else {
              return const Center(
                child: Text('Your Card is empty'),
              );
            }
          },
        ),
      ),
    );
  }
}
