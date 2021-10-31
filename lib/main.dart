import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:nous/ui/welcome_page.dart';
import 'package:nous/ui/login_page.dart';
import 'package:nous/ui/home_page.dart';
import 'package:nous/ui/dashboard.dart';

main(){
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
  ));

  runApp(GetMaterialApp(
    theme: ThemeData(
      fontFamily: "Quicksand",
    ),

    initialRoute: "/",

    routes: {
      "/":          (context) => HomePage(),
      "/dashboard": (context) => DashBoard()
    },
  ));
}