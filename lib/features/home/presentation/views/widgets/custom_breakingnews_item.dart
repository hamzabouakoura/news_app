import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/utils/custom_loading_widget.dart';
import 'package:news_app/core/utils/styles.dart';
import 'package:news_app/features/home/data/models/news_model/news_model.dart';

class CustomBreakingNewsItem extends StatelessWidget {
  const CustomBreakingNewsItem({super.key, required this.newsModel});
  final NewsModel newsModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8, top: 8),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: CachedNetworkImage(
                imageUrl: newsModel.urlToImage ??
                    'https://images.pexels.com/photos/16693267/pexels-photo-16693267/free-photo-of-vintage-peugeot-404.jpeg?auto=compress&cs=tinysrgb&w=600',
                fit: BoxFit.fill,
                height: 150,
                width: 240,
                placeholder: (context, url) => const CustomLoadingWidget(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
          SizedBox(
            width: 240,
            child: Text(
              newsModel.title!,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: Styles.boldMeduimTitlesStyle,
            ),
          ),
          SizedBox(
            width: 240,
            child: Text(
              newsModel.author ?? '',
              overflow: TextOverflow.ellipsis,
              style: Styles.subtitleStyle,
            ),
          ),
          Text(
            newsModel.publishedAt!,
            style: Styles.subtitleStyle,
          ),
        ],
      ),
    );
  }
}
