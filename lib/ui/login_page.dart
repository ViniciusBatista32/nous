import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:crypto/crypto.dart';
import 'package:nous/functions/users_functions.dart';

class LoginPage extends StatefulWidget {
  const LoginPage();

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final String action = "login";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(left: 50, right: 50),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 255, 224, 230),
              Color.fromARGB(255, 255, 255, 255),
              Color.fromARGB(255, 255, 224, 230)
            ],
            stops: [0, 0.5, 1],
            begin: Alignment(-1, -1),
            end: Alignment(1, 0),
          )
        ),

        child: Form(
          key: loginFormKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              Text(
                "Login",

                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 40,
                  shadows: [
                    Shadow(
                      offset: const Offset(0, 5),
                      blurRadius: 30.0,
                      color: Colors.grey.shade400,
                    ),
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: 40),

                child: Text(
                  "Email",

                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 28,
                    shadows: [
                      Shadow(
                        offset: const Offset(0, 5),
                        blurRadius: 30.0,
                        color: Colors.grey.shade400,
                      ),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: 25),
                
                child: Column(
                  children: [
                    TextFormField(
                      validator: (value){
                        if(value!.isEmpty)
                        {
                          return "Insira um Email!";
                        }
                      },

                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,

                      decoration: InputDecoration(
                        hintText: "Digite seu Email",
                        fillColor: Colors.grey.shade100,
                        filled: true,

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
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: 40),

                child: Text(
                  "Senha",

                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 28,
                    shadows: [
                      Shadow(
                        offset: const Offset(0, 5),
                        blurRadius: 30.0,
                        color: Colors.grey.shade400,
                      ),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: 25),
                child: Column(
                  children: [
                    TextFormField(
                      validator: (value){
                        if(value!.isEmpty)
                        {
                          return "Insira uma Senha!";
                        }
                      },

                      controller: passwordController,
                      obscureText: true,

                      decoration: InputDecoration(
                        hintText: "Digite sua Senha",
                        fillColor: Colors.grey.shade100,
                        filled: true,

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
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 40, left: 10, right: 10),

                child: ElevatedButton(
                  onPressed: login,

                  child: const Padding(
                    padding: EdgeInsets.only(top: 8, bottom: 8),

                    child: Text(
                      "Login",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20
                      ),
                    ),
                  ),

                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 255, 104, 132)),

                    shadowColor: MaterialStateProperty.all<Color>(const Color.fromARGB(0, 0, 0, 0)),

                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      )
                    )
                  )
                ),
              ),

              const Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  "Ainda não tem conta?",
                  textAlign: TextAlign.center
                )
              ),

              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.pushNamed(context, "/login");
                  },

                  child: const Padding(
                    padding: EdgeInsets.only(top: 8, bottom: 8),

                    child: Text(
                      "Criar Conta",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 255, 104, 132)
                      ),
                    ),
                  ),

                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(0, 0, 0, 0)),

                    shadowColor: MaterialStateProperty.all<Color>(const Color.fromARGB(0, 0, 0, 0)),

                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                        side: const BorderSide(color: Color.fromARGB(255, 255, 104, 132))
                      )
                    )
                  )
                ),
              ),
            ],
          ),
        )
      )
    );
  }

  void login() async
  {
    dynamic emailInputValue = emailController.text;
    dynamic passwordInputValue = utf8.encode(passwordController.text);
    passwordInputValue = md5.convert(passwordInputValue).toString();

    if(loginFormKey.currentState!.validate())
    {
      final request = await UsersFunctions().loginRequest(emailInputValue, passwordInputValue);

      if(request["request_status"]["status"] == 0)
      {
        // do something
      }
    }
  }
}