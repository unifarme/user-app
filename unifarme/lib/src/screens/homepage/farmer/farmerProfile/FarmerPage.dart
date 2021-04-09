import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:unifarme/constants/colors.dart';
import 'package:unifarme/src/screens/homepage/farmer/farmerProfile/dashboard.dart';

class FarmerPage extends StatefulWidget {
  @override
  _FarmerPageState createState() => _FarmerPageState();
}

class _FarmerPageState extends State<FarmerPage>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, initialIndex: 0, length: 3);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        flexibleSpace: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TabBar(
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.greenAccent,
              ),
              controller: _tabController,
              tabs: <Widget>[
                Column(
                  children: [
                    Icon(Icons.dashboard),
                    SizedBox(height: 5),
                    Text(
                      'Dashboard',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.rice_bowl),
                    SizedBox(height: 5),
                    Text(
                      'Products',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Icon(FontAwesomeIcons.user),
                    SizedBox(height: 5),
                    Text(
                      'Profile',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Container(
            child: FarmersDashboard(),
          ),
          Text("Products"),
          Text("Profile"),
        ],
      ),
    );
  }

  Widget one() {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        body: TabBarView(
          children: [
            Container(
              child: FarmersDashboard(),
            ),
            Text("Products"),
            Text("Profile"),
          ],
        ),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: HexColor(blueVar),
          flexibleSpace: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TabBar(
                tabs: <Widget>[
                  Column(
                    children: [
                      Icon(Icons.dashboard),
                      SizedBox(height: 5),
                      Text(
                        'Dashboard',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.rice_bowl),
                      SizedBox(height: 5),
                      Text(
                        'Products',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(FontAwesomeIcons.user),
                      SizedBox(height: 5),
                      Text(
                        'Profile',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
          //   bottom: TabBar(
          //     tabs: <Widget>[
          //       Column(
          //         children: [
          //           Icon(Icons.dashboard),
          //           SizedBox(height: 5),
          //           Text(
          //             'Dashboard',
          //             style: TextStyle(
          //               fontSize: 15,
          //             ),
          //           ),
          //         ],
          //       ),
          //       Column(
          //         children: [
          //           Icon(Icons.rice_bowl),
          //           SizedBox(height: 5),
          //           Text(
          //             'Products',
          //             style: TextStyle(
          //               fontSize: 15,
          //             ),
          //           ),
          //         ],
          //       ),
          //       Column(
          //         children: [
          //           Icon(FontAwesomeIcons.user),
          //           SizedBox(height: 5),
          //           Text(
          //             'Profile',
          //             style: TextStyle(
          //               fontSize: 15,
          //             ),
          //           ),
          //         ],
          //       ),
          //     ],
          //   ),
          // ),

          // body: TabBarView(
          //   children: [
          //     Container(
          //       child: FarmersDashboard(),
          //     ),
          //     Text("Products"),
          //     Text("Profile"),
          //   ],
          // ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
