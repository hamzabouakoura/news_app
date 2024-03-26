import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/utils/service_locator.dart';
import 'package:news_app/features/search/data/repos/search_repo_impl.dart';
import 'package:news_app/features/search/presentation/manager/cubits/search_by_category_cubit/search_by_category_cubit.dart';
import 'package:news_app/features/search/presentation/views/widgets/news_by_category_view_body.dart';

class NewsByCategoryView extends StatelessWidget {
  const NewsByCategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => SearchByCategoryCubit(
          getIt.get<SearchRepoImpl>(),
        )..getSearchResultsByCategory(category: 'health'),
        child: const NewsByCategoryViewBody(),
      ),
    );
  }
}
