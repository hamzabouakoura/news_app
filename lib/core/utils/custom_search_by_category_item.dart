import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/utils/custom_error_widget.dart';
import 'package:news_app/core/utils/custom_loading_widget.dart';
import 'package:news_app/core/utils/styles.dart';
import 'package:news_app/features/search/presentation/manager/cubits/search_by_category_cubit/search_by_category_cubit.dart';

class CustomSearchByCategoryItem extends StatelessWidget {
  const CustomSearchByCategoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchByCategoryCubit, SearchByCategoryState>(
      builder: (context, state) {
        if (state is SearchByCategorySuccess) {
          return ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  GoRouter.of(context)
                      .pushNamed('details', extra: state.news[index]);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
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
                              imageUrl: state.news[index].urlToImage ??
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
                              state.news[index].title ?? 'Non title',
                              style: Styles.boldMeduimTitlesStyle,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 110,
                                  child: Text(
                                    state.news[index].source!.name ?? '',
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: Styles.subtitleStyle,
                                  ),
                                ),
                                Text(
                                  state.news[index].publishedAt!
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
        } else if (state is SearchByCategoryFailure) {
          return const CustomErrorWidget();
        } else {
          return const CustomLoadingWidget();
        }
      },
    );
  }
}
