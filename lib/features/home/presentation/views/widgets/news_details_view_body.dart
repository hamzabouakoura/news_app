import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/utils/custom_loading_widget.dart';
import 'package:news_app/core/utils/styles.dart';
import 'package:news_app/features/home/data/models/news_model/news_model.dart';

class NewsDetailsViewBody extends StatelessWidget {
  const NewsDetailsViewBody({super.key, required this.newsModel});
  final NewsModel newsModel;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return CustomScrollView(physics: const BouncingScrollPhysics(), slivers: [
      SliverFillRemaining(
        child: Stack(
          children: [
            CachedNetworkImage(
              imageUrl: newsModel.urlToImage ?? '',
              placeholder: (context, url) => const CustomLoadingWidget(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              imageBuilder: (context, imageProvider) {
                return Container(
                  padding: const EdgeInsets.all(24),
                  height: size.height * 0.6,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      colorFilter: const ColorFilter.mode(
                          Colors.black45, BlendMode.darken),
                      fit: BoxFit.fill,
                      image: imageProvider,
                    ),
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
                          newsModel.source!.name ?? 'Unknown',
                          style:
                              Styles.mediumStyle.copyWith(color: Colors.white),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        newsModel.title!,
                        style: Styles.boldBigTitlesStyle
                            .copyWith(color: Colors.white),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Spacer(),
                    ],
                  ),
                );
              },
            ),
            Positioned(
              bottom: 0,
              top: size.height * 0.55,
              right: 0,
              left: 0,
              child: Container(
                padding: const EdgeInsets.all(16),
                height: size.height * 0.45,
                width: size.width,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        newsModel.description ?? '',
                        style: Styles.boldMeduimTitlesStyle,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        newsModel.content ?? '',
                        style: Styles.mediumStyle,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ]);
  }
}
