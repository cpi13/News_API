import 'package:clean_architecture/core/resources/data_state.dart';
import 'package:clean_architecture/core/usecases/usecase.dart';
import 'package:clean_architecture/features/daily_news/domain/entities/article.dart';
import 'package:clean_architecture/features/daily_news/domain/repository/article_repository.dart';

class RemoveArtcleUseCase implements UseCase<void,ArticleEntity>{
  final ArticleRepository _articleRepository;
  RemoveArtcleUseCase(this._articleRepository);

  @override
  Future<void> call({ArticleEntity? params}) async{
    return  _articleRepository.removeArticle(params!);
  }

}