import 'package:clean_architecture/features/daily_news/domain/entities/article.dart';
import 'package:floor/floor.dart';

//domain layer must be independent
//in future we may change our database or use xml instead of json so we need to change entity which against the rule of clean architeture
// thats why we use model and entity both
@Entity(tableName:'article',primaryKeys: ['id'])
class ArticleModel extends ArticleEntity{
  const ArticleModel({
    int ? id,
    String ? title,
    String ? author,
    String ? description,
    String ? url,
    String ? urlToImage,
    String ? publishedAt,
    String ? content,
}): super(
    id: id,
    author: author,
    title: title,
    description: description,
    url: url,
    urlToImage: urlToImage,
    publishedAt: publishedAt,
    content: content,
  );

  factory ArticleModel.fromJson(Map<String, dynamic> map){
    return ArticleModel(
      author: map['author'] ?? "",
      title: map['title'] ?? "",
      description: map['description'] ?? "",
      url: map['url'] ?? "",
      urlToImage: map['urlToImage'] ?? "",
      publishedAt: map['publishedAt'] ?? "",
      content: map['content'] ?? "",
    );
  }
  factory ArticleModel.fromEntity(ArticleEntity entity){
    return ArticleModel(
      id: entity.id,
      author: entity.author,
      title: entity.title,
      description: entity.description,
      url: entity.url,
      urlToImage: entity.urlToImage,
      publishedAt: entity.urlToImage,
      content: entity.content
    );
  }
}