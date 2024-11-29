import 'package:flutter/material.dart';
import '../models/news_article.dart';
import '../services/news_service.dart';

class NewsController with ChangeNotifier {
  List<NewsArticle> _articles = [];
  List<NewsArticle> _favorites = [];
  bool _isLoading = false;
  String _currentCategory = 'general';
  String _currentSortBy = 'publishedAt';
//get state properties
  List<NewsArticle> get articles => _articles;
  List<NewsArticle> get favorites => _favorites;
  bool get isLoading => _isLoading;
  String get currentCategory => _currentCategory;
  String get currentSortBy => _currentSortBy;
//notofy
  Future<void> fetchArticles() async {
    _isLoading = true;
    notifyListeners();
    try {
      _articles = await NewsService().fetchArticles(
        category: _currentCategory,
        sortBy: _currentSortBy,
      );
    } catch (e) {
      print('Error fetching news: $e');
    }
    _isLoading = false;
    notifyListeners();
  }

  Future<void> searchArticles(String query) async {
    _isLoading = true;
    notifyListeners();
    try {
      _articles = await NewsService().searchArticles(query);
    } catch (e) {
      print('Error searching news: $e');
    }
    _isLoading = false;
    notifyListeners();
  }

  void addFavorite(NewsArticle article) {
    _favorites.add(article);
    notifyListeners();
  }


  bool isFavorite(NewsArticle article) {
    return _favorites.contains(article);
  }

  void removeFavorite(NewsArticle article) {
    _favorites.remove(article);
    notifyListeners();
  }

  void setCategory(String category) {
    _currentCategory = category;
    fetchArticles();
  }

  void setSortBy(String sortBy) {
    _currentSortBy = sortBy;
    fetchArticles();
  }
}
