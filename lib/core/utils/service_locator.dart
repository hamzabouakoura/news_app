import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:news_app/core/utils/api_services.dart';
import 'package:news_app/features/search/data/repos/search_repo_impl.dart';

import '../../features/home/data/repos/home_repo_impl.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiServices>(
    ApiServices(
      Dio(),
    ),
  );
  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      apiServices: getIt.get<ApiServices>(),
    ),
  );
  getIt.registerSingleton<SearchRepoImpl>(
    SearchRepoImpl(
      apiServices: getIt.get<ApiServices>(),
    ),
  );
}
