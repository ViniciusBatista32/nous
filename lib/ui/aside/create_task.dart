import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nous/components/widgets.dart';
import 'package:nous/config.dart';
import 'package:nous/functions/in_app_data.dart';
import 'package:nous/functions/schedule_functions.dart';

class CreateTask extends StatefulWidget {
  const CreateTask();

  @override
  _CreateTaskState createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {
  late TimeOfDay initialTime;
  late TimeOfDay finalTime;
  late DateTime date;
  late TimeOfDay picked;

  @override 
  void initState()
  {
    super.initState();

    initialTime = TimeOfDay.now();

    if(TimeOfDay.now().minute == 59)
      finalTime = TimeOfDay.now().replacing(hour: TimeOfDay.now().hour + 1, minute: 00);
    else
      finalTime = TimeOfDay.now().replacing(minute: TimeOfDay.now().minute + 1);

    date = DateTime.now();
  }

  Future selectTime(BuildContext context, {initTime = true}) async
  {
    TimeOfDay nullValue = initTime ? initialTime : finalTime;

    picked = (
      await showTimePicker(
        context: context,
        initialTime: initTime ? initialTime : finalTime,
      )
    ) ?? nullValue;

    if(picked != null)
    {
      setState(() {
        if(initTime)
          initialTime = picked;
        else
          finalTime = picked;
      });
    }
  }

  Future pickdate(BuildContext context) async
  {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      locale: const Locale("pt", "BR"),

      context: context,
      initialDate: initialDate,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5)
    );

    if(newDate == null)
      return;

