import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

void main() {
  runApp(MyApp());
}

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
    _speechToText = stt.SpeechToText();
  }

  void _startListening() {
    _speechToText.listen(
      onResult: (result) {
        setState(() {
          _transcription = result.recognizedWords.toLowerCase();
        });
      },
      listenFor: Duration(minutes: 1),
      pauseFor: Duration(seconds: 5),
      partialResults: true,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Voice Input'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(_isListening ? Icons.mic : Icons.mic_none),
              onPressed: () {
                if (_isListening) {
                  _stopListening();
                } else {
                  _startListening();
                }
              },
            ),
            SizedBox(height: 16),
            Text(
              _isListening ? 'Listening...' : 'Not Listening',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 16),
            Text(
              _transcription,
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
