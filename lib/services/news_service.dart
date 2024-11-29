import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/news_article.dart';

class NewsService {
  static const String _apiKey = '75d1bcb8ec3a43a9b632a17b85ce4693';
  static const String _baseUrl = 'https://newsapi.org/v2';

  Future<List<NewsArticle>> fetchArticles({String category = 'general', String sortBy = 'publishedAt'}) async {
    final response = await http.get(
      Uri.parse('$_baseUrl/top-headlines?country=us&category=$category&sortBy=$sortBy&apiKey=$_apiKey'),
    );
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      List<NewsArticle> articles = (data['articles'] as List).map((json) => NewsArticle.fromJson(json)).toList();
      return articles;
    } else {
      throw Exception('Failed to load news');
    }
  }

  Future<List<NewsArticle>> searchArticles(String query) async {
    final response = await http.get(
      Uri.parse('$_baseUrl/everything?q=$query&apiKey=$_apiKey'),
    );
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      List<NewsArticle> articles = (data['articles'] as List).map((json) => NewsArticle.fromJson(json)).toList();
      return articles;
    } else {
      throw Exception('Failed to search news');
    }
  }
}
