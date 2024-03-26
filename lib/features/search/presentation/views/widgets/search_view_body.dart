import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/custom_error_widget.dart';
import '../../../../../core/utils/custom_loading_widget.dart';
import '../../manager/cubits/search_results_cubit/search_results_cubit.dart';
import 'custom_search_item.dart';
import 'custom_text_field.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          CustomTextField(
            onTap: () => GoRouter.of(context).goNamed('searchV'),
            onChanged: (value) {
              if (value.isNotEmpty) {
                BlocProvider.of<SearchResultsCubit>(context)
                    .getSearchResults(topic: value);
              }
            },
            hint: 'Search',
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: BlocBuilder<SearchResultsCubit, SearchResultsState>(
                builder: (context, state) {
                  if (state is SearchResultsSuccess) {
                    return SizedBox(
                      height: 390,
                      child: CustomSearchItem(news: state.news),
                    );
                  } else if (state is SearchResultsFailure) {
                    return const CustomErrorWidget();
                  } else if (state is SearchResultsLoading) {
                    return const CustomLoadingWidget();
                  } else {
                    return const Center(
                      child: Text('Search for your news'),
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
