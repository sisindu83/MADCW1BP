import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/news_controller.dart';
import '../widgets/article_card.dart';

class CategoriesScreen extends StatelessWidget {
  final List<String> categories = ['General', 'Business', 'Sports', 'Technology', 'Health', 'Entertainment', 'Science'];

  @override
  Widget build(BuildContext context) {
    final newsController = Provider.of<NewsController>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Categories')),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return ListTile(
            title: Text(category),
            onTap: () {
              newsController.setCategory(category.toLowerCase());
              Navigator.pop(context);
            },
          );
        },
      ),
    );
  }
}
