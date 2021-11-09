import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'functions/local_storage_functions.dart';

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
      "/":          (context) => HomePage(),
      "/loading":   (context) => LoadingScreen(),
      "/dashboard": (context) => Dashboard()
    },
  ));
  
  Stopwatch stopwatch = Stopwatch()..start();

  var user_data = await UserLocalStorageFunctions().readData().catchError(print);

  if(stopwatch.elapsedMilliseconds < 1500)
  {
    Future.delayed(Duration(milliseconds: (1500 - stopwatch.elapsedMilliseconds))).then((value){
      if(user_data?.isEmpty ?? true)
        Get.offAndToNamed("/");
      else
        Get.offAndToNamed("/dashboard");
    });
  }
  else
  {
    if(user_data?.isEmpty ?? true)
      Get.offAndToNamed("/");
    else
      Get.offAndToNamed("/dashboard");
  }
}