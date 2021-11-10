import 'package:flutter/material.dart';
import 'package:nous/ui/dashboard/dashboard_home_page.dart';
import 'package:nous/ui/dashboard/schedule_page.dart';
import 'package:nous/ui/dashboard/todo_page.dart';

class Dashboard extends StatefulWidget {
  const Dashboard();

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 242, 244, 244),
        shadowColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black, size: 30),
      ),

      body: Container(

        decoration: BoxDecoration(
          color: Color.fromARGB(255, 242, 244, 244)
        ),
        child: PageView(
          children: [
            DashboardHomePage(),

            SchedulePage(),

            TodoPage()
          ],
        )
      ),

      drawer: Drawer(
        child: ListView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            DrawerHeader(
              child: Center(
                child: DrawerHeader(
                  decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 0.5, color: Color.fromARGB(255, 255, 156, 174)))),
                  child: Image(
                    image: AssetImage('assets/icons/app_icon200x200.png'))
                    ),        
                  )
              ),
              ListTile(
                leading: Icon(Icons.dashboard, color: Color.fromARGB(255, 76, 76, 76)),
                enabled: true,
                title: Text('Dashboard', style: TextStyle(color: Color.fromARGB(255, 76, 76, 76)),),
              ),
              ListTile(
                leading: Icon(Icons.book, color: Color.fromARGB(255, 76, 76, 76)),
                title: Text('Artigos',
                style: TextStyle(color: Color.fromARGB(255, 76, 76, 76)),),
              ),
              ListTile(
                leading: Icon(Icons.insert_chart_outlined, color: Color.fromARGB(255, 76, 76, 76),),
                title: Text(
                  'Produtividade',
                  style: TextStyle(color: Color.fromARGB(255, 76, 76, 76),)),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.525,
                alignment: FractionalOffset.bottomCenter,
                child: ListTile(
                  leading: Icon(Icons.settings, color: Color.fromARGB(255, 76, 76, 76),),
                  title: Text('Configurações', style: TextStyle(color: Color.fromARGB(255, 76, 76, 76)))
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