import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nous/components/widgets.dart';
import 'package:nous/ui/aside/artcles_view.dart';

class Articles extends StatefulWidget {
  const Articles({ Key? key }) : super(key: key);

  @override
  _ArticlesState createState() => _ArticlesState();
}

class _ArticlesState extends State<Articles> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 242, 244, 244),
        shadowColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: Colors.black, size: 30
        ),
    
        actions: [
          Container(
            padding: EdgeInsets.only(right: 20, top: 3),
              child: const Text(
                "Artigos",
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(255, 77, 77, 77),
                ),
             ),
          )
        ],
      ),
    
    body: Container(
      child: Container(
        color: Color.fromARGB(255, 242, 244, 245),
        alignment: Alignment.topRight,
      
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              padding: EdgeInsets.only(right: 20),
              alignment: Alignment.topRight,
              child: const Text(
                "Dicas e estudos sobre como",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w300
                ),
              ),
            ),
    
            Container(
              padding: EdgeInsets.only(right: 20),
              alignment: Alignment.topRight,
              child: const Text(
                "ser mais produtivo",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w300
                ),
              ),
            ),

            Expanded(
              child: Container(
                margin: EdgeInsets.only(top:10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40)
                  ),
                ),

                child: SingleChildScrollView(
                  child: Container(
                    child: Container(
                      padding: EdgeInsets.only(left: 20, top: 20, right: 20),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(15)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.1),
                                        spreadRadius: 0,
                                        blurRadius: 10,
                                        offset: Offset(0, 2),
                                      )
                                    ]
                                  ),

                                  child: TextButton(
                                     onPressed: (){
                                    
                                     },
                                     child: Padding(
                                      padding: EdgeInsets.only(left: 20, right: 20),
                                       child: Text(
                                       "Explorar",
                                       style: TextStyle(
                                         fontWeight: FontWeight.w700,
                                         fontSize: 18,
                                         color: Color.fromARGB(255, 77, 77, 77),
                                       ),
                                     ),
                                     ),
                                    style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 255, 255, 255)),
                                      shadowColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 77, 77, 77)),
                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                        RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))
                                      )
                                    ),
                                  )
                                ),

                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(15)),
                                  ),

                                  child: TextButton.icon(
                                     onPressed: (){},
                                     label: Text(
                                       "Favoritos",
                                       style: TextStyle(
                                         fontWeight: FontWeight.w700,
                                         fontSize: 18,
                                         color: Color.fromARGB(255, 163, 163, 163),
                                       ),
                                     ),
                                    icon: Icon(Icons.favorite, color: Color.fromARGB(255, 255, 88, 119)),
                                    ),
                                  ),
                              ],
                          ),

                          GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => ArticlesView()));
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Container(
                                height: 180, 
                                width: 360,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(Radius.circular(25)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.1),
                                        spreadRadius: 0,
                                        blurRadius: 10,
                                        offset: Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 180,
                                      width: 90,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                            "assets/icons/teste.jpeg"
                                          ),
                                          fit: BoxFit.fill,
                                        ),
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(25),
                                          bottomLeft: Radius.circular(25),
                                        ),
                                      ),
                                    ),
                          
                          
                                    Container(
                                      height: 180,
                                      width: 260,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [

                                              Container(
                                                margin: EdgeInsets.only(top: 20, left: 30),
                                                child: Text(
                                                  "Leitura e TDAH",
                                                  style: TextStyle(
                                                    fontSize: 24,
                                                    fontWeight: FontWeight.w700,
                                                  )
                                                ),
                                              ),

                                              IconButton(
                                                onPressed: () {},
                                                icon: Icon(Icons.favorite_border))
                                            ],
                                          ),
                                                            
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsets.only(left: 10, right:10),
                                              child: Container(
                                                alignment: Alignment.center,
                                                height: 80,
                                                width: 270,
                                                child: Text(
                                                  "Comprometida pelo TDAH, as pessoas que possuem TDAH e tentam ler geralmente não conseguem por conta...",
                                                  textAlign: TextAlign.justify,
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                    
                                          Container(
                                            alignment: Alignment.center,
                                            height: 30,
                                            width: 260,
                                            decoration: BoxDecoration(
                                              color: Color.fromARGB(255, 255, 156, 174),
                                              borderRadius: BorderRadius.only(bottomRight: Radius.circular(25))
                                            ),

                                            child: Text(
                                              "Autor: Raphael Costa & Lucas Castro",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          )
                                        ]
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )

                        ],
                      ),
                    ),
                  ),
                ),
              )
            )
          ],
        ),
      ),
    ),

       drawer:Drawer(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            DrawerHeader(
              child: Center(
                child: DrawerHeader(
                  decoration: BoxDecoration(
                    border: Border( 
                      bottom: BorderSide(
                      color: Colors.white
                      )
                    )
                  ),
                  child: Image(
                    image: AssetImage('assets/icons/app_icon200x200.png')
                  )
                )
              )
            ),
    
            ListTile(
              leading: Icon(Icons.dashboard),
              enabled: true,
              title: Text('Dashboard'),
              onTap: () => Navigator.popAndPushNamed(context, "/dashboard")
            ),
    
            ListTile(
              leading: Icon(Icons.book),
              title: Text('Artigos'),
              onTap: () => Navigator.pushNamed(context, "/articles"),
            ),
    
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Configurações'),
              onTap: () => Navigator.popAndPushNamed(context, "/configurations")
            ),

             Expanded(
              child: Container(
                alignment: Alignment.bottomLeft,
                padding: EdgeInsets.only(bottom: 20),
                  child: TextButton(
                    onPressed: (){}, 
                    child: Text(
                      "Sair",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.red,
                      )
                    )
                  ),
              )
            )
          ],
        )
      ),
    
    );
  }
}