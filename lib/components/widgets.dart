import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class WidgetComponents
{
  Widget CustomFormField({controller, validator, hintText, padding = 0, keyboardType = TextInputType.text, obscureText = false, suffixIcon = false})
  {
    return Padding(
      padding: padding,

      child: TextFormField(
        validator: validator,
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,

        decoration: InputDecoration(
          hintText: hintText,
          fillColor: Colors.grey.shade100,
          filled: true,
          suffixIcon: suffixIcon == false ? SizedBox.shrink() : suffixIcon,

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide(color: Colors.grey.shade200)
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide(color: Colors.grey)
          ),

          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide(color: Colors.red)
          ),

          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide(color: Colors.red.shade900)
          ),
        ),
      )
    );
  }

  Widget WeeklyCard(String weekday, String monthday, {actual = false})
  {
    return Padding(
      padding: EdgeInsets.only(left: 5, right: 5),
      child: Container(
        width: 52,
        decoration: BoxDecoration(
          color: actual ? Color.fromARGB(255, 255, 156, 174) : Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black12.withOpacity(0.3),
              spreadRadius: 0.1,
              blurRadius: 2,
              offset: Offset(1,1)
            )
          ]
        ),
        
        child: InkWell(
          onTap: (){},
          borderRadius: BorderRadius.circular(20),

          child: Padding(
          padding: EdgeInsets.only(top: 8, bottom: 8),

            child: Column(
              children: [

                Text(
                  weekday,
                  style: TextStyle(
                    fontSize: 18,
                    color: actual ? Colors.white : Colors.black
                  ),
                ),

                Text(
                  monthday,
                  style: TextStyle(
                    fontSize: 22,
                    color: actual ? Colors.white : Colors.black,
                    fontWeight: FontWeight.w500
                  )
                )
              ]
            )
          )
        )
      )
    );
  }

  Widget ScheduleTask(String taskName, Color taskColor)
  {
    return Container(
      padding: EdgeInsets.fromLTRB(30, 15, 10, 15),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: taskColor,
            spreadRadius: 0,
            blurRadius: 0,
            offset: Offset(-2,0)
          )
        ]
      ),

      child: Row(
        children: [
          Text(
            taskName,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold
            ),
          ),

          Expanded(
            child: GestureDetector(
              onTap: (){},
              child: Container(
                alignment: Alignment.centerRight, 
                child: Icon(
                  Icons.keyboard_arrow_right,
                ),
              )
            )
          )
        ],
      )
    );
  }
}