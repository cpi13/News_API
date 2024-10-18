import 'package:clean_architecture/core/resources/data_state.dart';
import 'package:clean_architecture/features/daily_news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:clean_architecture/features/daily_news/presentation/bloc/article/remote/remote_article_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/usecases/get_Article.dart';

class RemoteArticleBloc extends Bloc<RemoteArticleEvent,RemoteArticleState>{

  final GetArtcleUseCase _getArticleUseCase;
  //specify initial state by passing it to the super class via super
  RemoteArticleBloc(this._getArticleUseCase):super(RemoteArticleLoading()){
    on<GetArticles> (getArticles);//register the event
  }
  void getArticles(GetArticles articles,Emitter<RemoteArticleState> emitter)async{
    final dataState = await _getArticleUseCase();
    if(dataState is DataSuccess && dataState.data!.isNotEmpty){
      emit(RemoteArticleDone(dataState.data!));
    }
    else{
      print(dataState.error!.message);
      emit(RemoteArticleError(dataState.error!));
    }
  }

}