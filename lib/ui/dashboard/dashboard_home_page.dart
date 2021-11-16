import 'package:flutter/material.dart';
import 'package:nous/ui/aside/timer.dart';

class DashboardHomePage extends StatefulWidget {
  const DashboardHomePage();

  @override
  _DashboardHomePageState createState() => _DashboardHomePageState();
}

class _DashboardHomePageState extends State<DashboardHomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      alignment: Alignment.topRight,

      child: Container(
        alignment: Alignment.topRight,
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,

        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: const Text(
                "Dashboard",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 40,
                  fontWeight: FontWeight.w500
                ),
              ),
            ),

            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(top: 20),
              child: const Text(
                "Próximas atividades",
                style: TextStyle(
                  color: Color.fromARGB(255, 77, 77, 77),
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),

            Container(
              padding: EdgeInsets.only(top: 25),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                children: [

                  Container(
                    padding: EdgeInsets.zero,
                    child: TextButton(
                      onPressed: () {},

                      child: Text(
                        "Cronograma",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          color: Color.fromARGB(255, 77, 77, 77),   
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

                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.transparent
                    ),
                    
                    child: TextButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))
                        )
                      ),

                      child: Text(
                        "To do",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          color: Color.fromARGB(255, 163, 163, 163),   
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            
            Container(
              padding: EdgeInsets.only(top: 5, right: 15, left: 15),
              margin: EdgeInsets.only(top: 25),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                   topRight: Radius.circular(25)),
                   color: Color.fromARGB(255, 255, 104, 132),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.video_call, color: Colors.white, size: 49,),

                  Column(
                    children: [
                      Text(
                        "Reunião",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                          color: Color.fromARGB(255, 255, 255, 255),
                        )
                      ),

                      Text(
                        "12:30",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: Color.fromARGB(255, 255, 255, 255),
                        )
                      )
                    ],
                  ),

                  Container(
                    alignment: Alignment.topRight,
                    padding: EdgeInsets.zero,
                    margin: EdgeInsets.zero,
                    
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [
                        Align(
                          alignment: Alignment.topRight,

                          child: Text(
                            "Agora",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                          ),
                        ),

                        Container(
                          alignment: Alignment.bottomRight,
                          margin: EdgeInsets.only(top: 20),

                          child: IconButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Timer()),
                              );
                            },
                            icon: Icon(Icons.timer),
                            color: Color.fromARGB(255, 255, 255, 255),
                            iconSize: 24,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),

            Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 15, left: 10, bottom: 20),
                  margin: EdgeInsets.only(top: 15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15),
                  ),
                ),

                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.fitness_center, size: 24, color: Color.fromARGB(255, 77, 77, 77)),
                        
                        Container(
                          margin: EdgeInsets.only(left: 10, bottom: 10),

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Academia",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                  color: Color.fromARGB(255, 77, 77, 77),
                                ),
                              ),

                              Text(
                                "13:00",
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 77, 77, 77),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.book, size: 24, color: Color.fromARGB(255, 77, 77, 77)),
                        
                        Container(
                          margin: EdgeInsets.only(left: 10),

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Ler um livro",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                  color: Color.fromARGB(255, 77, 77, 77),
                                ),
                              ),

                              Text(
                                "15:00",
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 77, 77, 77),
                                ),
                              )
                            ],
                          ),
                        ),                  
                      ],
                    ),
                  ],
                )
              )
              ],
            ),

            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(top: 20),
              child: const Text(
                "Seu relatório",
                style: TextStyle(
                  color: Color.fromARGB(255, 77, 77, 77),
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            
            Container(
              margin: EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20),),
                color: Color.fromARGB(255, 255, 255, 255),
              ),
              height: 190,
            )
          ],
        ),
      )
    );
  }
}