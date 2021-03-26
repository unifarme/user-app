import 'package:flutter/material.dart';
import 'package:unifarme/constants/colors.dart';

class CategoryVegetable extends StatefulWidget {
  List category;
  CategoryVegetable(List a) {
    category = a;
  }
  @override
  _CategoryVegetableState createState() => _CategoryVegetableState(category);
}

class _CategoryVegetableState extends State<CategoryVegetable> {
  List category;
  _CategoryVegetableState(List a) {
    category = a;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 110.0,
      child: ListView.builder(
        itemCount: category.length,
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final item = category[index];
          return InkWell(
            onTap: () {},
            child: Container(
              width: 70.0,
              margin: (index != (category.length - 1))
                  ? EdgeInsets.only(left: fixPadding)
                  : EdgeInsets.only(left: fixPadding, right: fixPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 60.0,
                    width: 60.0,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child:
                        Image.asset(item['image'], height: 40.0, width: 40.0),
                  ),
                  heightSpace,
                  Text(
                    item['title'],
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.pink,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
