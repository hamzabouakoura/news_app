import 'package:flutter/material.dart';

import '../../../../../core/utils/custom_search_by_category_item.dart';

class CustomTabBarView extends StatelessWidget {
  const CustomTabBarView({super.key, required this.tabController});
  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: tabController,
      children: const [
        CustomSearchByCategoryItem(),
        CustomSearchByCategoryItem(),
        CustomSearchByCategoryItem(),
        CustomSearchByCategoryItem(),
        CustomSearchByCategoryItem(),
        CustomSearchByCategoryItem(),
      ],
    );
  }
}
