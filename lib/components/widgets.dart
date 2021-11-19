import 'package:flutter/material.dart';

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

  Widget TaskFormField({controller, padding = 0,maxLines, contentPadding , validator, keyboardType = TextInputType.text}){
    return Padding(
      padding: padding,

      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        validator: validator,
        maxLines: maxLines,

        decoration: InputDecoration(
          fillColor: Color.fromARGB(255, 255, 255, 255),
          filled: true,
          contentPadding: contentPadding,

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(9),
            borderSide: BorderSide(color: Colors.black12),

          ),
          
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(9),
            borderSide: BorderSide(color: Colors.black38)
      )
    ),
  ),
 );
}

Widget ButtonCreateTask(onPressed){
  final shape = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(9)
  );

  return Material(
    color: Colors.transparent,
    shape: shape,
    elevation: 8,
    child: Container(
      decoration: ShapeDecoration(
        shape: shape,
        gradient: LinearGradient(
          begin: Alignment(-1, -1),
          end: Alignment(6, 6),
          colors: [
            Color.fromARGB(255, 255, 156, 174),
            Colors.white,
          ]
          ),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.only(bottom:5,top: 5,left: 30, right:30),
  
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          primary: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        child: Icon(Icons.done, size: 36,),

        onPressed: onPressed,
      ),
    ),
  );
}

  Widget CronogramTaskCard(String day, ontap, {selected = false}){
    return Padding(
      padding: EdgeInsets.only(left: 5, right: 5),
      child: Container(
        width: 40,
        decoration: BoxDecoration(
          color: selected ? Color.fromARGB(255, 255, 156, 174) : Colors.white,
          borderRadius: BorderRadius.circular(10),
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
          onTap: ontap,
          borderRadius: BorderRadius.circular(10),

          child: Padding(
          padding: EdgeInsets.only(top: 20, bottom: 20),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  day,
                  style: TextStyle(
                    fontSize: 16,
                    color: selected ? Colors.white : Colors.black
                  ),
                ),
              ]
            )
          )
        )
      )
    );
  }

  Widget WeeklyCard(String weekday, String monthday, ontap, {actual = false})
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
          onTap: ontap,
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

  Widget ExpandedOption(String minhaconta){
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(-2, 0),
          )
        ]
      ),

      child: Theme(
        data: ThemeData().copyWith(dividerColor: Colors.transparent),
         child: ExpansionTile(
           initiallyExpanded: false,
           textColor: Colors.black,
           iconColor: Color.fromARGB(255, 255, 156, 174),
           expandedCrossAxisAlignment: CrossAxisAlignment.center,

           title: Text(
             minhaconta,
             style: TextStyle(
               fontSize: 18,
               fontWeight: FontWeight.w400,
             ),
           ),
         ) 
      ),
    );
  }

  Widget ScheduleTask(String taskName, String description, Color taskColor, taskInit, taskFinal)
  {
    taskInit = taskInit.substring(0,5);
    taskFinal = taskFinal.substring(0,5);
    
    if(!description.isEmpty)
    {
      return Container(
        // padding: EdgeInsets.fromLTRB(30, 15, 10, 15),
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

        child: Theme(
          data: ThemeData().copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            initiallyExpanded: false,
            textColor: Colors.black,
            iconColor: Colors.black,
            expandedCrossAxisAlignment: CrossAxisAlignment.start,

            title: Text(
              taskName,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold
              ),
            ),

            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(16, 10, 10, 10),
                child: Text(
                  description,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),

              Container(
                padding: EdgeInsets.only(right: 10, bottom: 5),
                alignment: Alignment.centerRight,
                child: Text("$taskInit - $taskFinal"),
              )
            ],
          )
        )
      );
    }
    else
    {
      return Container(
        padding: EdgeInsets.fromLTRB(16, 17.5, 10, 17.5),
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
              child: Container(
                alignment: Alignment.centerRight,
                child: Text("$taskInit - $taskFinal"),
              )
            )
          ],
        )
      );
    }
  }

  Widget NavigationBall(bool isActive)
  {
    return Container(
      height: 30,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 150),
        margin: EdgeInsets.symmetric(horizontal: 4.0),
        height: 10,
        width: 12,
        
        decoration: BoxDecoration(
          boxShadow: [
            isActive
            ? BoxShadow(
              color: Colors.black,
              blurRadius: 0,
              spreadRadius: 3.0,
            )
            : BoxShadow(
              color: Colors.transparent,
            )
          ],
          
          shape: BoxShape.circle,
          color: isActive ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}