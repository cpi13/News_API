import 'package:clean_architecture/features/daily_news/data/data_sources/local/DAO/app_database.dart';
import 'package:clean_architecture/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:clean_architecture/features/daily_news/data/repository/article_repository_implementation.dart';
import 'package:clean_architecture/features/daily_news/domain/repository/article_repository.dart';
import 'package:clean_architecture/features/daily_news/domain/usecases/get_Article.dart';
import 'package:clean_architecture/features/daily_news/presentation/bloc/article/local/local_article_bloc.dart';
import 'package:clean_architecture/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

import 'features/daily_news/domain/usecases/get_saved_Article.dart';
import 'features/daily_news/domain/usecases/remove_Article.dart';
import 'features/daily_news/domain/usecases/save_article.dart';


final sl = GetIt.instance;

Future<void> initializeDependencies() async{
  final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  sl.registerSingleton<AppDatabase>(database);
  //Dio
  sl.registerSingleton<Dio>(Dio());

  //Dependencies
  sl.registerSingleton<NewsApiService>(NewsApiService(sl()));

  sl.registerSingleton<ArticleRepository>(ArticleRepositoryImpl(sl(),sl()));

  //UseCases
  sl.registerSingleton<GetArtcleUseCase>(
          GetArtcleUseCase(sl())
  );
  sl.registerSingleton<GetSavedArtcleUseCase>(
      GetSavedArtcleUseCase(sl())
  );
  sl.registerSingleton<SaveArtcleUseCase>(
      SaveArtcleUseCase(sl())
  );
  sl.registerSingleton<RemoveArtcleUseCase>(
      RemoveArtcleUseCase(sl())
  );

  //Bloc
  sl.registerFactory<RemoteArticleBloc>(
          () =>RemoteArticleBloc(sl())
  );
  sl.registerFactory<LocalArticleBloc>(
          () =>LocalArticleBloc(sl(),sl(),sl())
  );

}