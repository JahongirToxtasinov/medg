import 'package:medg/features/main/domain/entity/news_entity.dart';
import '../../../../core/either/either.dart';
import '../../../../core/failure/failure.dart';

abstract class NewsRepository {
  Future<Either<Failure, List<NewsEntity>>> getNews();
}