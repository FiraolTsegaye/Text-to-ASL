import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:first/HomePage.dart';
import 'package:flutter/material.dart';

class introPage extends StatefulWidget {
  const introPage({super.key});

  @override
  State<introPage> createState() => _introPageState();
}

class _introPageState extends State<introPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: AnimatedSplashScreen(
          backgroundColor: Colors.black,
          splash:
              //backgroundColor: Colors.black,
              //text: Text('Commusign')
              Image.asset(
            'images/Group14.png',
          ),
          nextScreen: HomePage(),
          splashTransition: SplashTransition.scaleTransition,
          duration: 3000,
        )
        // Container(
        //   decoration: BoxDecoration(
        //     image: DecorationImage(
        //       image: AssetImage('images/Icon1.png'),
        //       fit: BoxFit.cover,
        //     ),
        //   ),
        // ),
        );
  }
}
