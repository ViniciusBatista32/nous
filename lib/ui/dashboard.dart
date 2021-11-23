import 'package:flutter/material.dart';
import 'package:nous/components/widgets.dart';
import 'package:nous/config.dart';
import 'package:nous/functions/in_app_data.dart';
import 'package:nous/ui/dashboard/dashboard_home_page.dart';
import 'package:nous/ui/dashboard/schedule_page.dart';
import 'package:nous/ui/dashboard/todo_page.dart';

var globalYear = DateTime.now().year;
var globalMonth = DateTime.now().month;
var globalDay = DateTime.now().day;
var globalWeekday = DateTime.now().weekday;

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
  
  int actualPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,

      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 242, 244, 244),
        shadowColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: Colors.black, size: 30
        ),

        actions: [
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.only(right: 20),

            child: Text(
              global_user_data["name"],
              style: TextStyle(
                color: Colors.black,
                fontSize: 17
              ),
            ),
          )
        ],
      ),

      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 242, 244, 244)
            ),

            child: PageView(
              onPageChanged: (page){
                setState(() {
                  actualPage = page;

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

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pushNamed(
            context,
            "/createTask",
            arguments: CreateTaskArguments(actualPage, globalWeekday)
          ).then((value){
            setState(() {});
          });
        },
        
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