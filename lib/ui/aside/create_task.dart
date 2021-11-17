import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nous/components/widgets.dart';
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

  bool todo = false;
  bool noRepeat = false;
  List isSelected = [false, false, false, false, false, false, false];

  GlobalKey<FormState> createTaskFormKey = GlobalKey<FormState>();
  bool loading = false;
  bool firstTime = true;

  @override
  Widget build(BuildContext context)
  {
    var routeData = ModalRoute.of(context)!.settings.arguments ?? 0;
    
    if(routeData == 2 && firstTime)
    {
      todo = true;
      firstTime = false;
    }

    return Scaffold(
      body: SingleChildScrollView(
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

                  Form(
                    key: createTaskFormKey,

                    child: Column(
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
                          validator: (value) {
                            if(value!.isEmpty)
                              return "Insira um nome!";
                          },
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
                          padding: EdgeInsets.only(top: 10),
                          keyboardType: TextInputType.multiline,
                          contentPadding: EdgeInsets.only(left: 10, top: 30),
                          maxLines: 3,
                        )
                        : Container(),
                      ],
                    ),
                  ),

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
                              isSelected[6] = !isSelected[6]; 
                            });
                          },
                          selected: isSelected[6]
                        ),
        
                        WidgetComponents().CronogramTaskCard(
                          "Seg",
                          (){
                            setState(() {
                              isSelected[0] = !isSelected[0];
                            });
                          },
                          selected: isSelected[0]
                        ),
        
                        WidgetComponents().CronogramTaskCard(
                            "Ter",
                            (){
                              setState(() {
                                isSelected[1] = !isSelected[1]; 
                              });
                          },
                          selected: isSelected[1]
                        ),
        
                        WidgetComponents().CronogramTaskCard(
                          "Qua",
                          (){
                            setState(() {
                              isSelected[2] = !isSelected[2]; 
                            });
                          },
                          selected: isSelected[2]
                        ),
        
                        WidgetComponents().CronogramTaskCard(
                          "Qui",
                          (){
                            setState(() {
                              isSelected[3] = !isSelected[3]; 
                            });
                          },
                          selected: isSelected[3]
                        ),
        
                        WidgetComponents().CronogramTaskCard(
                          "Sex",
                          (){
                            setState(() {
                              isSelected[4] = !isSelected[4]; 
                            });
                          },
                          selected: isSelected[4]
                        ),
        
                        WidgetComponents().CronogramTaskCard(
                          "Sáb",
                          (){
                            setState(() {
                              isSelected[5] = !isSelected[5]; 
                            });
                          },
                          selected: isSelected[5]
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
                      createTask();
                    }
                  ),

                  const Padding(padding: EdgeInsets.only(top: 30, bottom: 15))
                ]
              )
            ),
          ]
        )
      ),
    );
  }
  
  createTask() async
  {
    setState(() {
      loading = true;
    });
    
    if(createTaskFormKey.currentState!.validate())
    {
      FocusScope.of(context).unfocus();

      var getInitialTime = initialTime.hour * 60 + initialTime.minute;
      var getFinalTime = finalTime.hour * 60 + finalTime.minute;

      if(getInitialTime > getFinalTime)
      {
        Get.snackbar("Horário inválido", "O horário de inicio não pode ser maior que o horário final");

        setState(() {
          loading = false;
        });

        return false;
      }
      else if(getInitialTime == getFinalTime)
      {
        Get.snackbar("Horário inválido", "O horário de inicio não pode ser igual ao horário final");

        setState(() {
          loading = false;
        });
        
        return false;
      }

      if(!todo)
      {
        if(!noRepeat)
        {
          // await ScheduleFunctions().createScheduleTask();
        }
        else
        {
          // await ScheduleFunctions().createScheduleTask();
        }
      }
      else
      {

      }
    }

    setState(() {
      loading = false;
    });
  }
}