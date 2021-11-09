import 'package:flutter/material.dart';
import 'package:nous/components/widgets.dart';
import 'package:nous/functions/users_functions.dart';

class SignUpPage extends StatefulWidget {
  PageController _pageController = PageController();

  SignUpPage(this._pageController);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool loading = false;

  @override
  Widget build(BuildContext context)
  {
    Color backColor = loading ? Color.fromARGB(255, 159, 64, 83) : Color.fromARGB(255, 255, 104, 132);

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(top: 50, left: 50, right: 50),
            child: Form(
              key: signUpFormKey,
              
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [

                  const Text(
                    "Cadastro",

                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 30
                    ),
                  ),

                  const Padding(
                    padding: EdgeInsets.only(top: 40),

                    child: Text(
                      "Nome",

                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18
                      ),
                    ),
                  ),

                  WidgetComponents().CustomFormField(
                    controller: nameController,

                    validator: (value){
                      if(value!.isEmpty)
                        return "Insira seu Nome!";
                    },

                    hintText: "Digite seu Nome",
                    padding: EdgeInsets.only(top: 10),
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

                    validator: (value){
                      if(value!.isEmpty)
                        return "Insira um Email!";
                      else if(!value.contains("@") || !value.contains("."))
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

                    validator: (value){
                      if(value!.isEmpty)
                        return "Insira uma Senha!";
                    },

                    hintText: "Digite sua Senha",
                    padding: EdgeInsets.only(top: 10),
                    keyboardType: TextInputType.text,
                    obscureText: true
                  ),
                
                  WidgetComponents().CustomFormField(
                    controller: confirmPasswordController,

                    validator: (value){
                      if(value!.isEmpty)
                        return "Insira uma Senha!";
                      else if(value != passwordController.text)
                        return "As senhas não coincidem!";
                    },

                    hintText: "Digite novamente sua Senha",
                    padding: EdgeInsets.only(top: 15),
                    keyboardType: TextInputType.text,
                    obscureText: true
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 40, left: 10, right: 10),

                    child: ElevatedButton(
                      onPressed: loading ? null : signUp,

                      child: const Padding(
                        padding: EdgeInsets.only(top: 8, bottom: 8),

                        child: Text(
                          "Cadastrar",
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

                      child: Padding(
                        padding: EdgeInsets.only(top: 8, bottom: 8),

                        child: Text(
                          "Voltar",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: backColor
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
      )
    );
  }

  void signUp() async
  {
    if(signUpFormKey.currentState!.validate())
    {
      FocusScope.of(context).unfocus();

      setState(() {
        loading = true;
      });

      UsersFunctions().signUpFunction(nameController.text, emailController.text, passwordController.text).then((value){
        if(value)
        {
          nameController.text = "";
          emailController.text = "";
          passwordController.text = "";
          confirmPasswordController.text = "";

          widget._pageController.animateToPage(
            1,
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOut
          );
        }
      });
    }
  }
}