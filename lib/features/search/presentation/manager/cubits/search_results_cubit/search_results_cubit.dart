import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app/features/home/data/models/news_model/news_model.dart';
import 'package:news_app/features/search/data/repos/search_repo.dart';

part 'search_results_state.dart';

class SearchResultsCubit extends Cubit<SearchResultsState> {
  SearchResultsCubit(this.searchRepo) : super(SearchResultsInitial());

  SearchRepo searchRepo;

  Future<void> getSearchResults({required String topic}) async {
    emit(SearchResultsLoading());

    var result = await searchRepo.getSearchResults(topic: topic);

    result.fold((failure) {
      emit(SearchResultsFailure(errorMessage: failure.errorMessage));
    }, (news) {
      emit(SearchResultsSuccess(news: news));
    });
  }
}
