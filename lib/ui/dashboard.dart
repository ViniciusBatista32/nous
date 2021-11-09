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

      drawer: Drawer(),

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