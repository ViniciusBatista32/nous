import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nous/components/widgets.dart';

class ConfigPage extends StatefulWidget {
  const ConfigPage({ Key? key }) : super(key: key);

  @override
  _ConfigPageState createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {

  final shape = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(9)
  );

  bool sim = false;

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
                "Configurações",
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
                "Aqui você pode alterar suas",
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
                "configurações de conta",
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Olá",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.black
                            ),
                          ),
                  
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Text(
                                "Roberto Siqueira",
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                        
                              IconButton(
                                onPressed: (){},
                                icon: Icon(Icons.edit),
                                  iconSize: 24,
                                  color: Color.fromARGB(255, 255, 156, 174)
                              ),
                            ],
                          ),
                  
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(top: 20),
                                width: MediaQuery.of(context).size.width * 0.8,
                                height: 3,
                                color: Color.fromARGB(255, 255, 156, 174).withOpacity(0.26),
                              )
                            ]
                          ),
              
                          Container(
                            padding: const EdgeInsets.only(top: 30),
                              child: Theme(
                                data: ThemeData().copyWith(dividerColor: Colors.transparent),
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(12),
                                        topLeft: Radius.circular(12),
                                        bottomRight: Radius.circular(12),
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black12,
                                          spreadRadius: 0,
                                          blurRadius: 4,
                                          offset: Offset(1,1)
                                        )
                                      ]
                                    ),

                                    child: ExpansionTile(
                                      iconColor: Colors.black,
              
                                      textColor: Colors.black,
              
                                      title: Text(
                                        "Minha conta",
                                        style: TextStyle(
                                            fontWeight:FontWeight.w400,
                                            fontSize: 18
                                            ),
                                          ),
                                      leading: const Icon(Icons.person, color: Color.fromARGB(255, 255, 156, 174)),
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.only(top: 10, right: 10, bottom: 10),
                                            decoration: const BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.only(bottomRight: Radius.circular(12)),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black12,
                                                  spreadRadius: 0,
                                                  blurRadius: 4,
                                                  offset: Offset(1, 1),
                                                )
                                              ]
                                            ),
              
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                  children: [
                                                    const Text(
                                                      "Email cadastrado:",
                                                      style: TextStyle(
                                                        fontWeight: FontWeight.w400,
                                                        fontSize: 12
                                                      ),
                                                    ),
              
                                                    Text(
                                                      "ricardosiqueira@gmail.com",
                                                      style: TextStyle(
                                                        fontWeight: FontWeight.w400,
                                                        fontSize: 14,
                                                      ),
                                                    )
                                                  ]
                                                ),
              
                                                Container(
                                                  padding: EdgeInsets.only(top: 20),
                                                  margin: EdgeInsets.only(bottom: 20),
              
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                    children: [
                                                      Text(
                                                        "Alterar senha",
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          fontWeight: FontWeight.w400,
                                                        ),
                                                      ),
              
                                                      Container(
                                                        height: 3,
                                                        width: MediaQuery.of(context).size.width * 0.529,
                                                        color: Color.fromARGB(255, 255, 156, 174).withOpacity(0.26),
                                                      )
                                                    ],
                                                  ),
                                                ),
              
                                                Material(
                                                  color: Colors.transparent,
                                                  shape: shape,
                                                  elevation: 3,
              
                                                  child: Container(
                                                    decoration: ShapeDecoration(
                                                      shape: shape,
                                                      gradient: LinearGradient(
                                                        begin: Alignment(-1, -1),
                                                        end: Alignment(6, 6),
                                                        colors: [
                                                          Color.fromARGB(255, 255, 156, 174),
                                                          Colors.white,
                                                        ]
                                                      ),
                                                    ),
              
                                                    child: ElevatedButton(
                                                      onPressed: (){},
                                                      
                                                      style: ElevatedButton.styleFrom(
                                                        padding: EdgeInsets.only(bottom:5,top: 5,left: 30, right:30),
              
                                                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                        primary: Colors.transparent,
                                                        shadowColor: Colors.transparent,
                                                      ),
              
                                                      child: Text(
                                                        "Redefinir senha",
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          color: Colors.white,
                                                        )
                                                      )
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ]
                                      ),
                                  ),
                              ),
                          ),

                            Container(
                              padding: EdgeInsets.only(top: 30),
              
                              child: Theme(
                                data: ThemeData().copyWith(dividerColor: Colors.transparent),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(12),
                                        topLeft: Radius.circular(12),
                                        bottomRight: Radius.circular(12),
                                      ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black12,
                                            spreadRadius: 0,
                                            blurRadius: 4,
                                            offset: Offset(1,1)
                                          )
                                        ]
                                      ),
                                    child: ExpansionTile(
                                      iconColor: Colors.black,
              
                                      textColor: Colors.black,
              
                                      title: Text(
                                        "Preferências",
                                        style: TextStyle(
                                            fontWeight:FontWeight.w400,
                                            fontSize: 18
                                            ),
                                          ),
                                      leading: Icon(Icons.settings, color: Color.fromARGB(255, 255, 156, 174)),
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(top: 10, right: 10, bottom: 10),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.only(bottomRight: Radius.circular(12)),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black12,
                                                  spreadRadius: 0,
                                                  blurRadius: 4,
                                                  offset: Offset(1, 1),
                                                )
                                              ]
                                            ),
              
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [

                                                    Container(
                                                      margin: EdgeInsets.only(left: 20),
                                                      child: Text(
                                                      "Ativar notificações",
                                                      style: TextStyle(
                                                        fontWeight: FontWeight.w400,
                                                        fontSize: 16
                                                      ),
                                                    ),
                                                  ),
                                                   
              
                                                  Container(
                                                    padding: EdgeInsets.only(right: 8),
                                                    child: Switch(
                                                      value: sim,
                                                      onChanged: (value){
                                                        setState(() {
                                                          sim = value;
                                                        });
                                                      },
                                                        activeTrackColor: Color.fromARGB(255, 255, 156, 174),
                                                        activeColor: Colors.white,
                                                        inactiveThumbColor: Colors.white,
                                                      ),
                                                    )
                                                  ]
                                                ),
              
                                                Container(
                                                  padding: EdgeInsets.only(top: 10),
                                                  margin: EdgeInsets.only(bottom: 0),
              
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [

                                                      Container(
                                                        margin: EdgeInsets.only(left: 20),
                                                        child: Text(
                                                        "To do list",
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight: FontWeight.w400,
                                                        ),
                                                      ),
                                                      ),

                                                        Container(
                                                        padding: EdgeInsets.only(right: 8),
                                                          child: Switch(
                                                            value: sim,
                                                            onChanged: (value){
                                                          setState(() {
                                                            sim = value;
                                                          });
                                                        },
                                                          activeTrackColor: Color.fromARGB(255, 255, 156, 174),
                                                          activeColor: Colors.white,
                                                          inactiveThumbColor: Colors.white,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),

                                                                                                Container(
                                                  padding: EdgeInsets.only(top: 10),
                                                  margin: EdgeInsets.only(bottom: 20),
              
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [

                                                      Container(
                                                        margin: EdgeInsets.only(left: 20),
                                                        child: Text(
                                                        "Overlay",
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight: FontWeight.w400,
                                                        ),
                                                      ),
                                                      ),

                                                        Container(
                                                        padding: EdgeInsets.only(right: 8),
                                                          child: Switch(
                                                            value: sim,
                                                            onChanged: (value){
                                                          setState(() {
                                                            sim = value;
                                                          });
                                                        },
                                                          activeTrackColor: Color.fromARGB(255, 255, 156, 174),
                                                          activeColor: Colors.white,
                                                          inactiveThumbColor: Colors.white,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                  ),
                              ),
                            ),
                          ]
                        ),
                      ),
                    ),
                  )   
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 10, bottom: 20),
                color: Colors.white,
                child: TextButton(
                  onPressed: (){}, 
                child: Text(
                  "Sair",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.red,
                  ),
                ))
              )
            ],
          ),
        )
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