import 'package:flutter/material.dart';

class Friend extends StatefulWidget {
  @override
  _FriendState createState() => _FriendState();
}

class _FriendState extends State<Friend>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, initialIndex: 0, length: 2);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: TabBar(
        controller: _tabController,
        indicatorColor: Colors.tealAccent,
        labelColor: Colors.teal,
        unselectedLabelColor: Theme.of(context).textTheme.caption.color,
        isScrollable: false,
        tabs: <Widget>[
          Tab(
            text: "Friends",
          ),
          Tab(
            text: "Requests",
          ),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          ListView.separated(
            padding: EdgeInsets.all(10),
            separatorBuilder: (BuildContext context, int index) {
              return Align(
                alignment: Alignment.centerRight,
                child: Container(
                  height: 0.5,
                  width: MediaQuery.of(context).size.width / 1.3,
                  child: Divider(),
                ),
              );
            },
            itemCount: 10,
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.teal,
                  radius: 25,
                ),
                title: Text(
                  'Name',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.teal),
                ),
                subtitle: Text(
                  'Message',
                  style: TextStyle(color: Colors.grey),
                ),
                trailing: Column(
                  children: [
                    Text("5 min ago"),
                    CircleAvatar(
                      radius: 10,
                      backgroundColor: Colors.tealAccent,
                      child: Text(
                        '2',
                        style: TextStyle(color: Colors.black),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
          ListView.separated(
            padding: EdgeInsets.all(10),
            separatorBuilder: (BuildContext context, int index) {
              return Align(
                alignment: Alignment.centerRight,
                child: Container(
                  height: 0.5,
                  width: MediaQuery.of(context).size.width / 1.3,
                  child: Divider(),
                ),
              );
            },
            itemCount: 10,
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.teal,
                  radius: 25,
                ),
                title: Text(
                  'Name',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.teal),
                ),
                subtitle: Text(
                  'Message',
                  style: TextStyle(color: Colors.grey),
                ),
                trailing: Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.tealAccent,
                      radius: 15,
                      child: Text(
                        '+',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
