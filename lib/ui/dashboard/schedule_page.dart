import 'package:flutter/material.dart';
import 'package:nous/components/widgets.dart';
import 'package:nous/functions/in_app_data.dart';

class SchedulePage extends StatefulWidget {
  SchedulePage();

  @override
  _SchedulePageState createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  changeWeekDay(coefficient)
  {
    int new_weekday = 0;
    if(coefficient.isNegative)
      new_weekday = coefficient + ((coefficient.abs() / 7).ceil() * 7);
    else
    {
      if(coefficient > 6)
        new_weekday = coefficient - ((coefficient / 7).floor() * 7);
      else
        new_weekday = coefficient;
    }
    return new_weekday;
  }
  
  // Arrays of name
  var weekdays_array = ["Segunda", "Terça", "Quarta", "Quinta", "Sexta", "Sábado", "Domingo"];
  var min_weekdays_array = ["Seg", "Ter", "Qua", "Qui", "Sex", "Sáb", "Dom"];
  var months_array = ["Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho", "Julho", "Agosto", "Setembro", "Oututro", "Novembro", "Dezembro"];

  // Variables of control
  bool first_open = true;
  int monthday = 0;
  int weekday_counter = 0;
  int monthday_counter = 0;

  @override
  Widget build(BuildContext context) {
    // Get actual time
    DateTime now = new DateTime.now();

    // Define weekday variables
    int weekday_number;
    String weekday_text;
    
    // If the state is setting for the first time, get the actual data
    if(first_open)
    {
      weekday_number = now.weekday - 1;
      weekday_text = weekdays_array[now.weekday - 1];
      weekday_counter = now.weekday - 1;

      monthday = now.day;
      first_open = false;
    }
    else
    {
      weekday_text = weekdays_array[changeWeekDay(weekday_counter)];
      weekday_number = weekday_counter;

      monthday += monthday_counter;
    }
    
    // Get month name
    String month = months_array[now.month - 1].substring(0,3).toLowerCase();

    // Get the selected or actual day tasks
    List schedule_day_data = global_schedule_data[changeWeekDay(weekday_number)];

    // Get the amount of tasks
    int list_length = schedule_day_data.length;

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
                            "$weekday_text, $monthday de $month",
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
                                    weekday_counter--;
                                    monthday_counter = -1;
                                  });
                                },

                                child: Icon(
                                  Icons.keyboard_arrow_left,
                                  size: 40
                                ),
                              ),
                            ),

                            WidgetComponents().WeeklyCard(
                              "${min_weekdays_array[changeWeekDay(weekday_counter - 2)]}",
                              "${monthday - 2}"
                            ),

                            WidgetComponents().WeeklyCard(
                              "${min_weekdays_array[changeWeekDay(weekday_counter - 1)]}",
                              "${monthday - 1}"
                            ),

                            WidgetComponents().WeeklyCard(
                              "${min_weekdays_array[changeWeekDay(weekday_counter)]}",
                              "$monthday",
                              actual: true
                            ),

                            WidgetComponents().WeeklyCard(
                              "${min_weekdays_array[changeWeekDay(weekday_counter + 1)]}",
                              "${monthday + 1}"
                            ),

                            WidgetComponents().WeeklyCard(
                              "${min_weekdays_array[changeWeekDay(weekday_counter + 2)]}",
                              "${monthday + 2}"
                            ),

                            Container(
                              height: 48,
                              child: GestureDetector(
                                onTap: (){
                                  setState(() {
                                    weekday_counter++;
                                    monthday_counter = 1;
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
                          padding: EdgeInsets.only(top: 30, left: 10, right: 10),
                          
                          child: ListView.builder(
                            padding: EdgeInsets.only(top: 10, left: 40, right: 20),
                            itemCount: list_length,
                            itemBuilder: (context, index){
                              return Padding(
                                padding: EdgeInsets.only(bottom: 15),
                                child: WidgetComponents().ScheduleTask(
                                  schedule_day_data[index]["name"], Colors.red
                                ),
                              );
                            }
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