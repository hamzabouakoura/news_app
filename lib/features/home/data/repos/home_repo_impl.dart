import 'package:dartz/dartz.dart';
import 'package:news_app/core/errors/faillures.dart';
import 'package:news_app/core/utils/api_services.dart';
import 'package:news_app/features/home/data/models/news_model/news_model.dart';
import 'package:news_app/features/home/data/repos/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiServices apiServices;

  HomeRepoImpl({required this.apiServices});
  @override
  Future<Either<Failure, List<NewsModel>>> getBreakingNews() async {
    var data = await apiServices.get(endPoint: 'top-headlines?country=us');
    List<NewsModel> news = [];
    for (var article in data['articles']) {
      news.add(NewsModel.fromJson(article));
    }
    return Right(news);
  }

  @override
  Future<Either<Failure, NewsModel>> getNewsOfTheDay() async {
    var data = await apiServices.get(
        endPoint: 'top-headlines?sources=bbc-news&sortBy=popularity');
    NewsModel newsOTD = NewsModel.fromJson(data['articles'][0]);

    return Right(newsOTD);
  }
}
