import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:news_app/core/errors/faillures.dart';
import 'package:news_app/core/utils/api_services.dart';
import 'package:news_app/features/home/data/models/news_model/news_model.dart';
import 'package:news_app/features/search/data/repos/search_repo.dart';

class SearchRepoImpl implements SearchRepo {
  final ApiServices apiServices;

  SearchRepoImpl({required this.apiServices});
  @override
  Future<Either<Failure, List<NewsModel>>> getSearchResultsByCategory(
      {required String category}) async {
    var data = await apiServices.get(
        endPoint: 'top-headlines?country=us&category=$category');
    List<NewsModel> news = [];
    for (var article in data['articles']) {
      news.add(NewsModel.fromJson(article));
    }
    return Right(news);
  }

  @override
  Future<Either<Failure, List<NewsModel>>> getSearchResults(
      {required String topic}) async {
    try {
      var data = await apiServices.get(endPoint: 'top-headlines?q=$topic');
      List<NewsModel> news = [];
      if (data['articles'] == null) {
        return left(const ServerFailure('No results'));
      } else {
        for (var article in data['articles']) {
          news.add(NewsModel.fromJson(article));
        }
        return Right(news);
      }
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
