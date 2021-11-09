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

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    Color backColor = loading ? Color.fromARGB(255, 159, 64, 83) : Color.fromARGB(255, 255, 104, 132);
    
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(left: 50, right: 50),
            child: Form(
              key: loginFormKey,
              child: Column(

                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [

                  const Text(
                    "Login",

                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 30,
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

                    hintText: "Digite seu Email",
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
                    suffixIcon: GestureDetector(
                      onTap: (){
                        setState(() {
                          invisible = !invisible;
                        });
                      },
                      child: Icon(
                        invisible ? Icons.visibility_off : Icons.visibility,
                        color: Colors.pinkAccent,
                      )
                    ),

                    validator: (value) {
                      if(value!.isEmpty)
                        return "Insira uma Senha!";
                    },
                    
                    hintText: "Digite sua Senha",
                    padding: EdgeInsets.only(top: 10),
                    keyboardType: TextInputType.text,
                    obscureText: invisible
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
                      
                      onPressed: () {
                        widget._pageController.animateToPage(
                          3,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeInOut
                        );
                      },
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 40, left: 10, right: 10),
                    child: ElevatedButton(
                      onPressed: loading ? null : login,
                      
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
                        if(loading)
                          null;
                        else
                        {
                          widget._pageController.animateToPage(
                            1,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeInOut
                          );
                        }
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
    {
      FocusScope.of(context).unfocus();

      setState(() {
        loading = true;
      });

      UsersFunctions().loginFunction(emailController.text, passwordController.text).then((value)
      {
        if(!value)
        {
          setState(() {
            loading = false;
          });
        }
      });
    }
  }
}
