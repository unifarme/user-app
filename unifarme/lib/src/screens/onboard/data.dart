class SliderModel {
  String imageAssetPath;
  String title;
  String desc;

  SliderModel({this.imageAssetPath, this.title, this.desc});

  void setImageAssetPath(String getImageAssetPath) {
    imageAssetPath = getImageAssetPath;
  }

  void setTitle(String getTitle) {
    title = getTitle;
  }

  void setDesc(String getDesc) {
    desc = getDesc;
  }

  String getImageAssetPath() {
    return imageAssetPath;
  }

  String getTitle() {
    return title;
  }

  String getDesc() {
    return desc;
  }
}

List<SliderModel> getSlides() {
  List<SliderModel> slides = [];
  SliderModel sliderModel = new SliderModel();

  //1
  sliderModel.setDesc(
      "Discover the farmers and farm produce \nnear you from over 1000 farmers");
  sliderModel.setTitle("Search for favorite\nfood product");
  sliderModel.setImageAssetPath("assets/onboarding/1.jpg");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //2
  sliderModel
      .setDesc("Fast delivery to your home,\noffice and wherever you are.");
  sliderModel.setTitle("Fast delivery to your location\n of preference");
  sliderModel.setImageAssetPath("assets/onboarding/2.jpg");
  slides.add(sliderModel);

  // 3
  sliderModel = new SliderModel();
  sliderModel.setDesc("Sell and advertise your \nfarm produce on our app.");
  sliderModel.setTitle("");
  sliderModel.setImageAssetPath("assets/onboarding/3.jpg");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //4
  sliderModel.setDesc("Zero contact ordering,\ndelivery and takeaway.");
  sliderModel.setTitle("Safe delivery to\nyour home");
  sliderModel.setImageAssetPath("assets/onboarding/3.jpg");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  return slides;
}
