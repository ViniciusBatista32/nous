
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class TodoPage extends StatefulWidget {
  const TodoPage();

  @override
  _TodoPageState createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states){
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Color.fromARGB(255, 255, 156, 174);
    }

    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: 
      Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(onPressed: () {}
            , icon: Icon(Icons.arrow_back_ios, size: 24, color: Colors.black,)),
            Column(
              children: [
                Text("Hoje", style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(255, 77, 77, 77)
                ),),
                Text("Quint, 26.08", style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  color: Color.fromARGB(255, 77, 77, 77),
                ),)
              ],
            ),
            IconButton(onPressed: () {},
             icon: Icon(Icons.arrow_forward_ios)),
          ],
        ),
        Container(
            margin: EdgeInsets.only(top: 15,bottom: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: ListView.builder(
                itemBuilder: (context, index){
                  return CheckboxListTile(
                    title: Text("data"),
                    secondary: Icon(Icons.replay),
                    activeColor: Color.fromARGB(255, 255, 156, 174),
                    checkColor: Colors.white,
                    selected: isChecked,
                    value: isChecked, 
                    onChanged: (bool? value){
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  );
                },
              ),
            ),
        
            Container(
            margin: EdgeInsets.only(top: 15,bottom: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Row(
                children: [
                  Checkbox(value: isChecked,
                  fillColor: MaterialStateProperty.resolveWith(getColor),
                   onChanged: (bool? value){
                    setState(() {
                      isChecked = value!;
                    });
                  }),
                  Text(
                    "Trabalho de TCC",
                    style: TextStyle(
                      color: Color.fromARGB(255, 76, 76, 76),
                      fontSize: 16,
                    ),),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(right: 5),
                      alignment: Alignment.centerRight,
                      child: Icon(Icons.replay),
                    ))
                ],
              ),
            ),
            Container(
            margin: EdgeInsets.only(bottom: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Row(
                children: [
                  Checkbox(value: isChecked,
                  fillColor: MaterialStateProperty.resolveWith(getColor),
                   onChanged: (bool? value){
                    setState(() {
                      isChecked = value!;
                    });
                  }),
                  Text(
                    "Trabalho de TCC",
                    style: TextStyle(
                      color: Color.fromARGB(255, 76, 76, 76),
                      fontSize: 16,
                    ),),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(right: 5),
                      alignment: Alignment.centerRight,
                    ))
                ],
              ),
            ),
            Container(
            margin: EdgeInsets.only(bottom: 30),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
      ],
    ));
  }
}