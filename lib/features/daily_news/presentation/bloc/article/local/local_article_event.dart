import 'package:clean_architecture/features/daily_news/domain/entities/article.dart';
import 'package:equatable/equatable.dart';

abstract class LocalArticleEvent extends Equatable{
  ArticleEntity? articleEntity;
  LocalArticleEvent({this.articleEntity});

  List<Object> get props =>[articleEntity!];
}

class GetSavedArticle extends LocalArticleEvent{
  GetSavedArticle();
}
class RemoveArticle extends LocalArticleEvent{
  RemoveArticle(ArticleEntity article):super(articleEntity: article);
}
class SaveArticle extends LocalArticleEvent{
  SaveArticle(ArticleEntity article):super(articleEntity: article);
}