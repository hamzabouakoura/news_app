import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/utils/custom_loading_widget.dart';

import '../../manager/home_page_cubit/breaking_news_cubit.dart';
import 'custom_breakingnews_item.dart';

class BreakingNewsListView extends StatelessWidget {
  const BreakingNewsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BreakingNewsCubit, BreakingNewsState>(
      builder: (context, state) {
        if (state is BreakingNewsSuccess) {
          return ListView.builder(
            itemCount: 7,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  GoRouter.of(context)
                      .pushNamed('details', extra: state.news[index]);
                },
                child: CustomBreakingNewsItem(
                  newsModel: state.news[index],
                ),
              );
            },
          );
        } else if (state is BreakingNewsFailure) {
          return const Center(
            child: Text('Somthing went wrong'),
          );
        } else {
          return const CustomLoadingWidget();
        }
      },
    );
  }
}
