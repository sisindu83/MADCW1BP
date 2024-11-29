import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/news_controller.dart';
import '../widgets/article_card.dart';
import 'article_detail_screen.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final newsController = Provider.of<NewsController>(context);

    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          decoration: InputDecoration(hintText: 'Search articles...'),
          onSubmitted: (query) {
            newsController.searchArticles(query);
          },
        ),
      ),
      body: newsController.isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: newsController.articles.length,
        itemBuilder: (context, index) {
          final article = newsController.articles[index];
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
