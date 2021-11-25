import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'dart:async';

class Timer extends StatefulWidget {
  const Timer({Key? key}) : super(key: key);

  @override
  _TimerState createState() => _TimerState();
}

class _TimerState extends State<Timer> {
  late Timer timer;

  _StartTimer() {}

  double percent = 0;
  static int TimeinMinut = 25;
  int TimeInSec = TimeinMinut * 60;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 40, left: 20, right: 20),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 242, 244, 245),
        ),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(width: 0.8),
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    child: IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(Icons.arrow_back, size: 24)),
                  ),
                ],
              ),

              Padding(
                padding: EdgeInsets.only(top: 18),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Tempo restante",
                      style: TextStyle(
                        color: Color.fromARGB(255, 77, 77, 77),
                        fontSize: 48,
                      ),
                    ),
                    SizedBox(height: 40),
                    Text(
                      "Timer",
                      style: TextStyle(
                        color: Color.fromARGB(255, 77, 77, 77),
                        fontWeight: FontWeight.w300,
                      ),
                    )
                  ],
                )
              ),
  
            Container(
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.only(top: 50),
              child: Expanded(
                child: Container(
                  alignment: Alignment.center,
                  child: CircularPercentIndicator(
                    percent: 0.6,
                    animation: true,
                    animateFromLastPercent: true,
                    radius: 250.0,
                    lineWidth: 5,
                    progressColor: Color.fromARGB(255, 255, 104, 132),
                    center: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(250),
                      ),
                      child: (Text(
                        "12:00",
                        style: TextStyle(
                          color: Color.fromARGB(255, 77, 77, 77),
                          fontSize: 96,
                        ),
                      )),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.236),
            
            Expanded(
              child: Align(
              alignment: FractionalOffset.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                        top: 15, right: 15, left: 15, bottom: 8),
                        margin: EdgeInsets.only(top: 15),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 255, 104, 132),
                            borderRadius: BorderRadius.all(
                              Radius.circular(25),
                            ),
                          ),

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.only(right: 40, bottom: 10),
                          child: Icon(
                            Icons.video_call,
                            color: Colors.white,
                            size: 56,
                          ),
                        ),

                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Text(
                                  "Reunião",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 36,
                                    color: Colors.white,
                                  )
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
