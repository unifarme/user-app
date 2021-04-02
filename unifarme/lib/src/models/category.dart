class CategoryModel {
  String name;
  String pic;
  CategoryModel({this.name, this.pic});
  CategoryModel.fromJson(parsedJson) {
    name = parsedJson["name"] != null ? parsedJson["name"] : "";
    pic = parsedJson["pic"] != null ? parsedJson["pic"] : "";
  }
}
