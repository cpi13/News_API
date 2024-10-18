import 'package:clean_architecture/config/theme/app_theme.dart';
import 'package:clean_architecture/features/daily_news/domain/usecases/get_Article.dart';
import 'package:clean_architecture/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:clean_architecture/features/daily_news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:clean_architecture/features/daily_news/presentation/pages/home/daily_news.dart';
import 'package:flutter/material.dart';
import 'package:clean_architecture/config/routes/routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'injection_container.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteArticleBloc>(
      create: (context) => sl()..add(GetArticles()),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: theme(),
        onGenerateRoute: AppRoutes.onGenerateRoutes,
        home: DailyNews(),
      ),
    );
  }
}



