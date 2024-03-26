import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app/features/home/data/repos/home_repo.dart';

import '../../../data/models/news_model/news_model.dart';

part 'news_otd_state.dart';

class NewsOtdCubit extends Cubit<NewsOtdState> {
  NewsOtdCubit(this.homeRepo) : super(NewsOtdInitial());

  HomeRepo homeRepo;

  Future<void> getNewsOfTheDay() async {
    emit(NewsOfTheDayLoading());

    var result = await homeRepo.getNewsOfTheDay();

    result.fold((failure) {
      emit(NewsOfTheDayFailure(errorMessage: failure.errorMessage));
    }, (newsOTD) {
      emit(NewsOfTheDaySuccess(newsOTD: newsOTD));
    });
  }
}
