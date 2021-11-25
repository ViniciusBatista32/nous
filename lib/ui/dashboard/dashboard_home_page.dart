import 'package:flutter/material.dart';
import 'package:nous/config.dart';
import 'package:nous/functions/in_app_data.dart';
import 'package:nous/ui/aside/timer.dart';

class DashboardHomePage extends StatefulWidget {
  const DashboardHomePage();

  @override
  _DashboardHomePageState createState() => _DashboardHomePageState();
}

class _DashboardHomePageState extends State<DashboardHomePage> {
  // _timer() async {
  //   Future.delayed(Duration(seconds: 10)).then((_) {
  //     setState(() {});
  //     _timer();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    // _timer();

    var weekday = DateTime.now().weekday - 1;

    var actualTaskData;
    var firstNextTaskData;
    var secondNextTaskData;

    bool stop = false;
    int count = 0;

    bool todo = false;
    bool noRepeat = false;

    global_schedule_data[weekday].forEach((data){
      if(!stop)
      {
        var now = DateTime.now();
        var day = "${now.year}-${now.month}-${now.day}";
        var initialDate = DateTime.parse("${now.year}-${now.month}-${now.day} ${data['initial_time']}");
        var finalDate = DateTime.parse("${now.year}-${now.month}-${now.day} ${data['final_time']}");

        pickFirst()
        {
          if(!(count + 1 >= global_schedule_data[weekday].length))
          {
            if(global_schedule_data[weekday][count + 1]["date"] == null)
            {
              firstNextTaskData = global_schedule_data[weekday][count + 1];
            }
            else if(global_schedule_data[weekday][count + 1]["date"] == day)
            {
              firstNextTaskData = global_schedule_data[weekday][count + 1];
            }
            else
            {
              count ++;
              pickFirst();
            }
          }
        }

        pickSecond()
        {
          if(!(count + 2 >= global_schedule_data[weekday].length))
          {
            if(global_schedule_data[weekday][count + 2]["date"] == null)
            {
                secondNextTaskData = global_schedule_data[weekday][count + 2];
            }
            else if(global_schedule_data[weekday][count + 1]["date"] == day)
            {
                secondNextTaskData = global_schedule_data[weekday][count + 2];
            }
            else
            {
              count ++;
              pickFirst();
            }
          }
        }
        
        if(now.isAfter(initialDate) && now.isBefore(finalDate) )
        {
          if(data["date"] == null || data["date"] == day)
          {
            stop = true;

            actualTaskData = data;

            pickFirst();
            pickSecond();
          }
        }
        else
          count++;
      }
    });

    stop = false;
    count = 0;

    if(actualTaskData == null)
    {
      global_schedule_data[weekday].forEach((data){
        if(!stop)
        {
          var now = DateTime.now();
          var initialDate = DateTime.parse("${now.year}-${now.month}-${now.day} ${data['initial_time']}");

          if(now.isBefore(initialDate))
          {
            firstNextTaskData = data;
            stop = true;

            if(!(count + 1 >= global_schedule_data[weekday].length))
              secondNextTaskData = global_schedule_data[weekday][count + 1];
          }
          else
            count++;
        }
      });
    }

    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      alignment: Alignment.topRight,
      child: Column(
        children: [
          Container(
            alignment: Alignment.topRight,
            child: const Text(
              "Dashboard",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w500
              ),
            )
          ),

          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(top: 20),
            child: const Text(
              "Próximas atividades",
              style: TextStyle(
                color: Color.fromARGB(255, 77, 77, 77),
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),

          Container(
            padding: EdgeInsets.only(top: 25),

            child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [

                      Container(
                        decoration: !todo
                        ? BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              spreadRadius: 0,
                              blurRadius: 10,
                              offset: Offset(0, 2),
                            )
                          ]
                        )
                        : BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),

                        padding: EdgeInsets.zero,
                        child: TextButton(
                          onPressed: (){
                            setState((){
                              todo = !todo;
                            });
                          },

                          child: Text(
                            "Cronograma",
                            style: !todo
                            ? const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                              color: Color.fromARGB(255, 77, 77, 77),   
                            )
                            : const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                              color: Color.fromARGB(255, 163, 163, 163),
                            ),
                          ),
        
