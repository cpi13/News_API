import 'package:cached_network_image/cached_network_image.dart';
import 'package:clean_architecture/features/daily_news/domain/entities/article.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ArticleWidget extends StatelessWidget {
  final ArticleEntity ? article;
  final bool ? isRemovable;
  final void Function(ArticleEntity article)  ? onRemove;
  final void Function(ArticleEntity article)  ? onArticlePressed;

  const ArticleWidget({Key? key,
  this.article,
  this.isRemovable = false,
  this.onArticlePressed,
  this.onRemove}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        behavior: HitTestBehavior.opaque,
      onTap: _onTap,
      child: Container(
        padding: const EdgeInsetsDirectional.only(start: 14,end: 14,bottom: 7,top: 7),
        height: MediaQuery.of(context).size.width / 2.2,
        child: Row(children: [
            _buildImage(context),
          _buildTitleAndDescription(),
          _buildRemovableArea()
        ],),
      ),
    );
  }
  Widget _buildImage(BuildContext context){
    if(article!=null && article!.urlToImage !=null) {
      return CachedNetworkImage(
        imageUrl: article!.urlToImage!,
        imageBuilder: (context, imageProvider) => Padding(
          padding: const EdgeInsetsDirectional.only(end: 14),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Container(
              width: MediaQuery.of(context).size.width / 3,
              height: double.maxFinite,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.08),
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        progressIndicatorBuilder: (context, url, downloadProgress) => Padding(
          padding: const EdgeInsetsDirectional.only(end: 14),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Container(
              width: MediaQuery.of(context).size.width / 3,
              height: double.maxFinite,
              decoration: BoxDecoration(color: Colors.black.withOpacity(0.08)),
              child: const CupertinoActivityIndicator(),
            ),
          ),
        ),
        errorWidget: (context, url, error) => Padding(
          padding: const EdgeInsetsDirectional.only(end: 14),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Container(
              width: MediaQuery.of(context).size.width / 3,
              height: double.maxFinite,
              decoration: BoxDecoration(color: Colors.black.withOpacity(0.08)),
              child: const Icon(Icons.error),
            ),
          ),
        ),
      );
    }
    else
      {
        return const Center(child: CircularProgressIndicator(),);
      }
  }
  Widget _buildTitleAndDescription(){
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 7),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(article!.title ?? '',
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              style: const TextStyle(
                fontFamily: 'Butler',
                fontSize: 18,
                fontWeight: FontWeight.w900,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 4,),
            Expanded(child: Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                article!.description ?? '',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            )),
            
            Row(
              children: [
                const Icon(Icons.timeline_outlined,size: 16,),
                const SizedBox(width: 4,),
                Expanded(
                  child: Text(article!.publishedAt!,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 12,
                  ),),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildRemovableArea(){
    if(isRemovable!){
      return GestureDetector(
        onTap:_onRemove,
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Icon(Icons.remove_circle_outline,color: Colors.red,),
        ),
      );
    }
    return Container();
  }
  void _onTap(){
    if(onArticlePressed!= null){
      onArticlePressed!(article!);
    }
  }
  void _onRemove(){
    if(onRemove!= null){
      onRemove!(article!);
    }
  }
}
