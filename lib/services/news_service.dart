// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:convert';
import 'package:trendwave/models/news.dart';

Future<News> fetchNewsData({String? sort, int? limit, int? offset}) async {
  return _fetchNewsDataWithParams('', sort: sort, limit: limit, offset: offset);
}

Future<News> fetchNewsDataByCategory(String category,
    {String? sort, int? limit, int? offset}) async {
  return _fetchNewsDataWithParams('&categories=$category',
      sort: sort, limit: limit, offset: offset);
}

Future<News> fetchNewsDataByLanguage(String language,
    {String? sort, int? limit, int? offset}) async {
  return _fetchNewsDataWithParams('&languages=$language',
      sort: sort, limit: limit, offset: offset);
}

Future<News> fetchNewsDataByCountry(String country,
    {String? sort, int? limit, int? offset}) async {
  return _fetchNewsDataWithParams('&countries=$country',
      sort: sort, limit: limit, offset: offset);
}

Future<News> fetchNewsDataByQuery(String query,
    {String? sort, int? limit, int? offset}) async {
  return _fetchNewsDataWithParams('&keywords=$query',
      sort: sort, limit: limit, offset: offset);
}

Future<News> fetchNewsDataBySource(String source,
    {String? sort, int? limit, int? offset}) async {
  return _fetchNewsDataWithParams('&sources=$source',
      sort: sort, limit: limit, offset: offset);
}

Future<News> _fetchNewsDataWithParams(String params,
    {String? sort, int? limit, int? offset}) async {
  var mediaStackApiKey = dotenv.env['MEDIA_STACK_API_KEY'];
  String apiUrl =
      "http://api.mediastack.com/v1/news?access_key=$mediaStackApiKey$params";

  if (sort != null) {
    apiUrl += '&sort=$sort';
  }

  if (limit != null) {
    apiUrl += '&limit=$limit';
  }

  if (offset != null) {
    apiUrl += '&offset=$offset';
  }

  final url = Uri.parse(apiUrl);
  final response = await http.get(url);

  if (response.statusCode == 200) {
    final jsonData = json.decode(response.body);
    final newsData = News.fromJson(jsonData);
    return newsData;
  } else {
    throw Exception('Failed to fetch news data');
  }
}
