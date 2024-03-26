import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/utils/custom_error_widget.dart';
import 'package:news_app/core/utils/custom_loading_widget.dart';
import 'package:news_app/core/utils/styles.dart';
import 'package:news_app/features/home/presentation/manager/news_otd_cubit/news_otd_cubit.dart';

class NewsOfTheDay extends StatelessWidget {
  const NewsOfTheDay({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocBuilder<NewsOtdCubit, NewsOtdState>(
      builder: (context, state) {
        if (state is NewsOfTheDaySuccess) {
          return GestureDetector(
            onTap: () {
              GoRouter.of(context).goNamed('details', extra: state.newsOTD);
            },
            child: Column(
              children: [
                CachedNetworkImage(
                  imageUrl: state.newsOTD.urlToImage ??
                      'https://images.pexels.com/photos/16693267/pexels-photo-16693267/free-photo-of-vintage-peugeot-404.jpeg?auto=compress&cs=tinysrgb&w=600',
                  placeholder: (context, url) => const CustomLoadingWidget(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  imageBuilder: (context, imageProvider) {
                    return Container(
                      padding: const EdgeInsets.all(24),
                      height: size.height * 0.5,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          colorFilter: const ColorFilter.mode(
                              Colors.black45, BlendMode.darken),
                          fit: BoxFit.cover,
                          image: imageProvider,
                        ),
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(32),
                            bottomRight: Radius.circular(32)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Spacer(
                            flex: 5,
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              backgroundBlendMode: BlendMode.lighten,
                              borderRadius: BorderRadius.circular(16),
                              color: Colors.white38,
                            ),
                            child: Text(
                              'News of the day',
                              style: Styles.mediumStyle
                                  .copyWith(color: Colors.white),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            state.newsOTD.title!,
                            style: Styles.boldBigTitlesStyle
                                .copyWith(color: Colors.white),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'See details --> ',
                            style: Styles.boldMeduimTitlesStyle
                                .copyWith(color: Colors.white),
                          ),
                          const Spacer(),
                        ],
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Breaking News',
                        style: Styles.boldBigTitlesStyle,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'More',
                          style: Styles.semiboldStyle
                              .copyWith(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        } else if (state is NewsOfTheDayFailure) {
          return const CustomErrorWidget();
        } else {
          return const CustomLoadingWidget();
        }
      },
    );
  }
}
