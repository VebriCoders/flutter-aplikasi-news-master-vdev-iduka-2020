import 'package:news_app_vebri_yusdi_flutter/model/news_response.dart';
import '../end_points.dart';
import '../api_exception.dart';
import '../http_client.dart';

class NewsRepository {
  final HttpClient _httpClient = HttpClient();

  Future<NewsResponse> getAllNews() async {
    final dynamic newsJson = await _httpClient.getRequest(EndPoints.allNews);

    if (newsJson.isEmpty) {
      throw EmptyResultException();
    }

    return NewsResponse.fromJson(newsJson);
  }
}
