import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/utils/service_locator.dart';
import 'package:news_app/features/favorite/presentation/manager/favorite_cubit/favorite_cubit.dart';
import 'package:news_app/features/favorite/presentation/views/favorite_view.dart';
import 'package:news_app/features/home/data/models/news_model/news_model.dart';
import 'package:news_app/features/home/data/repos/home_repo_impl.dart';
import 'package:news_app/features/home/presentation/manager/home_page_cubit/breaking_news_cubit.dart';
import 'package:news_app/features/home/presentation/manager/news_otd_cubit/news_otd_cubit.dart';
import 'package:news_app/features/home/presentation/views/news_details_view.dart';
import 'package:news_app/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:news_app/features/search/presentation/views/news_by_category_view.dart';
import 'package:news_app/features/search/presentation/views/search_view.dart';
import 'package:news_app/features/splash/presentation/views/splash_view.dart';

import '../../features/home/presentation/views/home_view.dart';

class AppRouter {
  AppRouter._();
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _rootNavigatorHome =
      GlobalKey<NavigatorState>(debugLabel: 'shellHome');
  static final _rootNavigatorSearch =
      GlobalKey<NavigatorState>(debugLabel: 'shellSearch');
  static final _rootNavigatorFavorite =
      GlobalKey<NavigatorState>(debugLabel: 'shellFavorite');

  static String initR = '/splash';
  static final router = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: initR,
    navigatorKey: _rootNavigatorKey,
    routes: [
      GoRoute(
        path: '/splash',
        name: 'splash',
        builder: (context, state) => SplashView(
          key: state.pageKey,
        ),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return HomeView(navigationShell: navigationShell);
        },
        branches: [
          // Home Branch
          StatefulShellBranch(
            navigatorKey: _rootNavigatorHome,
            routes: <RouteBase>[
              GoRoute(
                path: '/home',
                name: 'home',
                builder: (context, state) => MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) =>
                          BreakingNewsCubit(getIt.get<HomeRepoImpl>())
                            ..getBreakingNews(),
                    ),
                    BlocProvider(
                      create: (context) =>
                          NewsOtdCubit(getIt.get<HomeRepoImpl>())
                            ..getNewsOfTheDay(),
                    ),
                  ],
                  child: HomeViewBody(
                    key: state.pageKey,
                  ),
                ),
                routes: [
                  GoRoute(
                    path: 'details',
                    name: 'details',
                    builder: (context, state) => BlocProvider(
                      create: (context) => FavoriteCubit(),
                      child: NewsDetailsView(
                        key: state.pageKey,
                        newsModel: state.extra as NewsModel,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          // Search Branch
          StatefulShellBranch(
            navigatorKey: _rootNavigatorSearch,
            routes: <RouteBase>[
              GoRoute(
                path: '/search',
                name: 'search',
                builder: (context, state) => NewsByCategoryView(
                  key: state.pageKey,
                ),
                routes: [
                  GoRoute(
                    path: 'searchV',
                    name: 'searchV',
                    builder: (context, state) => SearchView(
                      key: state.pageKey,
                    ),
                  ),
                ],
              ),
            ],
          ),
          // Favorite Branch
          StatefulShellBranch(
            navigatorKey: _rootNavigatorFavorite,
            routes: <RouteBase>[
              GoRoute(
                path: '/favorite',
                name: 'favorite',
                builder: (context, state) => BlocProvider(
                  create: (context) => FavoriteCubit()..fetchFavoriteNews(),
                  child: FavoriteView(
                    key: state.pageKey,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
