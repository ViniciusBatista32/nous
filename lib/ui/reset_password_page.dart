import 'package:flutter/material.dart';
import 'package:nous/components/widgets.dart';
import 'package:nous/functions/users_functions.dart';

class ResetPasswordPage extends StatefulWidget {
  PageController _pageController = PageController();

  ResetPasswordPage(this._pageController);

  @override
  _ResetPasswordPage createState() => _ResetPasswordPage();
}

class _ResetPasswordPage extends State<ResetPasswordPage> {
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(left: 50, right: 50),
        decoration: const BoxDecoration(
          color: Colors.transparent
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

              WidgetComponents().CustomFormField(
                controller: emailController,

                validator: (value){
                  if(value!.isEmpty)
                  {
                    return "Insira um Email!";
                  }
                  else if(!value.contains("@") || !value.contains("."))
                  {
                    return "Insira um Email válido!";
                  }
                },

                hintText: "Digite seu Email",
                padding: EdgeInsets.only(top: 25),
                keyboardType: TextInputType.emailAddress,
              )
            ],
          ),
        )
      )
    );
  }

  void resetPassword() async
  {
    UsersFunctions().resetPasswordFunction(loginFormKey, emailController.text);
  }
}