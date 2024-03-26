import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/utils/styles.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    navigateToHome();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Keep updated',
          style: Styles.largeStyle,
        ),
      ),
    );
  }

  void navigateToHome() {
    Future.delayed(const Duration(seconds: 1), () {
      GoRouter.of(context).goNamed('home');
    });
  }
}
