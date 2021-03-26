import 'package:flutter/material.dart';

import 'package:unifarme/constants/colors.dart';

class FarmsNearBy extends StatefulWidget {
  @override
  _FarmsNearByState createState() => _FarmsNearByState();
}

class _FarmsNearByState extends State<FarmsNearBy> {
  final farmsClose = [
    {
      'title': "Sam's farm",
      'subtitle': 'India',
      'image': 'assets/nearbyFarms/1.jpg',
      'status': 'none'
    },
    {
      'title': "Roku's Farm",
      'subtitle': 'India',
      'image': 'assets/nearbyFarms/2.jpg',
      'status': 'none'
    },
    {
      'title': "Suraj's Farm",
      'subtitle': 'India',
      'image': 'assets/nearbyFarms/3.jpg',
      'status': 'none'
    },
    {
      'title': "Anshul's Farm",
      'subtitle': 'India',
      'image': 'assets/nearbyFarms/4.jpg',
      'status': 'none'
    },
    {
      'title': 'Golden Farmobie',
      'subtitle': 'India',
      'image': 'assets/nearbyFarms/5.png',
      'status': 'none'
    },
  ];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      height: 170.0,
      child: ListView.builder(
        itemCount: farmsClose.length,
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          final item = farmsClose[index];
          return InkWell(
            onTap: () {},
            child: Container(
              width: 130.0,
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(5.0),
              ),
              margin: (index != (farmsClose.length - 1))
                  ? EdgeInsets.only(left: fixPadding)
                  : EdgeInsets.only(left: fixPadding, right: fixPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 110.0,
                    width: 130.0,
                    alignment: Alignment.topRight,
                    padding: EdgeInsets.all(fixPadding),
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(5.0)),
                      image: DecorationImage(
                        image: AssetImage(item['image']),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: InkWell(
                      onTap: () {
                        if (item['status'] == 'none') {
                          setState(() {
                            item['status'] = 'saved';
                          });
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Added to Favourite'),
                          ));
                        } else {
                          setState(() {
                            item['status'] = 'none';
                          });
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Remove from Favourite'),
                          ));
                        }
                      },
                      child: Icon(
                        (item['status'] == 'none')
                            ? Icons.bookmark_border
                            : Icons.bookmark,
                        size: 22.0,
                        color: whiteColor,
                      ),
                    ),
                  ),
                  Container(
                    width: 130.0,
                    height: 50.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Text(
                            item['title'],
                            style: listItemTitleStyle,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5.0, right: 5.0),
                          child: Text(
                            item['subtitle'],
                            style: TextStyle(
                              fontSize: 14.0,
                              color: greyColor,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.normal,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
