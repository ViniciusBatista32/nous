import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/route_manager.dart';
import 'package:nous/components/widgets.dart';
import 'package:nous/ui/dashboard.dart';


class TaskPage extends StatefulWidget {
  const TaskPage();

  @override
  TaskPageState createState() => TaskPageState();
}

class TaskPageState extends State<TaskPage> {

  /* Programação do tempo */

  late TimeOfDay time;
  late TimeOfDay picked;

  @override 
  void initState()
  {
    super.initState();

    time = TimeOfDay.now();
  }

  Future selectTime(BuildContext context) async
  {
    picked = (
      await showTimePicker(
        context: context,
        initialTime: time,
      )
    )!;

    if(picked != null)
    {
      setState(() {
        time = picked;
      });
    }
  }

  /* Variáveis e afins */

  bool cronograma = true;
  bool todo = false;
  bool isSwitched = false;
  List isselected = [false, false, false, false, false, false, false];
  int page = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 40, left: 20, right: 20),
              height: MediaQuery.of(context).size.height * 0.170,

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 0.8),
                      borderRadius: BorderRadius.all(Radius.circular(50))
                    ),

                    child: IconButton(onPressed: (){
                      Get.toNamed("/dashboard");
                    },

                    icon: Icon(Icons.arrow_back, size: 24))
                  ),
                  
                  const Text(
                    "Nova Atividade",
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 77, 77, 77),
                    ),
                  ),
                ],
              ),
            ),

            Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(35), topRight: Radius.circular(35)),
              ),

              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [

                      Container(
                        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.027),
                        decoration: cronograma
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
                              page += 1;
                              if(page == 1)
                              {
                                todo = !todo;
                                cronograma = !cronograma;
                              }
                              if(page > 1)
                                page = 1;
                            });
                          },

                          child: Text(
                            "Cronograma",
                            style: cronograma
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
        
                          style: cronograma
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
                        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.027),
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
                              page -=1;

                              if(page == 0){
                              todo = !todo;
                              cronograma = !cronograma;
                              } if (page < 0){
                                page = 0;
                              }
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

                  Container(
                    padding: EdgeInsets.only(top: 40),
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      "Tarefa",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
        
        
                  WidgetComponents().TaskFormField(
                    validator: (value) {
                      if(value!.isEmpty)
                        return "Insira um nome!";
                    },
                    padding: EdgeInsets.only(top: 10),
                    keyboardType: TextInputType.text,
                    contentPadding: EdgeInsets.only(left: 10, top: 10),
                    maxLines: 1,
                  ),
        
                  Container(
                    padding: EdgeInsets.only(top: 30),
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      "Descrição",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
        
                  WidgetComponents().TaskFormField(
                    validator: (value) {
                      if(value!.isEmpty)
                        return "Insira uma descrição!";
                    },
                    padding: EdgeInsets.only(top: 10),
                    keyboardType: TextInputType.text,
                    contentPadding: EdgeInsets.only(left: 10, top: 30),
                    maxLines: 2,
                  ),
        
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 10),
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          "Repetir",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),

                      Container(
                        padding: EdgeInsets.only(top: 10),
                        child: Switch(
                          value: isSwitched,
                          onChanged: (value){
                            setState(() {
                              isSwitched = value;
                            });
                          },
                          activeTrackColor: Color.fromARGB(255, 255, 156, 174),
                          activeColor: Colors.white,
                          inactiveThumbColor: Colors.white,
                        ),
                      )
                    ],
                  ),
        
                  Container(
                    padding: EdgeInsets.only(top: 30),
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      "Selecione os dias:",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                    
                  Container(
                    padding: EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        WidgetComponents().CronogramTaskCard(
                          "Dom",
                          (){
                            setState(() {
                              isselected[6] = !isselected[6]; 
                            });
                          },
                          selected: isselected[6]
                        ),
        
                        WidgetComponents().CronogramTaskCard(
                          "Seg",
                          (){
                            setState(() {
                              isselected[0] = !isselected[0];
                            });
                          },
                          selected: isselected[0]
                        ),
        
                        WidgetComponents().CronogramTaskCard(
                            "Ter",
                            (){
                              setState(() {
                                isselected[1] = !isselected[1]; 
                              });
                          },
                          selected: isselected[1]
                        ),
        
                        WidgetComponents().CronogramTaskCard(
                          "Qua",
                          (){
                            setState(() {
                              isselected[2] = !isselected[2]; 
                            });
                          },
                          selected: isselected[2]
                        ),
        
                        WidgetComponents().CronogramTaskCard(
                          "Qui",
                          (){
                            setState(() {
                              isselected[3] = !isselected[3]; 
                            });
                          },
                          selected: isselected[3]
                        ),
        
                        WidgetComponents().CronogramTaskCard(
                          "Sex",
                          (){
                            setState(() {
                              isselected[4] = !isselected[4]; 
                            });
                          },
                          selected: isselected[4]
                        ),
        
                        WidgetComponents().CronogramTaskCard(
                          "Sáb",
                          (){
                            setState(() {
                              isselected[5] = !isselected[5]; 
                            });
                          },
                          selected: isselected[5]
                        ),
                      ],
                    ),
                  ),
                  
                  Container(
                    padding: EdgeInsets.only(top: 30),
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      "Selecione o horário:",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      )
                    )
                  ),
                  
                  Column(

                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [

                                const Text(
                                  "Início: ",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                  )
                                ),

                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(primary: Colors.white),
                                  onPressed: (){
                                    selectTime(context);
                                  },

                                  child: Text(
                                    "${time.hour}:${time.minute}",
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black
                                    )
                                  )
                                )
                              ]
                            ),

                            Column(
                              children: [

                                const Text(
                                  "Fim: ",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                  )
                                ),

                                ElevatedButton(
                                style: ElevatedButton.styleFrom(primary: Colors.white),
                                  onPressed: (){
                                    selectTime(context);
                                  },

                                  child: Text(
                                    "${time.hour}:${time.minute}", 
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black
                                    )
                                  )
                                )
                              ]
                            )
                          ]
                        )
                      )
                    ]
                  ),

                  const Padding(padding: EdgeInsets.all(15)),

                  WidgetComponents().ButtonCreateTask({}),

                  const Padding(padding: EdgeInsets.only(top: 30, bottom: 15))
                ]
              )
            )
          ]
        )
      )
    );
  }
}