    setState(() {
      date = newDate;
    });
  }

  changeColor(nextColor)
  {
    setState(() {
      colorNumber = nextColor;
      color = Config().getTaskColor(nextColor);
      Navigator.of(context).pop();
    });
  }

  changeIcon(nextIcon)
  {
    setState(() {
      iconNumber = nextIcon;
      icon = Config().getTaskIcon(nextIcon);
      Navigator.of(context).pop();
    });
  }

  selectTaskColor(BuildContext context)
  {
    return showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text("Selecione uma cor para a tarefa"),

        content: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  WidgetComponents().SelectColorBox(9, () => changeColor(9)),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  WidgetComponents().SelectColorBox(0, () => changeColor(0)),
                  WidgetComponents().SelectColorBox(1, () => changeColor(1)),
                  WidgetComponents().SelectColorBox(2, () => changeColor(2))
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  WidgetComponents().SelectColorBox(3, () => changeColor(3)),
                  WidgetComponents().SelectColorBox(4, () => changeColor(4)),
                  WidgetComponents().SelectColorBox(5, () => changeColor(5))
                ],
              ),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  WidgetComponents().SelectColorBox(6, () => changeColor(6)),
                  WidgetComponents().SelectColorBox(7, () => changeColor(7)),
                  WidgetComponents().SelectColorBox(8, () => changeColor(8))
                ],
              )
            ],
          ),
        ),
      );
    });
  }

  selectTaskIcon(BuildContext context)
  {
    return showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text("Selecione um ícone para a tarefa"),

        content: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              WidgetComponents().SelectIconRow([0, 1, 2, 3, 4], changeIcon),
              WidgetComponents().SelectIconRow([5, 6, 7, 8, 9], changeIcon),
              WidgetComponents().SelectIconRow([10, 11, 12, 13, 14], changeIcon),
              WidgetComponents().SelectIconRow([15, 16, 17, 18, 19], changeIcon),
              WidgetComponents().SelectIconRow([20, 21, 22, 23, 24], changeIcon),
              WidgetComponents().SelectIconRow([25, 26, 27, 28, 29], changeIcon),
              WidgetComponents().SelectIconRow([30, 31, 32, 33, 34], changeIcon)
            ],
          ),
        ),
      );
    });
  }

  bool todo = false;
  bool noRepeat = false;
  dynamic weekdays = [false, false, false, false, false, false, false];

  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  Color color = Config().getTaskColor(0);
  int colorNumber = 0;

  var icon = Config().getTaskIcon(0);
  int iconNumber = 0;

  bool loading = false;
  bool firstTime = true;

  @override
  Widget build(BuildContext context)
  {
    final arguments = ModalRoute.of(context)!.settings.arguments as CreateTaskArguments;

    final page = arguments.actualPage;
    final weekday = arguments.globalWeekday;

    if(firstTime)
      weekdays[weekday - 1] = true;
    
    if(page == 2 && firstTime)
    {
      todo = true;
      firstTime = false;
    }
    else
      firstTime = false;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 242, 244, 244),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(top: 200),

                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40))
                    ),
                  ),
                )
              )
            ]
          ),

          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 80, left: 20, right: 20, bottom: 50),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(width: 0.8),
                          borderRadius: BorderRadius.all(Radius.circular(50))
                        ),

                        child: IconButton(onPressed: (){
                          Navigator.pop(context);
                        },

                        icon: Icon(Icons.arrow_back, size: 24))
                      ),
                      
                      const Text(
                        "Nova Atividade",
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40))
                  ),

                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [

                          Container(
                            padding: EdgeInsets.zero,
                            margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.027),
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

                            child: TextButton(
                              onPressed: (){
                                setState((){
                                  todo = false;
                                });
                              },

                              child: Text(
                                "Cronograma",
                                style: !todo
                                ? const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18,
                                  color: Colors.black87,
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
                                  todo = true;
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

                      Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 40),
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              "Tarefa",
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                
                
                          WidgetComponents().TaskFormField(
                            controller: nameController,
                            padding: EdgeInsets.only(top: 10),
                            keyboardType: TextInputType.text,
                            contentPadding: EdgeInsets.only(left: 10, top: 10),
                            maxLines: 1,
                          ),

                          !todo
                          ? Container(
                            padding: EdgeInsets.only(top: 30),
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              "Descrição",
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          )
                          : Container(),

                          !todo
                          ? WidgetComponents().TaskFormField(
                            controller: descriptionController,
                            padding: EdgeInsets.only(top: 10),
                            keyboardType: TextInputType.multiline,
                            contentPadding: EdgeInsets.only(left: 10, top: 30),
                            maxLines: 3,
                          )
                          : Container(),
                        ],
                      ),

                      !todo
                      ? Row(
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 30, right: 10),
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              "Cor",
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),

                          Container(
                            padding: EdgeInsets.only(top: 30),
                            child: GestureDetector(
                              onTap: (){
                                selectTaskColor(context);
                              },

                              child: Container(
                                decoration: BoxDecoration(
                                  color: color,
                                  borderRadius: BorderRadius.all(Radius.circular(7))
                                ),
                                width: 25,
                                height: 25,
                              ),
                            )
                          ),

                          Container(
                            padding: EdgeInsets.only(left: 20, top: 30, right: 10),
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              "Ícone",
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            )
                          ),

                          Container(
                            padding: EdgeInsets.only(top: 30),
                            child: GestureDetector(
                              onTap: (){
                                selectTaskIcon(context);
                              },

                              child: Icon(
                                icon,
                                size: 30,
                                color: Colors.grey.shade800,
                              ),
                            )
                          )
                        ],
                      )
                      : Container(),

                      !todo
                      ? Row(
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 20),
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              "Não Repetir",
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),

                          Container(
                            padding: EdgeInsets.only(top: 20),
                            child: Switch(
                              value: noRepeat,
                              onChanged: (value){
                                setState(() {
                                  noRepeat = value;
                                });
                              },
                              activeTrackColor: Color.fromARGB(255, 255, 156, 174),
                              activeColor: Colors.white,
                              inactiveThumbColor: Colors.white,
                            ),
                          )
                        ],
                      )
                      : Container(),

                      !todo && !noRepeat
                      ? Container(
                        padding: EdgeInsets.only(top: 20),
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          "Selecione os dias:",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      )
                      : Container(),
                      
                      !todo && !noRepeat
                      ? Container(
                        padding: EdgeInsets.only(top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            WidgetComponents().CronogramTaskCard(
                              "Dom",
                              (){
                                setState(() {
                                  weekdays[6] = !weekdays[6];
                                });
                              },
                              selected: weekdays[6]
                            ),
            
                            WidgetComponents().CronogramTaskCard(
                              "Seg",
                              (){
                                setState(() {
                                  weekdays[0] = !weekdays[0];
                                });
                              },
                              selected: weekdays[0]
                            ),
            
                            WidgetComponents().CronogramTaskCard(
                                "Ter",
                                (){
                                  setState(() {
                                    weekdays[1] = !weekdays[1];
                                  });
                              },
                              selected: weekdays[1]
                            ),
            
                            WidgetComponents().CronogramTaskCard(
                              "Qua",
                              (){
                                setState(() {
                                  weekdays[2] = !weekdays[2];
                                });
                              },
                              selected: weekdays[2]
                            ),
            
                            WidgetComponents().CronogramTaskCard(
                              "Qui",
                              (){
                                setState(() {
                                  weekdays[3] = !weekdays[3];
                                });
                              },
                              selected: weekdays[3]
                            ),
            
                            WidgetComponents().CronogramTaskCard(
                              "Sex",
                              (){
                                setState(() {
                                  weekdays[4] = !weekdays[4];
                                });
                              },
                              selected: weekdays[4]
                            ),
            
                            WidgetComponents().CronogramTaskCard(
                              "Sáb",
                              (){
                                setState(() {
                                  weekdays[5] = !weekdays[5];
                                });
                              },
                              selected: weekdays[5]
                            ),
                          ],
                        ),
                      )
                      : Container(),

                      todo || noRepeat
                      ? Container(
                        padding: EdgeInsets.only(top: 30),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Selecione o dia:",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      )
                      : Container(),

                      todo || noRepeat
                      ? Container(
                        padding: EdgeInsets.only(top: 20),
                        child: SizedBox(
                          width: double.infinity,
                          child: ElevatedButton.icon(
                            onPressed: () {
                              pickdate(context);
                            },
                            label: Text(
                              "${date.day}/${date.month}/${date.year}",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              side: BorderSide(color: Colors.grey.shade300)
                            ),
                            icon: Icon(Icons.expand_more, size: 18, color: Colors.black),
                          )
                        ),
                      )
                      : Container(),

                      Container(
                        padding: EdgeInsets.only(top: 30),
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          "Selecione o horário:",
                          style: TextStyle(
                            fontSize: 18,
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
                                      )
                                    ),

                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.white,
                                        side: BorderSide(color: Colors.grey.shade300)
                                      ),

                                      onPressed: (){
                                        selectTime(context);
                                      },

                                      child: Padding(
                                        padding: EdgeInsets.fromLTRB(30, 5, 30, 5),

                                        child: Text(
                                          "${initialTime.hour.toString().length == 1 ? 0 : ''}${initialTime.hour}:${initialTime.minute.toString().length == 1 ? 0 : ''}${initialTime.minute}",
                                          style: const TextStyle(
                                            fontSize: 20,
                                            color: Colors.black
                                          )
                                        ),
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
                                      )
                                    ),

                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.white,
                                        side: BorderSide(color: Colors.grey.shade300)
                                      ),
                                      onPressed: (){
                                        selectTime(context, initTime: false);
                                      },

                                      child: Padding(
                                        padding: EdgeInsets.fromLTRB(30, 5, 30, 5),

                                        child: Text(
                                          "${finalTime.hour.toString().length == 1 ? 0 : ''}${finalTime.hour}:${finalTime.minute.toString().length == 1 ? 0 : ''}${finalTime.minute}",
                                          style: const TextStyle(
                                            fontSize: 20,
                                            color: Colors.black
                                          )
                                        ),
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

                      WidgetComponents().ButtonCreateTask(
                        loading
                        ? null
                        : (){
                          createTask(context);
                        }
                      ),

                      const Padding(padding: EdgeInsets.only(top: 30, bottom: 15))
                    ]
                  ),
                )
              ],
            ),
          ),
        ]
      )
    );
  }
  
  createTask(BuildContext context)
  {
    setState(() {
      loading = true;
    });
    
    FocusScope.of(context).unfocus();

    var getDate = "${date.year}-${date.month}-${date.day}";

    if(noRepeat)
      weekdays = date.weekday - 1;

    if(!todo)
    {
      ScheduleFunctions().createScheduleTask(
        user_id     : global_user_data["id"],
        name        : nameController.text,
        description : descriptionController.text,
        initialTime : initialTime,
        finalTime   : finalTime,
        color       : colorNumber,
        icon        : iconNumber,
        noRepeat    : noRepeat,
        weekdays    : weekdays,
        date        : getDate
      ).then((value){
        if(taskCreated)
          Navigator.pop(context);
      });
    }
    else
    {
      // Create to-do task
    }

    setState(() {
      loading = false;
    });
  }
}