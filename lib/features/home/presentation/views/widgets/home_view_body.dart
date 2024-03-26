import 'package:flutter/material.dart';
import 'package:news_app/features/home/presentation/views/widgets/news_of_theday.dart';

import 'breaking_news_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      shrinkWrap: true,
      slivers: [
        SliverToBoxAdapter(
          child: NewsOfTheDay(),
        ),
        SliverFillRemaining(
          child: BreakingNewsListView(),
        )
      ],
    );
  }
}
