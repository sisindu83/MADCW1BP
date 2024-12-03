import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/news_controller.dart';

import '../views/categories_screen.dart';
import '../views/favorites_screen.dart';
import '../views/search_screen.dart';

class AppHeader extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    final newsController = Provider.of<NewsController>(context);

    return AppBar(
      title: Text('News App'),
      actions: [
        
        Row(
          children: [
            // Category btn icon
            IconButton(
              icon: Icon(Icons.category),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => CategoriesScreen()),
              ),
            ),

            // Sort
            DropdownButton<String>(
              value: newsController.currentSortBy,
              icon: Icon(Icons.sort, color: Colors.black),
              dropdownColor: Colors.white,
              underline: SizedBox(),
              onChanged: (String? newValue) {
                if (newValue != null) {
                  newsController.setSortBy(newValue);
                }
              },
              items: <String>['publishedAt', 'popularity', 'relevancy']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value[0].toUpperCase() + value.substring(1),
                    style: TextStyle(color: Colors.black),
                  ),
                );
              }).toList(),
            ),

            //seraxh icon
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => SearchScreen()),
              ),
            ),

            // Favorite btn
            IconButton(
              icon: Icon(Icons.favorite),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => FavoritesScreen()),
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
