import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unifarme/src/providers/news.dart';
import 'package:unifarme/src/screens/homepage/news/news.dart';

class NewsPage extends StatelessWidget {
  NewsPage();
  @override
  Widget build(BuildContext context) {
    final newsProv = Provider.of<NewsProvider>(context);
    return ListView.builder(
      itemCount: newsProv.getNews.length,
      itemBuilder: (context, index) {
        return NewsCard(
          news: newsProv.getNews[index],
        );
      },
    );
  }
}
