import 'package:flutter/material.dart';


class Text__SASL extends StatefulWidget {
  @override
  _Text_ASLState createState() => _Text_ASLState();
}

class _Text_ASLState extends State<Text__SASL> {
  final TextEditingController _textEditingController = TextEditingController();
  List<String> words = [];
  bool displayBoxVisible = false;
  bool showClearIcon = false;

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _textEditingController.addListener(_updateClearIconVisibility);
  }

  void _updateClearIconVisibility() {
    setState(() {
      showClearIcon = _textEditingController.text.isNotEmpty;
    });
  }

  void _submitForm() {
    String input = _textEditingController.text.trim().toLowerCase();
    if (input.isNotEmpty) {
      List<String> inputWords = input.split(' ');
      setState(() {
        words.addAll(inputWords);
        displayBoxVisible = true;
      });
    }
  }

  void _clearForm() {
    setState(() {
      words.clear();
      displayBoxVisible = false;
      showClearIcon = false;
    });
    _textEditingController.clear();
  }

  @override
  Widget build(BuildContext context) {
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
                'ASL: text input',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/ASL.jpeg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.matrix([
              0.5,
              0,
              0,
              0,
              0,
              0,
              0.5,
              0,
              0,
              0,
              0,
              0,
              0.5,
              0,
              0,
              0,
              0,
              0,
              1,
              0,
            ]),
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                if (displayBoxVisible)
                  Column(
                    children: [
                      GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 10.0,
                        ),
                        itemCount: words.length,
                        itemBuilder: (context, index) {
                          String word = words[index];
                          return Image.asset(
                            'images/$word.gif',
                            width: 200.0,
                            height: 200.0,
                          );
                        },
                      ),
                      SizedBox(height: 16.0),
                      Container(
                        child: ElevatedButton(
                          onPressed: _clearForm,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(248, 18, 202, 156),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            minimumSize: Size(150.0, 50.0),
                          ),
                          child: Text('Clear display'),
                        ),
                      ),
                    ],
                  ),
                SizedBox(height: 16.0),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.grey.withOpacity(0.7),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(right: 16.0),
                    child: TextField(
                      controller: _textEditingController,
                      maxLines: null,
                      decoration: InputDecoration(
                        hintText: 'Enter text',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(16.0),
                        suffixIcon: showClearIcon
                            ? IconButton(
                                icon: Icon(
                                  Icons.clear,
                                  color: Colors.black,
                                ),
                                onPressed: () {
                                  _textEditingController.clear();
                                },
                              )
                            : _textEditingController.text.isNotEmpty
                                ? Icon(
                                    Icons.clear,
                                    color: Colors.transparent,
                                  )
                                : null,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: _submitForm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(248, 18, 202, 156),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    minimumSize: Size(150.0, 50.0),
                  ),
                  child: Text('Translate'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
