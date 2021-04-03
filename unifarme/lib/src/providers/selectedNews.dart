import 'package:flutter/material.dart';
import 'package:unifarme/src/models/newsModel.dart';

class SelectedNewProvider extends ChangeNotifier {
  NewsModel news;

  NewsModel get getNews => news;

  set setNews(NewsModel s) {
    news = s;
    notifyListeners();
  }
}
