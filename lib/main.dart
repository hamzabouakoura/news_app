import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app_router.dart';
import 'package:news_app/core/utils/service_locator.dart';

void main() {
  setupServiceLocator();
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.white,
      ),
      routerConfig: AppRouter.router,
    );
  }
}
