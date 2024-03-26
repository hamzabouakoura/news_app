import 'package:flutter/material.dart';
import 'package:news_app/core/utils/styles.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar(
      {super.key, required this.tabController, required this.onTap});
  final TabController tabController;
  final void Function(int) onTap;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: TabBar(
        onTap: onTap,
        labelStyle: Styles.boldMeduimTitlesStyle,
        isScrollable: true,
        labelColor: Colors.black,
        indicatorColor: Colors.black87,
        indicatorPadding: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.only(bottom: 8),
        unselectedLabelColor: Colors.black54,
        controller: tabController,
        tabs: const [
          Tab(text: 'Health'),
          Tab(text: 'Politics'),
          Tab(text: 'General'),
          Tab(text: 'Entertainment'),
          Tab(text: 'Business'),
          Tab(text: 'Sports'),
        ],
      ),
    );
  }
}
