import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nous/components/widgets.dart';
import 'package:nous/config.dart';
import 'package:nous/functions/in_app_data.dart';
import 'package:nous/functions/schedule_functions.dart';
import 'package:nous/functions/todo_functions.dart';

class EditTask extends StatefulWidget {
  const EditTask();

  @override
  _EditTaskState createState() => _EditTaskState();
}

class _EditTaskState extends State<EditTask> {
  late TimeOfDay initialTime = TimeOfDay.now();
  late TimeOfDay finalTime = TimeOfDay.now();
  late DateTime date = DateTime.now();
  late TimeOfDay picked = TimeOfDay.now();

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

  changeColor(nextColor, {state = true})
  {
    if(state)
    {
      setState(() {
        colorNumber = nextColor;
        color = Config().getTaskColor(nextColor);
        Navigator.of(context).pop();
      });
    }
    else
    {
      colorNumber = nextColor;
      color = Config().getTaskColor(nextColor);
    }
  }

  changeIcon(nextIcon, {state = true})
  {
    if(state)
    {
      setState(() {
        iconNumber = nextIcon;
        icon = Config().getTaskIcon(nextIcon);
        Navigator.of(context).pop();
      });
    }
    else
    {
      iconNumber = nextIcon;
      icon = Config().getTaskIcon(nextIcon);
    }
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

  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  Color color = Config().getTaskColor(0);
  int colorNumber = 0;

  var icon = Config().getTaskIcon(0);
  int iconNumber = 0;

  bool loading = false;

  dynamic task_id = 0;

  dynamic weekday;

  bool firstTime = true;

  @override
  Widget build(BuildContext context)
  {
    final arguments = ModalRoute.of(context)!.settings.arguments as EditTaskArguments;

    todo = arguments.todo;
    final taskData = arguments.taskData;

    if(firstTime)
    {
      if(todo)
      {
        nameController.text = taskData["description"];
        task_id = taskData["id"];
      }
      else
      {
        nameController.text = taskData["name"];
        descriptionController.text = taskData["description"] ?? "";
        
        initialTime = TimeOfDay(
          hour: int.parse(taskData["initial_time"].substring(0,2)),
          minute: int.parse(taskData["initial_time"].substring(3,5))
        );

        finalTime = TimeOfDay(
          hour: int.parse(taskData["final_time"].substring(0,2)),
          minute: int.parse(taskData["final_time"].substring(3,5))
        );

        date = DateTime.parse(taskData["date"] ?? DateTime.now().toString());

        weekday = taskData["weekday"];

        if(taskData["date"] != null)
          noRepeat = true;

        changeIcon(int.parse(taskData["icon"]), state: false);

        changeColor(int.parse(taskData["color"]), state: false);

        task_id = taskData["id"];
      }

      firstTime = false;
    }

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
                        "Editar Atividade",
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
                      Container(
                        padding: EdgeInsets.only(top: 50),
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
                        maxLength: todo ? 30 : 20
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

                      !todo && noRepeat
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

                      !todo && noRepeat
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

                      !todo
                      ? Container(
                        padding: EdgeInsets.only(top: 30),
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          "Selecione o horário:",
                          style: TextStyle(
                            fontSize: 18,
                          )
                        )
                      )
                      : Container(),
                      
                      !todo
                      ? Container(
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
                      : Container(),

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

    if(!todo)
    {
      ScheduleFunctions().editScheduleTask(
        task_id     : task_id,
        user_id     : global_user_data["id"],
        name        : nameController.text,
        description : descriptionController.text,
        initialTime : initialTime,
        finalTime   : finalTime,
        color       : colorNumber,
        icon        : iconNumber,
        noRepeat    : noRepeat,
        weekday     : weekday,
        date        : getDate
      ).then((value){
        if(taskCreated)
          Navigator.pop(context);
      });
    }
    else
    {
      TodoFunctions().editTodoTask(
        task_id: task_id,
        user_id: global_user_data["id"],
        description: nameController.text
      ).then((value){
        if(taskCreated)
          Navigator.pop(context);
      });
    }

    setState(() {
      loading = false;
    });
  }
}