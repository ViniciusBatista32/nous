import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'dart:convert';

import 'package:nous/functions/local_storage_functions.dart';
import 'package:nous/functions/users_functions.dart';
import 'package:nous/request_handler/todo_request_handler.dart';

import 'package:nous/ui/home_page.dart';
import 'package:nous/ui/loading_screen.dart';
import 'package:nous/ui/dashboard.dart';

main() async
{
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
  ));

  runApp(GetMaterialApp(
    theme: ThemeData(
      fontFamily: "Quicksand",
    ),

    initialRoute: "/loading",

    routes: {
      "/homepage":  (context) => HomePage(),
      "/loading":   (context) => LoadingScreen(),
      "/dashboard": (context) => Dashboard()
    },
  ));

  void redirect(Stopwatch stopwatch, route)
  {
    if(stopwatch.elapsedMilliseconds < 1500)
    {
      Future.delayed(Duration(milliseconds: (1500 - stopwatch.elapsedMilliseconds))).then((value){
        Get.offAndToNamed(route);
      });
    }
  }
  
  Stopwatch stopwatch = Stopwatch()..start();

  var user_data = await LocalStorageFunctions().readData("user_data.json").catchError(print);

  if(user_data != null)
    user_data = jsonDecode(user_data);

  if(user_data?.isEmpty ?? true)
    redirect(stopwatch, "/homepage");
  else
  {
    UsersFunctions().loginFunction(user_data["email"], user_data["password"], md5_encode: false).then((value)
    {
      if(!value)
      {
        LocalStorageFunctions().saveData("[]", "user_data.json");
        redirect(stopwatch, "/homepage");
      }
    });
  }
}