import 'package:dartz/dartz.dart';
import 'package:news_app/core/errors/faillures.dart';
import 'package:news_app/features/home/data/models/news_model/news_model.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<NewsModel>>> getSearchResultsByCategory(
      {required String category});
  Future<Either<Failure, List<NewsModel>>> getSearchResults(
      {required String topic});
}
