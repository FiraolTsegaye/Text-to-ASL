import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:flutter/services.dart' show rootBundle;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Voice Input',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: VoiceInput(),
    );
  }
}

class VoiceInput extends StatefulWidget {
  @override
  _VoiceInputState createState() => _VoiceInputState();
}

class _VoiceInputState extends State<VoiceInput> {
  late stt.SpeechToText _speechToText;
  bool _isListening = false;
  String _transcription = '';

  @override
  void initState() {
    super.initState();
    _initializeSpeechToText();
  }

  Future<void> _initializeSpeechToText() async {
    _speechToText = stt.SpeechToText();
    await _speechToText.initialize();
    if (!_speechToText.isAvailable) {
      print('Speech recognition is not available');
    }
    setState(() {});
  }

  void _startListening() {
    _speechToText.listen(
      onResult: (result) {
        setState(() {
          _transcription = result.recognizedWords.toLowerCase();
        });
      },
    );
    setState(() {
      _isListening = true;
    });
  }

  void _stopListening() {
    _speechToText.stop();
    setState(() {
      _isListening = false;
    });
  }

  Future<Widget> _loadImage(String imagePath) async {
    final data = await rootBundle.load(imagePath);
    final bytes = data.buffer.asUint8List();
    return Image.memory(
      bytes,
      width: 200.0,
      height: 200.0,
      gaplessPlayback: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_speechToText == null) {
      return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    List<String> words = _transcription.split(' ');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Image.asset(
            'images/Vectorback.png',
            width: 10,
          ),
          onPressed: () {
            Navigator.pop(context); // Navigates to the previous page
          },
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
                'ASL: Voice Input',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: _isListening ? _stopListening : _startListening,
                child: Icon(
                  _isListening ? Icons.mic : Icons.mic_none,
                  size: 48.0,
                  color: _isListening ? Colors.red : Colors.blue,
                ),
              ),
              Container(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  _isListening ? 'Listening...' : 'Not Listening',
                  style: TextStyle(fontSize: 18.0, color: Colors.white),
                ),
              ),
              Container(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  _transcription,
                  style: TextStyle(fontSize: 18.0, color: Colors.white),
                ),
              ),
              if (_transcription.isNotEmpty)
                Column(
                  children: [
                    for (String word in words)
                      FutureBuilder<Widget>(
                        future: _loadImage('images/$word.gif'),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return CircularProgressIndicator();
                          }
                          if (snapshot.hasError) {
                            return Text('Error loading image');
                          }
                          return snapshot.data ?? SizedBox.shrink();
                        },
                      ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
