import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  PageController _pageController = PageController();

  WelcomePage(this._pageController);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(left: 60, right: 60),
        color: Colors.transparent,
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            Text(
              "NOÛS",
              textAlign: TextAlign.center,

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

            Container(
              padding: const EdgeInsets.only(top: 15),
              child: const Text(
                "Produtividade de maneira simplificada, até porque ser produtivo é ser simples",
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 40, left: 30, right: 30),
              child: ElevatedButton(
                onPressed: (){
                  widget._pageController.animateToPage(2, duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
                },

                child: const Text(
                  "Login",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20
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
              padding: EdgeInsets.only(top: 3),
              child: Text(
                "Ainda não tem conta?",
                textAlign: TextAlign.center
              )
            ),

            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: ElevatedButton(
                onPressed: (){
                  widget._pageController.animateToPage(0, duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
                },
                
                child: const Text(
                  "Criar Conta",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Color.fromARGB(255, 255, 104, 132)
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
        )
      )
    );
  }
}