import 'package:flutter/material.dart';
import 'package:unifarme/constants/colors.dart';

class AdvertSliderList extends StatefulWidget {
  @override
  _AdvertSliderListState createState() => _AdvertSliderListState();
}

class _AdvertSliderListState extends State<AdvertSliderList> {
  // Advert will come from backend to frontends by API requests
  final sliderImageList = [
    {
      'image': 'assets/advert/1.png',
    },
    {
      'image': 'assets/advert/2.png',
    },
    {
      'image': 'assets/advert/3.png',
    },
    {
      'image': 'assets/advert/4.png',
    },
    {
      'image': 'assets/advert/5.png',
    },
  ];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      height: 160.0,
      child: ListView.builder(
        itemCount: sliderImageList.length,
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          final item = sliderImageList[index];
          return InkWell(
            onTap: () {},
            child: Container(
              width: 170.0,
              margin: (index != (sliderImageList.length - 1))
                  ? EdgeInsets.only(left: fixPadding)
                  : EdgeInsets.only(left: fixPadding, right: fixPadding),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(item['image']),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          );
        },
      ),
    );
  }
}
