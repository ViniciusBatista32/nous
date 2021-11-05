import 'package:flutter/material.dart';
import 'package:nous/components/widgets.dart';
import 'package:nous/functions/users_functions.dart';


class LoginPage extends StatefulWidget {
  PageController _pageController = PageController();

  LoginPage(this._pageController);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  
  bool invisible = true;

  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final String action = "login";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(left: 50, right: 50),
            decoration: const BoxDecoration(color: Colors.transparent),

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
                      fontSize: 30,
                      shadows: [
                        Shadow(
                          offset: const Offset(0, 5),
                          blurRadius: 30.0,
                          color: Colors.grey.shade400,
                        ),
                      ],
                    ),
                  ),

                  const Padding(
                    padding: EdgeInsets.only(top: 40),
                    child: Text(
                      "Email",

                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18
                      ),
                    ),
                  ),

                  WidgetComponents().CustomFormField(
                    controller: emailController,

                    validator: (value) {
                      if(value!.isEmpty)
                        return "Insira um Email!";
                      else if (!value.contains("@") || !value.contains("."))
                        return "Insira um Email válido!";
                    },

                    padding: EdgeInsets.only(top: 10),
                    keyboardType: TextInputType.emailAddress,
                  ),

                  const Padding(
                    padding: EdgeInsets.only(top: 40),
                    child: Text(
                      "Senha",

                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      ),
                    ),
                  ),

                  WidgetComponents().CustomFormField(
                    controller: passwordController,
                    
                    validator: (value) {
                      if(value!.isEmpty)
                        return "Insira uma Senha!";
                    },
                    
                    hintText: "Digite sua Senha",
                    padding: EdgeInsets.only(top: 10),
                    keyboardType: TextInputType.text,
                    obscureText: true
                  ),

                  Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: TextButton(
                      child: const Text(
                        "Esqueceu sua senha?",

                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      onPressed: () {},
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
                            fontSize: 20),
                        ),
                      ),
                      
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 255, 104, 132)),
                        shadowColor: MaterialStateProperty.all<Color>(const Color.fromARGB(0, 0, 0, 0)),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))
                        )
                      )
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
                    child: ElevatedButton(
                      onPressed: ()
                      {
                        widget._pageController.animateToPage(
                          1,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeInOut
                        );
                      },

                      child: const Padding(
                        padding: EdgeInsets.only(top: 8, bottom: 8),
                        child: Text(
                          "Voltar",
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
          ),
        ),
      ),
    );
  }

  void login() async
  {
    if(loginFormKey.currentState!.validate())
      UsersFunctions().loginFunction(loginFormKey, emailController.text, passwordController.text);
  }
}