                          style: !todo
                          ? ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 255, 255, 255)),
                            shadowColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 77, 77, 77)),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))
                            )
                          )
                          : ButtonStyle(
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))
                            )
                          ),
                        ),
                      ),
        
                      Container(
                        decoration: todo
                        ? BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              spreadRadius: 0,
                              blurRadius: 10,
                              offset: Offset(0, 2),
                            )
                          ]
                        )
                        : BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),

                        padding: EdgeInsets.zero,
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              todo = !todo;
                            });
                          },

                          child: Text(
                            "To do",
                            style: todo
                            ? TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                              color: Color.fromARGB(255, 77, 77, 77),   
                            )
                            : TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                              color: Color.fromARGB(255, 163, 163, 163),
                            ),
                          ),
        
                          style: todo
                          ? ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 255, 255, 255)),
                            shadowColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 77, 77, 77)),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))
                            )
                          )
                          : ButtonStyle(
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))
                            )
                          ),
                        ),
                      ),     
                    ],
                  ),
          ),
          
          Container(
            padding: EdgeInsets.only(top: 5, right: 15, left: 15),
            margin: EdgeInsets.only(top: 25),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                  topRight: Radius.circular(25)),
                  color: Color.fromARGB(255, 255, 104, 132),
            ),

            child: actualTaskData != null
              ? Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Config().getTaskIcon(actualTaskData["icon"]), color: Colors.white, size: 49),

                Column(
                  children: [
                    Text(
                      actualTaskData["name"],
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                        color: Colors.white,
                      )
                    ),

                    Text(
                      actualTaskData["final_time"].substring(0,5),
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: Colors.white,
                      )
                    )
                  ],
                ),

                Container(
                  alignment: Alignment.topRight,
                  padding: EdgeInsets.zero,
                  margin: EdgeInsets.zero,
                  
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      Align(
                        alignment: Alignment.topRight,

                        child: Text(
                          "Agora",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                      ),

                      Container(
                        alignment: Alignment.bottomRight,
                        margin: EdgeInsets.only(top: 20),

                        child: IconButton(
                          onPressed: () {
                            Navigator.pushNamed(context, "/timer");
                          },
                          icon: Icon(Icons.timer),
                          color: Colors.white,
                          iconSize: 24,
                        ),
                      ),
                    ],
                  ),
                )
              ]
            )
            : Container(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              alignment: Alignment.center,
              child: Column(
                children: [
                  Text(
                    "Nenhuma tarefa",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                      color: Colors.white,
                    )
                  ),

                  Text(
                    "no momento",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                      color: Colors.white,
                    )
                  ),
                ],
              )
            )
          ),

          Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 15, left: 15, bottom: 15),
                margin: EdgeInsets.only(top: 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15)),
                ),

                child: Column(
                  children: [
                    firstNextTaskData != null
                    ? Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Config().getTaskIcon(firstNextTaskData["icon"]),
                          size: 24,
                          color: Color.fromARGB(255, 77, 77, 77)
                        ),
                        
                        Container(
                          margin: EdgeInsets.only(left: 10, bottom: 10),

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                firstNextTaskData["name"],
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                  color: Color.fromARGB(255, 77, 77, 77),
                                ),
                              ),

                              Text(
                                firstNextTaskData["initial_time"].substring(0,5),
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 77, 77, 77),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                    : Container(),
                    
                    secondNextTaskData != null
                    ? Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Config().getTaskIcon(secondNextTaskData["icon"]),
                          size: 24,
                          color: Color.fromARGB(255, 77, 77, 77)
                        ),
                        
                        Container(
                          margin: EdgeInsets.only(left: 10),

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                secondNextTaskData["name"],
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                  color: Color.fromARGB(255, 77, 77, 77),
                                ),
                              ),

                              Text(
                                secondNextTaskData["initial_time"].substring(0,5),
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 77, 77, 77),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                    : const SizedBox(),

                    firstNextTaskData == null && secondNextTaskData == null
                    ? Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const[
                          Text(
                            "Sem próximas tarefas",
                            style: TextStyle(
                              fontSize: 15
                            ),
                          ),

                          Text(
                            "Toque em + para adicionar",
                            style: TextStyle(
                              fontSize: 15
                            ),
                          ),
                        ],
                      ),
                    )
                    : const SizedBox(),
                  ],
                )
              )
            ],
          ),          
        ],
      ),
    );
  }
}