import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/news_controller.dart';
import '../widgets/article_card.dart';
import 'article_detail_screen.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final newsController = Provider.of<NewsController>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Favorites')),
      body: newsController.favorites.isEmpty
          ? Center(child: Text('No favorites yet'))
          : ListView.builder(
        itemCount: newsController.favorites.length,
        itemBuilder: (context, index) {
          final article = newsController.favorites[index];
          return ArticleCard(
            article: article,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ArticleDetailScreen(article: article),
              ),
            ), onFavoriteToggle: () {  },
          );
        },
      ),
    );
  }
}
