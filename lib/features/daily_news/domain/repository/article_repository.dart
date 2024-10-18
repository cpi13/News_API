import 'package:clean_architecture/features/daily_news/domain/entities/article.dart';
import '../../../../core/resources/data_state.dart';

abstract class ArticleRepository{
  //API MEthods
  Future<DataState<List<ArticleEntity>>> getNewsArticles();

  //Database method
  Future<List<ArticleEntity>> getSavedArticles();

  Future<void> savedArticle(ArticleEntity article);

  Future<void> removeArticle(ArticleEntity article);

 }