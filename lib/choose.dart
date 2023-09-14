import 'package:flutter/material.dart';
import 'package:first/Start.dart';
import 'package:first/start2.dart';
import 'package:first/HomePage.dart';

class Eth_choose extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Choose Sign Language',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(60.0), // Set a fixed height for the app bar
        child: AppBar(
          backgroundColor: Colors.black,
          leading: Container(
            width: 40.0,
            child: IconButton(
              icon: Image.asset(
                'images/Vectorback.png',
                width: 10,
              ),
              onPressed: () {
                // Navigator.pop(context);  Navigates to the previous page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
            ),
          ),
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(248, 18, 202, 156),
                fixedSize: Size(70, 50),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Eth_SecondStart()),
                );
              },
              child: Text('EthSL'),
            ),
            SizedBox(
              height: 16,
              width: 30,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(248, 18, 202, 156),
                fixedSize: Size(70, 50),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecStart()),
                );
              },
              child: Text('ASL'),
            ),
          ],
        ),
      ),
    );
  }
}
