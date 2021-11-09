import 'package:flutter/material.dart';

class DashboardHomePage extends StatefulWidget {
  const DashboardHomePage();

  @override
  _DashboardHomePageState createState() => _DashboardHomePageState();
}

class _DashboardHomePageState extends State<DashboardHomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      alignment: Alignment.topRight,
      child: Column(
        children: [
          const Text(
            "Dashboard",
            style: TextStyle(
              color: Colors.black,
              fontSize: 40,
              fontFamily: "Quicksand",
              fontWeight: FontWeight.w500
            ),
          ),
        ],
      )
    );
  }
}