import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:medg/features/main/data/data_source/news_remote.dart';
import 'package:medg/features/main/data/model/news_status.dart';
import 'package:medg/features/main/data/repository/news_repo_impl.dart';
import 'package:medg/features/main/domain/entity/news_entity.dart';
import 'package:medg/features/main/domain/usecase/news_usecase.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc()
      : super(
    NewsState(
      newsList: [],
      searchedNews: [],
      isSearching: false,
      newsStatus: NewsStatus.pure,
    ),
  ) {
    on<NewsStarted>((event, emit) async {
      emit(
        state.copyWith(
          newsStatus: NewsStatus.loading,
        ),
      );
      final usecase = NewsUseCase(
        newsRepository: NewsRepositoryImpl(
          dataSource: NewsDataSource(),
        ),
      );
      final either = await usecase.call(
        GetDataParam(),
      );
      either.either(
            (failure) {
              print("${failure} ---------");
          emit(
            state.copyWith(
              newsStatus: NewsStatus.failure,
            ),
          );
        },
            (value) {
              print("---------- $value");
          emit(
            state.copyWith(
              newsList: value,
              newsStatus: NewsStatus.success,
            ),
          );
        },
      );
    });
    on<Searching>((event, emit) {
      if (event.query.isEmpty) {
        emit(state.copyWith(isSearching: false));
      } else {
        final newList = state.newsList
            .where((element) => element.title.contains(event.query))
            .toList();
        emit(state.copyWith(searchedNews: newList, isSearching: true));
      }
    });
  }
}
