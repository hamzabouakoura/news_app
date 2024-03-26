import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app/features/home/data/models/news_model/news_model.dart';
import 'package:news_app/features/search/data/repos/search_repo.dart';

part 'search_by_category_state.dart';

class SearchByCategoryCubit extends Cubit<SearchByCategoryState> {
  SearchByCategoryCubit(this.searchRepo) : super(SearchByCategoryInitial());

  SearchRepo searchRepo;

  Future<void> getSearchResultsByCategory({required String category}) async {
    emit(SearchByCategoryLoading());

    var result =
        await searchRepo.getSearchResultsByCategory(category: category);

    result.fold((failure) {
      emit(SearchByCategoryFailure(errorMessage: failure.errorMessage));
    }, (news) {
      emit(SearchByCategorySuccess(news: news));
    });
  }
}
