import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ArticlesView extends StatefulWidget {
  const ArticlesView({ Key? key }) : super(key: key);

  @override
  _ArticlesViewState createState() => _ArticlesViewState();
}

class _ArticlesViewState extends State<ArticlesView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 200,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        "assets/icons/teste.jpeg"
                      ),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(35)),
                  ),
                  
                ),

                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(30),
                      child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(width: 3, color: Colors.black),
                              borderRadius: BorderRadius.all(Radius.circular(50))
                            ),
                
                            child: Icon(Icons.arrow_back, size: 24, color: Colors.black,)
                          ),
                    ),
                  ),
                ),

                GestureDetector(
                  onTap: () {},

                  child: Padding(
                    padding: const EdgeInsets.only(top: 170, right: 10),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              spreadRadius: 0,
                              blurRadius: 10,
                              offset: Offset(0, 2),
                            )
                          ],
                          color: Colors.white,
                          border: Border.all(width: 8, color: Colors.white),
                          borderRadius: BorderRadius.all(Radius.circular(250))
                        ),
                        child: Icon(Icons.favorite_border, size: 36, color: Colors.black),
                      ),
                    ),
                  ),
                )
              ],
            ),

            Container(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "Leitura e TDAH",
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 36,
                    fontWeight: FontWeight.w700,
                    color: Colors.black
                  ),
                ),
              )
            ),

            Padding(
              padding: const EdgeInsets.only(top:10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    
                    Icon(Icons.people, size: 24, color: Colors.black),

                    Text(
                      "Raphael Costa Petinatti & Lucas Castro",
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),

                    GestureDetector(
                      child: Icon(Icons.volume_up, size: 24, color: Colors.black)
                    ),
                  ],
              ),
            ),

            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
                child: Container(
                  child: Text(
                    "A diferidas percepções e perspectivas de tempo pelos pacientes com TDAH operam como indicador fundamental relacionado ao grau da doença. Os pacientes que possuem um grau mais elevado de TDAH podem sofrer deturpações da passagem do tempo natural, ocasionando situações constrangedoras. ",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      letterSpacing: 0.5,
                      decoration: TextDecoration.none,
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ),
              )
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 20, bottom: 20),
                child: Container(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 0,
                          blurRadius: 10,
                          offset: Offset(0, 2),
                        )
                      ]
                    ),
                    child: TextButton.icon(
                      onPressed: (){},
                      icon: Icon(Icons.report_problem, size: 24, color: Colors.red),
                      label: Text(
                        "Denunciar",
                          style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          ),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 255, 255, 255)),
                        shadowColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 77, 77, 77)),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))
                        )
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
      )
    );
  }
}