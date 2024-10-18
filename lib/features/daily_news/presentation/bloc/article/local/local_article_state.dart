import 'package:clean_architecture/features/daily_news/domain/entities/article.dart';
import 'package:equatable/equatable.dart';

abstract class LocalArticleState extends Equatable{
  List<ArticleEntity> ? entity;
  LocalArticleState({this.entity});

  List<Object> get props=> [entity!];
}
class LocalArticleLoading extends LocalArticleState{
  LocalArticleLoading();
}
class LocalArticleDone extends LocalArticleState{
  LocalArticleDone(List<ArticleEntity> articleEntity):super(entity: articleEntity);
}