import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app/features/home/data/models/news_model/news_model.dart';
import 'package:news_app/features/home/data/repos/home_repo.dart';

part 'breaking_news_state.dart';

class BreakingNewsCubit extends Cubit<BreakingNewsState> {
  BreakingNewsCubit(this.homeRepo) : super(BreakingNewsInitial());

  HomeRepo homeRepo;

  Future<void> getBreakingNews() async {
    emit(BreakingNewsLoading());

    var result = await homeRepo.getBreakingNews();

    result.fold((failure) {
      emit(BreakingNewsFailure(errorMessage: failure.errorMessage));
    }, (news) {
      emit(BreakingNewsSuccess(news: news));
    });
  }
}
