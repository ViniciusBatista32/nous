import 'package:flutter/material.dart';

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
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black, size: 30),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Text(
              "Dashboard",
              style: TextStyle(
                color: Colors.black,
                fontSize: 40,
                fontFamily: "Quicksand",
                fontWeight: FontWeight.w500
              ),
            ),
          )
        ],
      ),

      body: Container(
        child: PageView(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.red
              ),
            ),

            Container(
              decoration: BoxDecoration(
                color: Colors.green
              ),
            ),

            Container(
              decoration: BoxDecoration(
                color: Colors.blue
              ),
            )
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