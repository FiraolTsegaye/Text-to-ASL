import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class FilePickerPage extends StatefulWidget {
  const FilePickerPage({Key? key}) : super(key: key);

  @override
  _FilePickerPageState createState() => _FilePickerPageState();
}

class _FilePickerPageState extends State<FilePickerPage> {
  FilePickerResult? result;
  String? _fileName;
  PlatformFile? pickedFile;
  bool isLoading = false;
  File? fileToDisplay;
  String? FileContent;
  void pickFile(String? content) async {
    try {
      setState(() {
        isLoading = true;
      });

      result = await FilePicker.platform.pickFiles(
        type: FileType.any,
        allowMultiple: false,
      );

      if (result != null) {
        if (result!.files.isNotEmpty) {
          pickedFile = result!.files.first;
          _fileName = pickedFile!.name;
          fileToDisplay = File(pickedFile!.path!);

          print('File name: $_fileName');

          FileContent = await fileToDisplay!.readAsString();
          setState(() {
            content = FileContent.toString();
          });
          print(content);
        }
      }

      setState(() {
        isLoading = false;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: isLoading
                ? CircularProgressIndicator()
                : TextButton(
                    onPressed: () {
                      pickFile(FileContent);
                    },
                    child: Text('Pick File'),
                  ),
          ),
          if (pickedFile != null)
            SizedBox(
              height: 300,
              width: 400,
              //child: Image.file(fileToDisplay!),
              child: Text(FileContent!),
            ),
        ],
      ),
    );
  }
}
