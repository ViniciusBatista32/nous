import 'package:flutter/material.dart';
import 'package:nous/components/widgets.dart';
import 'package:nous/functions/in_app_data.dart';
import 'package:nous/ui/dashboard.dart';

class SchedulePage extends StatefulWidget {
  SchedulePage();

  @override
  _SchedulePageState createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage>
{
  // Variables
  // Get actual time
  DateTime now = new DateTime.now();
  
  // Control
  bool firstOpen = true;
  int dayCoefficient = 0;
  
  // Date
  int year = 0;
  int month = 0;
  int day = 0;
  int weekday = 0;

  // Data show
  int listLength = 0;
  List scheduleDayData = [];

  // Arrays of name
  var weekdaysName = ["Segunda", "Terça", "Quarta", "Quinta", "Sexta", "Sábado", "Domingo"];
  var minWeekdaysName = ["Seg", "Ter", "Qua", "Qui", "Sex", "Sáb", "Dom"];
  var monthsName = ["Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho", "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro"];

  getWeekdayName(coefficient)
  {
    int newWeekday = 0;

    coefficient -= 1;
    if(coefficient.isNegative)
      newWeekday = coefficient + ((coefficient.abs() / 7).ceil() * 7);
    else
    {
      if(coefficient > 6)
        newWeekday = coefficient - ((coefficient / 7).floor() * 7);
      else
        newWeekday = coefficient;
    }
    return minWeekdaysName[newWeekday];
  }

  getDay(coefficient)
  {
    DateTime newDate = DateTime(year, month, coefficient);
    return newDate.day;
  }

  getTaskColor(colorNumber)
  {
    switch (colorNumber) {
      case "0":
        return Colors.red;

      case "1":
        return Colors.orange;
      
      case "2":
        return Colors.yellow;

      case "3":
        return Colors.lime;

      case "4":
        return Colors.green;

      case "5":
        return Colors.lightBlue;

      case "6":
        return Colors.purple;

      case "7":
        return Colors.pink;

      case "8":
        return Colors.brown;

      case "9":
        return Colors.black;

      default:
        return Colors.black;
    }
  }

  @override
  Widget build(BuildContext context)
  {
    if(firstOpen)
    {
      year      = globalYear      != null ? globalYear      : now.year;
      month     = globalMonth     != null ? globalMonth     : now.month;
      day       = globalDay       != null ? globalDay       : now.day;
      weekday   = globalWeekday   != null ? globalWeekday   : now.weekday;

      firstOpen = false;
    }
    else
    {
      if(dayCoefficient != 0)
      {
        DateTime newDate = DateTime(year, month, (day + dayCoefficient));

        year    = newDate.year;
        month   = newDate.month;
        day     = newDate.day;
        weekday = newDate.weekday;

        globalYear      = year;
        globalMonth     = month;
        globalDay       = day;
        globalWeekday   = weekday;

        dayCoefficient = 0;
      }
    }

    scheduleDayData = global_schedule_data[weekday - 1];

    listLength = scheduleDayData.length;

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
            child: Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40))
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(top: 30),
                  
                  child: Column(
                    children: [

                      Padding(
                        padding: EdgeInsets.only(left: 30),

                        child: Container(
                          alignment: Alignment.topLeft,

                          child: Text(
                            "${weekdaysName[weekday - 1]}, $day de ${monthsName[month - 1].substring(0,3).toLowerCase()} de $year",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(top: 25),

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Container(
                              height: 48,
                              child: GestureDetector(
                                onTap: (){
                                  setState(() {
                                    dayCoefficient = -1;
                                  });
                                },

                                child: Icon(
                                  Icons.keyboard_arrow_left,
                                  size: 40
                                ),
                              ),
                            ),

                            WidgetComponents().WeeklyCard(
                              getWeekdayName(weekday - 2),
                              getDay(day - 2).toString(),
                              (){
                                setState(() {
                                  dayCoefficient = -2;
                                });
                              }
                            ),

                            WidgetComponents().WeeklyCard(
                              getWeekdayName(weekday - 1),
                              getDay(day - 1).toString(),
                              (){
                                setState(() {
                                  dayCoefficient = -1;
                                });
                              }
                            ),

                            WidgetComponents().WeeklyCard(
                              minWeekdaysName[weekday - 1],
                              day.toString(),
                              (){},
                              actual: true
                            ),

                            WidgetComponents().WeeklyCard(
                              getWeekdayName(weekday + 1),
                              getDay(day + 1).toString(),
                              (){
                                setState(() {
                                  dayCoefficient = 1;
                                });
                              }
                            ),

                            WidgetComponents().WeeklyCard(
                              getWeekdayName(weekday + 2),
                              getDay(day + 2).toString(),
                              (){
                                setState(() {
                                  dayCoefficient = 2;
                                });
                              }
                            ),

                            Container(
                              height: 48,
                              child: GestureDetector(
                                onTap: (){
                                  setState(() {
                                    dayCoefficient = 1;
                                  });
                                },

                                child: Icon(
                                  Icons.keyboard_arrow_right,
                                  size: 40
                                ),
                              ),
                            )
                          ],
                        ),
                      ),

                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(top: 30, left: 10),
                          
                          child: listLength > 0 ? ListView.builder(
                            padding: EdgeInsets.only(top: 10),
                            itemCount: listLength,
                            itemBuilder: (context, index){
                              return !(scheduleDayData[index]["date"] == null) && !(DateTime.parse(scheduleDayData[index]["date"].toString()) == DateTime(year, month, day))
                              ? Container()
                              : Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("${scheduleDayData[index]["initial_time"].substring(0,5)} –"),

                                    Padding(
                                      padding: EdgeInsets.only(left: 50, right: 30),
                                      child: WidgetComponents().ScheduleTask(
                                        scheduleDayData[index]["name"],
                                        scheduleDayData[index]["description"] ?? "",
                                        getTaskColor(scheduleDayData[index]["color"]),
                                        scheduleDayData[index]["initial_time"],
                                        scheduleDayData[index]["final_time"]
                                      )
                                    ),

                                    index + 1 == listLength
                                    ? Padding(
                                      padding: EdgeInsets.only(bottom: 100),
                                      child: Text("${scheduleDayData[index]["final_time"].substring(0,5)} –"),
                                    ) 
                                    : Container(),
                                  ],
                                ),
                              );
                            }
                          )
                          : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Nenhuma tarefa cadastrada",
                                style: TextStyle(
                                  fontSize: 20
                                ),
                              ),

                              const Text(
                                "Toque em + para adicionar",
                                style: TextStyle(
                                  fontSize: 20
                                ),
                              ),

                              Container(
                                padding: EdgeInsets.only(bottom: 100),
                              )
                            ],
                          ),
                        )
                      )
                    ],
                  ),
                ),
              ],
            )
          ),
        ],
      )
    );
  }
}