part of 'news_bloc.dart';

class NewsState {
  final List<NewsEntity> newsList;
  final List<NewsEntity> searchedNews;
  final NewsStatus newsStatus;
  final bool isSearching;
  NewsState({
    required this.searchedNews,
    required this.newsList,
    required this.isSearching,
    required this.newsStatus,
  });
  NewsState copyWith({
    List<NewsEntity>? newsList,
    List<NewsEntity>? searchedNews,
    NewsStatus? newsStatus,
    bool? isSearching,
  }) {
    return NewsState(
      searchedNews: searchedNews ?? this.searchedNews,
      isSearching: isSearching ?? this.isSearching,
      newsList: newsList ?? this.newsList,
      newsStatus: newsStatus ?? this.newsStatus,
    );
  }

  @override
  String toString() => 'NewsState(data: $newsList, newsStatus: $newsStatus)';

  @override
  bool operator ==(covariant NewsState other) {
    if (identical(this, other)) return true;

    return
      listEquals(other.newsList, newsList) &&
          listEquals(other.searchedNews, searchedNews) &&
          other.isSearching == isSearching &&
          other.newsStatus == newsStatus;
  }
  @override
  int get hashCode => newsList.hashCode ^ newsStatus.hashCode ^ isSearching.hashCode ^ searchedNews.hashCode;
}

