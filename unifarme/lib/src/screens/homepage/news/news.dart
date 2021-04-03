import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unifarme/src/models/newsModel.dart';
import 'package:unifarme/src/providers/selectedNews.dart';

class NewsCard extends StatelessWidget {
  final NewsModel news;
  NewsCard({this.news});
  @override
  Widget build(BuildContext context) {
    final newsProv = Provider.of<SelectedNewProvider>(context, listen: false);
    return ListTile(
      leading: Container(
        color: Colors.grey[200],
        width: 120,
        child: CachedNetworkImage(
          imageUrl:
              news.pic ?? 'https://www.ilcorn.org/image/1739/1000/FCSS2.png',
          fit: BoxFit.cover,
        ),
      ),
      title: Text(
        news.title.trim(),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        news.desc ?? '...',
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      onTap: () {
        newsProv.setNews = news;
        Navigator.of(context).pushNamed('/selected/news');
      },
    );
  }
}
