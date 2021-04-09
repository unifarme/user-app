import 'package:flutter/material.dart';

class ProfileFarmerPage extends StatefulWidget {
  @override
  _ProfileFarmerPageState createState() => _ProfileFarmerPageState();
}

class _ProfileFarmerPageState extends State<ProfileFarmerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Colors.orange,
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.red),
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed('/dashboard');
                },
                child: Text("Farmer Dashboard"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
