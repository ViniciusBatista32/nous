import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nous/components/widgets.dart';

class ConfigPage extends StatefulWidget {
  const ConfigPage({ Key? key }) : super(key: key);

  @override
  _ConfigPageState createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                    "Configurações",
                      style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 77, 77, 77),
                    ),
                  ),
              ],
            ),
          )
        ],
      ),

      body: Container(
        color: Color.fromARGB(255, 242, 244, 245),

        alignment: Alignment.topRight,
        
        child: Column(
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
                margin: EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                     topRight: Radius.circular(20)
  ),
                  color: Colors.white,
),

                child: Container(
                  padding: EdgeInsets.only(left: 20, top: 20),
                  child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
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
                      Text(
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
                              margin: EdgeInsets.only(top: 20),
                              width: MediaQuery.of(context).size.width * 0.8,
                              height: 3,
                              color: Color.fromARGB(255, 255, 156, 174).withOpacity(0.26),
                            )
                          ]
                        ),

                        WidgetComponents().ExpandedOption("Minha conta")
                  ]
                ),
              ),
            ),
          )        
        ],
      ),
    ),

      drawer:Drawer(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            DrawerHeader(
              child: Center(
                child: DrawerHeader(
                  decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 0.5, color: Color.fromARGB(255, 255, 156, 174)))),
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
              onTap: () => Navigator.pushNamed(context, "/dashboard")
            ),

            ListTile(
              leading: Icon(Icons.book),
              title: Text('Artigos'),
              onTap: () => Navigator.pushNamed(context, "/articles"),
            ),

            ListTile(
              leading: Icon(Icons.insert_chart_outlined),
              title: Text('Produtividade'),
              onTap: () => Navigator.pushNamed(context, "/report"),
            ),

            Expanded(
              child: Align(
                alignment: Alignment.bottomLeft,
                child: ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Configurações'),
                  onTap: () => Navigator.pushNamed(context, "/configurations")
                ),
              )
            )
          ],
        )
      ),
    );
  }
}