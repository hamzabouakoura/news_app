import 'package:dartz/dartz.dart';
import 'package:news_app/core/errors/faillures.dart';
import 'package:news_app/features/home/data/models/news_model/news_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<NewsModel>>> getBreakingNews();
  Future<Either<Failure, NewsModel>> getNewsOfTheDay();
}
