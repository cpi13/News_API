import 'package:clean_architecture/features/daily_news/data/models/article.dart';

import 'package:retrofit/retrofit.dart';

import '../../../../../core/constants/constants.dart';
import 'package:dio/dio.dart';
part 'news_api_service.g.dart';

@RestApi(baseUrl: newsApiBaseUrl)
abstract class NewsApiService{
factory NewsApiService(Dio dio) = _NewsApiService;

//when calling this method we basically telling the retrofit to generate method for us that can internally uses
//Dio to make a get network call to an endpoint name top-headlines with the base url & also take
// multiple query parameter as defined in the functions parameters

@GET('/top-headlines')
Future<HttpResponse<List<ArticleModel>>> getNewsArticles({
  @Query("apikey") String ? apikey,
  @Query("country") String ? country,
  @Query("category") String ? category,

});
}