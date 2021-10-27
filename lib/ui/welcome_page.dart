import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage();

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(left: 70, right: 70),
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
              width: MediaQuery.of(context).size.width * 0.70,
              
              child: const Text(
                "Produtividade de maneira simplificada, até porque ser produtivo é ser simples",
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              )
            ),

            Padding(
              padding: const EdgeInsets.only(top: 40, left: 35, right: 35),
              child: ElevatedButton(
                onPressed: (){},
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
              padding: EdgeInsets.only(top: 10),
              child: Text(
                "Ainda não tem conta?",
                textAlign: TextAlign.center
              )
            ),

            Padding(
              padding: const EdgeInsets.only(left: 35, right: 35),
              child: ElevatedButton(
                onPressed: (){},
                
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