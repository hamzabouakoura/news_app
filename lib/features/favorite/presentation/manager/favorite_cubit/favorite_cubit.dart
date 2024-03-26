import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app/features/favorite/presentation/manager/list_of_favorites.dart';
import 'package:news_app/features/home/data/models/news_model/news_model.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteInitial());

  void addFavoriteNews(NewsModel news) {
    favorites.add(news);
    fetchFavoriteNews();
    emit(FavoriteAdded());
  }

  List<NewsModel> getFavoriteNews() {
    return favorites;
  }

  void fetchFavoriteNews() async {
    emit(FavoriteLoading());
    try {
      emit(FavoriteSuccess(favNews: favorites));
    } on Exception catch (e) {
      print(e);
    }
  }
}
