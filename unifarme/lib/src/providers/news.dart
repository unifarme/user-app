import 'package:flutter/material.dart';
import 'package:unifarme/src/models/newsModel.dart';

class NewsProvider extends ChangeNotifier {
  List<NewsModel> news = [
    NewsModel(
      pic: "https://miro.medium.com/max/1135/1*MqpZzX1SkHi1NfzjAYeaiA.png",
      content: """
          Tendulkar tweeted on Friday that he decided to go to a hospital in Mumbai "as a matter of abundant precaution under medical advice".
          The former captain, who is loved by millions, added that he was hoping to be back home in a few days.
          Several Indian cities, including Mumbai, have seen a sharp rise in Covid-19 cases in the past few weeks.

Tendulkar, 47, shared the news at a time when India is staring at what experts have called a "deadlier second wave".

India reported 81,466 news cases and 469 deaths on Thursday - the highest daily spike since December.

The country's Covid caseload had dropped sharply in January when it was reporting less than 15,000 cases daily. But cases began to spike again in March, largely driven by poor test-and-trace and lax safety protocols.

Many of the new cases were reported in the western state of Maharashtra, where Tendulkar lives in the city of Mumbai.

Since the pandemic began, India has confirmed more than 12.2 million cases and over 163,000 deaths. It has the third-highest number of infections in the world after the United States and Brazil - however, its number of deaths per capita is far lower.

India has registered 118 deaths per million, compared to 1,487 in Brazil and 1,668 in the US.,
          """,
      title: """
          Indian cricket legend Sachin Tendulkar, who tested positive for Covid-19 last week, has been admitted to hospital.
          """,
      desc:
          "Tendulkar tweeted on Friday that he decided to go to a hospital in Mumbai 'as a matter of abundant precaution under medical advice'",
    ),
    NewsModel(
      pic: "https://miro.medium.com/max/1135/1*MqpZzX1SkHi1NfzjAYeaiA.png",
      content: """
          Tendulkar tweeted on Friday that he decided to go to a hospital in Mumbai "as a matter of abundant precaution under medical advice".

The former captain, who is loved by millions, added that he was hoping to be back home in a few days.

Several Indian cities, including Mumbai, have seen a sharp rise in Covid-19 cases in the past few weeks.

Tendulkar, 47, shared the news at a time when India is staring at what experts have called a "deadlier second wave".

India reported 81,466 news cases and 469 deaths on Thursday - the highest daily spike since December.

The country's Covid caseload had dropped sharply in January when it was reporting less than 15,000 cases daily. But cases began to spike again in March, largely driven by poor test-and-trace and lax safety protocols.

Many of the new cases were reported in the western state of Maharashtra, where Tendulkar lives in the city of Mumbai.

Since the pandemic began, India has confirmed more than 12.2 million cases and over 163,000 deaths. It has the third-highest number of infections in the world after the United States and Brazil - however, its number of deaths per capita is far lower.

India has registered 118 deaths per million, compared to 1,487 in Brazil and 1,668 in the US.,
          """,
      title: """
          Indian cricket legend Sachin Tendulkar, who tested positive for Covid-19 last week, has been admitted to hospital.
          """,
      desc:
          "Tendulkar tweeted on Friday that he decided to go to a hospital in Mumbai 'as a matter of abundant precaution under medical advice'",
    ),
    NewsModel(
      pic: "https://miro.medium.com/max/1135/1*MqpZzX1SkHi1NfzjAYeaiA.png",
      content: """
          Tendulkar tweeted on Friday that he decided to go to a hospital in Mumbai "as a matter of abundant precaution under medical advice".

The former captain, who is loved by millions, added that he was hoping to be back home in a few days.

Several Indian cities, including Mumbai, have seen a sharp rise in Covid-19 cases in the past few weeks.

Tendulkar, 47, shared the news at a time when India is staring at what experts have called a "deadlier second wave".

India reported 81,466 news cases and 469 deaths on Thursday - the highest daily spike since December.

The country's Covid caseload had dropped sharply in January when it was reporting less than 15,000 cases daily. But cases began to spike again in March, largely driven by poor test-and-trace and lax safety protocols.

Many of the new cases were reported in the western state of Maharashtra, where Tendulkar lives in the city of Mumbai.

Since the pandemic began, India has confirmed more than 12.2 million cases and over 163,000 deaths. It has the third-highest number of infections in the world after the United States and Brazil - however, its number of deaths per capita is far lower.

India has registered 118 deaths per million, compared to 1,487 in Brazil and 1,668 in the US.,
          """,
      title: """
          Indian cricket legend Sachin Tendulkar, who tested positive for Covid-19 last week, has been admitted to hospital.
          """,
      desc:
          "Tendulkar tweeted on Friday that he decided to go to a hospital in Mumbai 'as a matter of abundant precaution under medical advice'",
    ),
    NewsModel(
      pic: "https://miro.medium.com/max/1135/1*MqpZzX1SkHi1NfzjAYeaiA.png",
      content: """
          Tendulkar tweeted on Friday that he decided to go to a hospital in Mumbai "as a matter of abundant precaution under medical advice".

The former captain, who is loved by millions, added that he was hoping to be back home in a few days.

Several Indian cities, including Mumbai, have seen a sharp rise in Covid-19 cases in the past few weeks.

Tendulkar, 47, shared the news at a time when India is staring at what experts have called a "deadlier second wave".

India reported 81,466 news cases and 469 deaths on Thursday - the highest daily spike since December.

The country's Covid caseload had dropped sharply in January when it was reporting less than 15,000 cases daily. But cases began to spike again in March, largely driven by poor test-and-trace and lax safety protocols.

Many of the new cases were reported in the western state of Maharashtra, where Tendulkar lives in the city of Mumbai.

Since the pandemic began, India has confirmed more than 12.2 million cases and over 163,000 deaths. It has the third-highest number of infections in the world after the United States and Brazil - however, its number of deaths per capita is far lower.

India has registered 118 deaths per million, compared to 1,487 in Brazil and 1,668 in the US.,
          """,
      title: """
          Indian cricket legend Sachin Tendulkar, who tested positive for Covid-19 last week, has been admitted to hospital.
          """,
      desc:
          "Tendulkar tweeted on Friday that he decided to go to a hospital in Mumbai 'as a matter of abundant precaution under medical advice'",
    )
  ];

  get getNews => news;
  set setNews(List<NewsModel> a) {
    news = a;
    notifyListeners();
  }
}
