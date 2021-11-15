
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:nous/functions/in_app_data.dart';
import 'package:nous/functions/todo_functions.dart';

class TodoPage extends StatefulWidget {
  const TodoPage();

  @override
  _TodoPageState createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  bool _checked = false;

  int listLenght = global_todo_data.length;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 35, right: 20),
            alignment: Alignment.topRight,
            child: const Text(
              "To-Do List",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w500
              ),
            )
          ),

          Expanded(
            child: ListView.builder(
              itemCount: listLenght,
              
              itemBuilder: (context, index){
                return Padding(
                  padding: EdgeInsets.fromLTRB(40, 10, 40, 10),

                  child: Dismissible(
                    onDismissed: (direction){

                    },

                    key: Key(DateTime.now().millisecondsSinceEpoch.toString()),
                    direction: DismissDirection.startToEnd,

                    background: Container(
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(12),
                      ),

                      child: Align(
                        alignment: Alignment(-0.9, 0),
                        child: Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                      ),
                    ),

                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),

                      child: CheckboxListTile(
                        value: global_todo_data[index]["completed"] == "1" ? true : false,
                        onChanged: (value){
                          setState(() {
                            var actual_completed = global_todo_data[index]["completed"];

                            global_todo_data[index]["completed"] = actual_completed == "0" ? "1" : "0";

                            TodoFunctions().checkUserTodo(
                              global_user_data["id"],
                              global_todo_data[index]["id"],
                              actual_completed == "0" ? 1 : 0
                            );
                          });
                        },

                        title: Text(
                          global_todo_data[index]["description"],
                          style: TextStyle(
                            fontSize: 18
                          ),
                        ),

                        secondary: GestureDetector(
                          onTap: (){},
                          child: Icon(Icons.edit),
                        ),

                        controlAffinity: ListTileControlAffinity.leading,
                        checkColor: Colors.white,
                        activeColor: Color.fromARGB(255, 255, 156, 174),
                      ),
                    )
                  )
                );
              },
            ),
          )
        ]
      )
    );
  }
}