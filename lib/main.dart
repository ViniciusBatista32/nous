import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'dart:convert';

import 'functions/local_storage_functions.dart';

import 'package:nous/ui/home_page.dart';
import 'package:nous/ui/dashboard.dart';

main()
async {
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
      "/dashboard": (context) => Dashboard()
    },
  ));
}