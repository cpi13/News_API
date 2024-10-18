import 'package:clean_architecture/features/daily_news/domain/usecases/get_Article.dart';
import 'package:clean_architecture/features/daily_news/domain/usecases/get_saved_Article.dart';
import 'package:clean_architecture/features/daily_news/domain/usecases/remove_Article.dart';
import 'package:clean_architecture/features/daily_news/domain/usecases/save_article.dart';
import 'package:clean_architecture/features/daily_news/presentation/bloc/article/local/local_article_event.dart';
import 'package:clean_architecture/features/daily_news/presentation/bloc/article/local/local_article_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocalArticleBloc extends Bloc<LocalArticleEvent,LocalArticleState>{
  final GetSavedArtcleUseCase getSavedArticle;
  final SaveArtcleUseCase saveArticle;

  final RemoveArtcleUseCase removeArtcleUseCase;

  LocalArticleBloc(this.getSavedArticle,this.removeArtcleUseCase,this.saveArticle):super(LocalArticleLoading()){
    on<GetSavedArticle>(onGetSavedArticle);
    on<RemoveArticle>(onRemoveArticle);
    on<SaveArticle>(onSaveArticle);
  }


  void onGetSavedArticle(GetSavedArticle event,Emitter<LocalArticleState> emitter) async{
    final articles = await getSavedArticle();
    emit(LocalArticleDone(articles));
  }
  void onRemoveArticle(RemoveArticle removeArticle,Emitter<LocalArticleState> emit) async{
    await removeArtcleUseCase(params: removeArticle.articleEntity);
    final articles = await getSavedArticle();
    emit(LocalArticleDone(articles));
  }
  void onSaveArticle(SaveArticle article,Emitter<LocalArticleState> emit) async{
    await saveArticle(params: article.articleEntity);
    final articles = await getSavedArticle();
    emit(LocalArticleDone(articles));
  }

}