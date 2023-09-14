import 'package:first/FilePicker.dart';
import 'package:first/Text_ASL.dart';
import 'package:first/voice_input.dart';
import 'package:flutter/material.dart';

class SecondStart extends StatelessWidget {
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
                Navigator.pop(context); // Navigates to the previous page
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
    );
  }
}

class SecStart extends StatelessWidget {
  const SecStart({super.key});

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
                Navigator.pop(context); // Navigates to the previous page
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: [
                Container(
                  height: 160,
                  width: 160,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Container(
                        //decoration:
                        // BoxDecoration(borderRadius: BorderRadius.circular(20)),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(248, 18, 202, 156),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Text__SASL()),
                            );
                          },
                          child: const Text(
                            'Input Text',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      )),
                ),
                const SizedBox(width: 20),
                Container(
                    height: 160,
                    width: 160,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Container(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Color.fromARGB(248, 18, 202, 156)),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => VoiceInput()),
                            );
                          },
                          child: Text(
                            'Input Voice',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                    ))
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Container(
                  height: 160,
                  width: 160,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(248, 18, 202, 156)),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FilePickerPage()),
                          );
                        },
                        child: Text(
                          'Upload',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
