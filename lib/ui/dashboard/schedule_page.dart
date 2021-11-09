import 'package:flutter/material.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage();

  @override
  _SchedulePageState createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 20, right: 20, bottom: 35),
            alignment: Alignment.topRight,
            child: const Text(
              "Cronograma",
              style: TextStyle(
                color: Colors.black,
                fontSize: 40,
                fontFamily: "Quicksand",
                fontWeight: FontWeight.w500
              ),
            )
          ),

          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only()
              ),
            ),
          )
        ],
      )
    );
  }
}