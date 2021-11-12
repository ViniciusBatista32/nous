import 'package:flutter/material.dart';
import 'package:nous/components/widgets.dart';
import 'package:nous/ui/dashboard/dashboard_home_page.dart';
import 'package:nous/ui/dashboard/schedule_page.dart';
import 'package:nous/ui/dashboard/todo_page.dart';

var globalYear = null;
var globalMonth = null;
var globalDay = null;
var globalWeekday = null;

class Dashboard extends StatefulWidget {
  Dashboard();

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  bool firstBallIsActive = true;
  bool secondBallIsActive = false;
  bool thirdBallIsActive = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,

      body: Stack(
        children: [
          Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 20, top: 30, right: 20),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 242, 244, 244)
                ),

                child: Row(
                  children: [

                    GestureDetector(
                      onTap: () => _key.currentState!.openDrawer(),

                      child: Icon(
                        Icons.menu,
                        size: 30,
                      )
                    ),

                    Expanded(
                      child: Container(
                        alignment: Alignment.centerRight,

                        child: Text(
                          "Bem-vindo ao seu",
                          style: TextStyle(
                            fontSize: 16
                          ),
                        ),
                      ),
                    )
                  ]
                )
              ),

              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 242, 244, 244)
                  ),

                  child: PageView(
                    onPageChanged: (page){
                      setState(() {
                        firstBallIsActive = false;
                        secondBallIsActive = false;
                        thirdBallIsActive = false;

                        if(page == 0)
                          firstBallIsActive = true;
                        else if(page == 1)
                          secondBallIsActive = true;
                        else if(page == 2)
                          thirdBallIsActive = true;
                      });
                    },

                    children: [
                      DashboardHomePage(),

                      SchedulePage(),

                      TodoPage()
                    ],
                  )
                ),
              ),
            ],
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    WidgetComponents().NavigationBall(firstBallIsActive),

                    WidgetComponents().NavigationBall(secondBallIsActive),

                    WidgetComponents().NavigationBall(thirdBallIsActive),
                  ],
                )
              )
            ],
          )
        ],
      ),

      drawer: Drawer(
        child: ListView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            const DrawerHeader(
              child: Center(
                child: DrawerHeader(
                  decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 0.5, color: Color.fromARGB(255, 255, 156, 174)))),
                  child: Image(
                    image: AssetImage('assets/icons/app_icon200x200.png')
                  )
                )
              )
            ),

            const ListTile(
              leading: Icon(Icons.dashboard),
              enabled: true,
              title: Text('Dashboard'),
            ),

            const ListTile(
              leading: Icon(Icons.book),
              title: Text('Artigos'),
            ),

            const ListTile(
              leading: Icon(Icons.insert_chart_outlined),
              title: Text('Produtividade'),
            ),

            Container(
              height: MediaQuery.of(context).size.height * 0.525,
              alignment: FractionalOffset.bottomCenter,
              child: const ListTile(
                leading: Icon(Icons.settings),
                title: Text('Configurações')
              )
            )
          ],
        )
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        backgroundColor: const Color.fromARGB(255, 255, 104, 132),

        child: const Text(
          "+",
          style: TextStyle(
            fontSize: 30
          ),
        ),
      ),
    );
  }
}