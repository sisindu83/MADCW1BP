import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/news_controller.dart';
import '../widgets/article_card.dart';
import '../widgets/app_header.dart';
import 'article_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<NewsController>(context, listen: false).fetchArticles();
  }

  @override
  Widget build(BuildContext context) {
    final newsController = Provider.of<NewsController>(context);

    return Scaffold(
      appBar: AppHeader(), //ap header
      body: newsController.isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: newsController.articles.length,
        itemBuilder: (context, index) {
          final article = newsController.articles[index];
          return ArticleCard(
            article: article,
            isFavorite: newsController.isFavorite(article),
            onFavoriteToggle: () {
              newsController.isFavorite(article)
                  ? newsController.removeFavorite(article)
                  : newsController.addFavorite(article);
            },
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ArticleDetailScreen(article: article),
              ),
            ),
          );
        },
      ),
    );
  }
}
