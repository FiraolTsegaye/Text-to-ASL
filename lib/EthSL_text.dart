import 'package:flutter/material.dart';

class Text_ASL_amh extends StatefulWidget {
  @override
  _Text_ASLState createState() => _Text_ASLState();
}

class _Text_ASLState extends State<Text_ASL_amh> {
  final TextEditingController _textEditingController = TextEditingController();
  List<String> words = [];
  List<String> missingWords = [];
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
      List<String> missing = [];
      List<String> existing_words = [];
      for (String word in inputWords) {
        if (!checkIfGifExists(word)) {
          missing.add(word);
          //inputWords.remove(word);
        } else {
          existing_words.add(word);
        }
      }

      setState(() {
        words.addAll(existing_words);
        missingWords = missing;
        displayBoxVisible = true;
        if (missingWords.isNotEmpty) {
          // displayBoxVisible = false;
          _showErrorDialog(context);
        }
      });
    }
  }

  bool checkIfGifExists(String word) {
    return gifExistsInDatabase(word);
  }

  bool gifExistsInDatabase(String word) {
    List<String> availableWords = [
      'መስማትየተሳናቸው',
      'ሴትልጅ',
      'ቀን',
      'ታህሳስ',
      'አደገኛ',
      'ዳንስ',
      'ጉዳት'
    ];
    return availableWords.contains(word);
  }

  void _showErrorDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(
            'The following words are not included in our dictionary:\n${missingWords.join(", ")}',
          ),
          actions: <TextButton>[
            TextButton(
              child: Text('Clear'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
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
                'EthSL: text input',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
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
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                if (displayBoxVisible)
                  Column(
                    children: [
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 10.0,
                        ),
                        itemCount: words.length,
                        itemBuilder: (context, index) {
                          String word = words[index];
                          return Image.asset(
                            'EthSL/$word.gif',
                            width: 200.0,
                            height: 200.0,
                          );
                        },
                      ),
                      const SizedBox(height: 16.0),
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
                      // if (missingWords.isNotEmpty)
                      // ElevatedButton(
                      //     onPressed: () => _showErrorDialog(context),
                      //     child: Text(
                      //       'view Error',
                      //       style:
                      //           TextStyle(color: Colors.white, fontSize: 13),
                      //     ))
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
                        hintText: 'Enter Amharic text',
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
