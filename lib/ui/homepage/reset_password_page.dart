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
  GlobalKey<FormState> resetPasswordFormKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();

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
              key: resetPasswordFormKey,
              child: Column(

                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [

                  Text(
                    "Redefir senha",

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

                    hintText: "Digite seu Email",
                    padding: EdgeInsets.only(top: 10),
                    keyboardType: TextInputType.emailAddress,
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 40, left: 10, right: 10),
                    child: ElevatedButton(
                      onPressed: loading ? null : resetPassword,
                      
                      child: const Padding(
                        padding: EdgeInsets.only(top: 8, bottom: 8),
                        child: Text(
                          "Enviar",

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
                            2,
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
      ),
    );
  }

  void resetPassword() async
  {
    if(resetPasswordFormKey.currentState!.validate())
    {
      setState(() {
        loading = true;
      });

      FocusScope.of(context).unfocus();
      
      UsersFunctions().resetPasswordFunction(emailController.text).then((value){
        setState(() {
          loading = false;
        });

        if(value)
        {
          emailController.text = "";

          widget._pageController.animateToPage(
            2,
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOut
          );
        }
      });
    }
  }
}