import 'package:flutter/material.dart';
import 'package:first/choose.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: CircleAvatar(
            backgroundImage: AssetImage('images/Icon2.png'),
            radius: 20,
          ),
          title: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              'Commusign',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
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
      ),
    );
  }
}
