import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';

class AudioPage extends StatefulWidget {
  const AudioPage({Key? key}) : super(key: key);

  @override
  State<AudioPage> createState() => _AudioPageState();
}

class _AudioPageState extends State<AudioPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Audio Picker'),
      ),
      body: Container(
        constraints: const BoxConstraints(maxWidth: 400),
        padding: const EdgeInsets.all(32),
        alignment: Alignment.center,
        child: ElevatedButton(
          onPressed: () async {
            final result = await FilePicker.platform.pickFiles();
            if (result == null) return;

            final file = result.files.single;
            // openFile(file);

            print('Name: ${file.name}');

            final newFile = await saveFilePermanently(file);

            print('From path: ${file.path}');
            print('To path: ${newFile.path}');
          },
          child: const Text('Pick audio file'),
        ),
      ),
    );
  }

  Future<File> saveFilePermanently(PlatformFile file) async {
    final appStorage = await getApplicationDocumentsDirectory();
    final newFile = File('${appStorage.path}/${file.name}');

    return File(file.path!).copy(newFile.path);
  }

  void openFile(PlatformFile file) {
    OpenFile.open(file.path!);
  }
}

void main() {
  runApp(const MaterialApp(
    home: AudioPage(),
  ));
}