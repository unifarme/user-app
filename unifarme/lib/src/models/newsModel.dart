class NewsModel {
  String title;
  String pic;
  String subtitle;
  String content;
  String desc;
  DateTime date;
  NewsModel({
    this.content,
    this.date,
    this.desc,
    this.pic,
    this.subtitle,
    this.title,
  });
  NewsModel.fromJson(parsedJson) {
    title = parsedJson["title"] != null ? parsedJson["title"] : "";
    pic = parsedJson["pic"] != null ? parsedJson["pic"] : "";
    subtitle = parsedJson["subtitle"] != null ? parsedJson["subtitle"] : "";
    content = parsedJson["content"] != null ? parsedJson["content"] : "";
    desc = parsedJson["desc"] != null ? parsedJson["desc"] : "";
    date = parsedJson["date"] != null ? parsedJson["date"] : "";
  }
}
