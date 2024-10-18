import 'package:clean_architecture/core/resources/data_state.dart';
import 'package:clean_architecture/core/usecases/usecase.dart';
import 'package:clean_architecture/features/daily_news/domain/entities/article.dart';
import 'package:clean_architecture/features/daily_news/domain/repository/article_repository.dart';

class GetSavedArtcleUseCase implements UseCase<List<ArticleEntity>,void>{
  final ArticleRepository _articleRepository;
  GetSavedArtcleUseCase(this._articleRepository);

  @override
  Future<List<ArticleEntity>> call({void params}) async{
    return  _articleRepository.getSavedArticles();
  }

}