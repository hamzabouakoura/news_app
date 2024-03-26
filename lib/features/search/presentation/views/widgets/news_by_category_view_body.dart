import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/utils/styles.dart';
import 'package:news_app/features/search/presentation/views/widgets/custom_tab_bar_views.dart';
import 'package:news_app/features/search/presentation/views/widgets/custom_text_field.dart';
import 'package:news_app/features/search/presentation/views/widgets/tab_bar.dart';

import '../../manager/cubits/search_by_category_cubit/search_by_category_cubit.dart';

class NewsByCategoryViewBody extends StatefulWidget {
  const NewsByCategoryViewBody({super.key});

  @override
  State<NewsByCategoryViewBody> createState() => _NewsByCategoryViewBodyState();
}

class _NewsByCategoryViewBodyState extends State<NewsByCategoryViewBody>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 6, vsync: this);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Discover',
                      style: Styles.boldBigTitlesStyle.copyWith(fontSize: 32),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      'News from all over the world',
                      style: Styles.subtitleStyle,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: CustomTextField(
                        onTap: () => GoRouter.of(context).goNamed('searchV'),
                        readOnly: true,
                        hint: 'Search',
                      ),
                    ),
                    CustomTabBar(
                      onTap: (index) {
                        switch (index) {
                          case 1:
                            BlocProvider.of<SearchByCategoryCubit>(context)
                                .getSearchResultsByCategory(
                                    category: 'politics');
                            break;
                          case 2:
                            BlocProvider.of<SearchByCategoryCubit>(context)
                                .getSearchResultsByCategory(
                                    category: 'general');
                            break;
                          case 3:
                            BlocProvider.of<SearchByCategoryCubit>(context)
                                .getSearchResultsByCategory(
                                    category: 'entertainment');
                            break;
                          case 4:
                            BlocProvider.of<SearchByCategoryCubit>(context)
                                .getSearchResultsByCategory(
                                    category: 'business');
                            break;
                          case 5:
                            BlocProvider.of<SearchByCategoryCubit>(context)
                                .getSearchResultsByCategory(category: 'sports');
                            break;
                          default:
                            BlocProvider.of<SearchByCategoryCubit>(context)
                                .getSearchResultsByCategory(category: 'health');
                        }
                      },
                      tabController: tabController,
                    ),
                  ],
                ),
              ),
            ),
            SliverFillRemaining(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: CustomTabBarView(tabController: tabController),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
