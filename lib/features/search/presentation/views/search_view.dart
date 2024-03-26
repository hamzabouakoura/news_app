import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/search/data/repos/search_repo_impl.dart';
import 'package:news_app/features/search/presentation/views/widgets/search_view_body.dart';

import '../../../../core/utils/service_locator.dart';
import '../manager/cubits/search_results_cubit/search_results_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => SearchResultsCubit(
          getIt.get<SearchRepoImpl>(),
        ),
        child: const SearchViewBody(),
      ),
    );
  }
}
