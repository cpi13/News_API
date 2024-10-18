

import 'package:clean_architecture/features/daily_news/presentation/widget/article_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/article.dart';
import '../../bloc/article/remote/remote_article_bloc.dart';
import '../../bloc/article/remote/remote_article_state.dart';

class DailyNews extends StatelessWidget {
   DailyNews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(),
    );
  }
  _buildAppBar(BuildContext context){
    return AppBar(
      title: const Text("Daily News",
      style: TextStyle(
        color: Colors.black
      ),),
      actions: [
        GestureDetector(
          onTap: () => _onShowSavedArticlesViewTapped(context),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 14),
            child: Icon(Icons.bookmark, color: Colors.black),
          ),
        ),
      ],
    );
  }
  _buildBody(){
    return BlocBuilder<RemoteArticleBloc,RemoteArticleState>(
      builder:(_,state){
        if(state is RemoteArticleLoading){
          return Center(child: CupertinoActivityIndicator(),);
        }
         if(state is RemoteArticleError){
           print(state.error.toString());
          return Center(child: Icon(Icons.refresh),);
        }
        if(state is RemoteArticleDone){
          print(state.articles);
          return ListView.builder(
            itemCount: state.articles!.length,
              itemBuilder: (context,index){
              final art = state.articles![index];
              if(art != null){
                return ArticleWidget(
                  article: art,
                  onArticlePressed: (article) => _onArticlePressed(context,article),
                );}
              else{
                return Center(child: CircularProgressIndicator(),);
          }
              });
        }
        return const SizedBox();
      }
    );
  }
   void _onArticlePressed(BuildContext context, ArticleEntity article) {
     Navigator.pushNamed(context, '/ArticleDetails', arguments: article);
   }

   void _onShowSavedArticlesViewTapped(BuildContext context) {
     Navigator.pushNamed(context, '/SavedArticles');
   }
}
