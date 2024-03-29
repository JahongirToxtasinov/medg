import 'package:medg/features/main/domain/entity/news_entity.dart';
import 'package:medg/features/main/domain/repository/news_repo.dart';
import '../../../../core/either/either.dart';
import '../../../../core/failure/failure.dart';
import '../../../../core/usecases/usecase.dart';

class NewsUseCase implements UseCase<List<NewsEntity>, NoParams> {
  final NewsRepository _newsRepository;
  NewsUseCase({
    required NewsRepository newsRepository,
  }):_newsRepository = newsRepository;

  @override
  Future<Either<Failure, List<NewsEntity>>> call(NoParams param)async {
    if(param is GetDataParam){
      return await _newsRepository.getNews();
    }

    throw UnimplementedError();
  }


}
class GetDataParam extends NoParams {


}