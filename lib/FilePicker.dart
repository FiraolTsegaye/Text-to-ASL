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
  List<String>? FileContent;
  void pickFile(List<String>? content) async {
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

          FileContent = await fileToDisplay!
              .readAsString()
              .then((value) => value.split(' '));
          setState(() {
            content = FileContent;
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
      backgroundColor: Colors.black,
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
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount: FileContent!.length,
              itemBuilder: (context, index) {
                String word = FileContent![index].toLowerCase();
                return Image.asset(
                  'images/$word.gif',
                  width: 200.0,
                  height: 200.0,
                );
              },
            ),
          // SizedBox(
          //   height: 300,
          //   width: 400,
          //   //child: Image.file(fileToDisplay!),
          //   child: Text(FileContent![0]),
          // ),
        ],
      ),
    );
  }
}
