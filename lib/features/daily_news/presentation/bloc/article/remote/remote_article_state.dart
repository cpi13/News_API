import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';

import '../../../../domain/entities/article.dart';
abstract class RemoteArticleState extends Equatable{
    final List<ArticleEntity> ? articles;
    final DioError ? error;
    const RemoteArticleState({this.error,this.articles});

    List<Object> get props => [articles!, error!];
}
class RemoteArticleLoading extends RemoteArticleState{
  const RemoteArticleLoading();
}
class RemoteArticleDone extends RemoteArticleState{
  const RemoteArticleDone(List<ArticleEntity> article):super(articles: article);
}
class RemoteArticleError extends RemoteArticleState{
  const RemoteArticleError(DioError err):super(error: err);
}