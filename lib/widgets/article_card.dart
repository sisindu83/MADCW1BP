import 'package:flutter/material.dart';
import '../models/news_article.dart';

class ArticleCard extends StatelessWidget {
  final NewsArticle article;
  final bool isFavorite;
  final VoidCallback onFavoriteToggle;
  final VoidCallback onTap;

  const ArticleCard({
    required this.article,
    this.isFavorite = false,
    required this.onFavoriteToggle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: article.urlToImage != null
            ? Image.network(article.urlToImage, width: 50, height: 50, fit: BoxFit.cover)
            : Icon(Icons.image),
        title: Text(article.title),
        subtitle: Text(article.description),
        trailing: IconButton(
          icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
          onPressed: onFavoriteToggle,
        ),
        onTap: onTap,
      ),
    );
  }
}
