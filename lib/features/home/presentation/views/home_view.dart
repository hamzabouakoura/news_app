import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'widgets/bottom_nav_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key, required this.navigationShell});
  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: navigationShell,
      bottomNavigationBar: BottomNavBarWidget(
        navigationShell: navigationShell,
      ),
    );
  }
}
