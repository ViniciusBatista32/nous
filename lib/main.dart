import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nous/ui/welcome_page.dart';
import 'package:nous/ui/login_page.dart';
import 'package:nous/ui/home_page.dart';

main(){
   SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
  ));

  runApp(MaterialApp(
    theme: ThemeData(
      fontFamily: "Quicksand",
    ),

    initialRoute: "/",

    routes: {
      "/":      (context) => const WelcomePage(),
      "/login": (context) => const LoginPage(),
      "/home":  (context) => const HomePage(),
    },
  ));
}