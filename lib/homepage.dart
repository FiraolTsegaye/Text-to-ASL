import 'package:flutter/material.dart';
import 'package:first/choose.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.black,
          appBar: PreferredSize(
            preferredSize:
                Size.fromHeight(60.0), // Set a fixed height for the app bar
            child: AppBar(
              backgroundColor: Colors.black,
              title: Container(
                width: 200.0,
                child: Row(
                  children: [
                    Image.asset(
                      'images/Icon1.png',
                      width: 30,
                      height: 30,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Commusign',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Commusign',
                  style: TextStyle(fontSize: 45, color: Colors.white),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(248, 18, 202, 156),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Eth_choose()),
                    );
                  },
                  child: Text(
                    'Explore',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
