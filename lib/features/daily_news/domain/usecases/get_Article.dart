import 'package:clean_architecture/core/resources/data_state.dart';
import 'package:clean_architecture/core/usecases/usecase.dart';
import 'package:clean_architecture/features/daily_news/domain/entities/article.dart';
import 'package:clean_architecture/features/daily_news/domain/repository/article_repository.dart';

class GetArtcleUseCase implements UseCase<DataState<List<ArticleEntity>>,void>{
      final ArticleRepository _articleRepository;
      GetArtcleUseCase(this._articleRepository);

  @override
  Future<DataState<List<ArticleEntity>>> call({void params}) async{
    return  _articleRepository.getNewsArticles();
  }

}