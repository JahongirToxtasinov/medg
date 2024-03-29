import 'package:medg/features/main/data/data_source/news_remote.dart';
import 'package:medg/features/main/domain/entity/news_entity.dart';
import 'package:medg/features/main/domain/repository/news_repo.dart';
import '../../../../core/either/either.dart';
import '../../../../core/failure/failure.dart';

class NewsRepositoryImpl implements NewsRepository {
  final NewsDataSource _dataSource;
  NewsRepositoryImpl({
    required NewsDataSource dataSource,
  }) : _dataSource = dataSource;

  @override
  Future<Either<Failure, List<NewsEntity>>> getNews() async {
    try {
      final result = await _dataSource.getNews();
      return Right(result);
    } catch (e) {
      return Left(
        const ServerFailure(),
      );
    }
  }
}
