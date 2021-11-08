import 'package:cryptool/app.dart';
import 'package:cryptool/style.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:convert';

class EncryptionScreen extends StatelessWidget {
  final _plainTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Encrypt',
          style: Theme.of(context).appBarTheme.textTheme.headline1,
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 50.0,
              ),
              //Plain Text box
              Container(
                margin: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
                padding: EdgeInsets.only(left: 5.0),
                decoration: BoxDecoration(
                  color: Colors.black12,
                ),
                child: TextField(
                  controller: _plainTextController,
                  minLines: 5,
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: 'Plain Text....',
                    border: InputBorder.none,
                  ),
                ),
              ),

              //Encrypt Button
              Container(
                padding: EdgeInsets.all(5.0),
                decoration: BoxDecoration(color: Colors.black45),
                child: FlatButton(
                  onPressed: () => _onEncryptTap(
                    context,
                    _plainTextController.text,
                  ),
                  child: Text(
                    'Encrypt',
                    style: StyleMaker.buttonTextStyle(
                      fontColor: Colors.white,
                      fontSize: 30.0,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _onEncryptTap(BuildContext context, String text) {
    String key = getRandomString(16);

    text = text.replaceAll(new RegExp(r'[^\w\s]+'),''); //remove special symbols
    text = text.replaceAll(" ", ""); //remove spaces
    List<String> textArray = splitStringBySixteen(text).toList();
    print(textArray);

    for(int i = 0; i<textArray.length; i++){
      if (textArray[i].length<16) { // if string block has less than 16 characters, pad the string with 'z'.
        for (int j = textArray[i].length; j < 16; j++) {
          textArray[i] = textArray[i] + "z";
        }
      }

      text = textArray[i];
      for(int k = 0; k<4; k++){
        print("Before keyProcess  $text");
        text = keyProcess(text, key);
        print("After keyProcess  $text");
        text = transposeCharacters(text);
        print("After transpose  $text");
        }
      textArray[i] = text;
      }

    text = textArray.join();
    Navigator.pushNamed(context, ResultRoute,
        arguments: {"key": key, "resultingText": text, "isCipher": false});
  }
}

const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
Random _rnd = Random.secure();

String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
    length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

String replaceCharAt(String oldString, int index, String newChar) {
  return oldString.substring(0, index) + newChar + oldString.substring(index + 1);
}

Iterable<String> splitStringByFour(String text){
  RegExp rx = new RegExp(r"\w{1,4}");
  return rx.allMatches(text).map((m) => m.group(0));
}

Iterable<String> splitStringBySixteen(String text){
  RegExp rx = new RegExp(r"\w{1,16}");
  return rx.allMatches(text).map((m) => m.group(0));
}

String shiftCharToRight(String textArray, int shiftBy){
  for (int i = 0; i < shiftBy; i++) //Repeats the procedure until the shift value is reached.
      {
    textArray = textArray.substring(3) + textArray.substring(0, 3); //places the last character at the first position and shifts everything to the right by 1 place.
  }

  return textArray;
}



String keyProcess(String text, String key)
{
  int index = 0;
  for(int i = 0; i<16; i++){
    index = _chars.indexOf(text[i]) + _chars.indexOf(key[i]);
    if(index>_chars.length-1){
      index = index - _chars.length;
    }
    text = replaceCharAt(text, i, _chars[index]);
  }
  return text;
}

String transposeCharacters(String text){
  List<String> stringArray = splitStringByFour(text).toList();

  stringArray[1] = shiftCharToRight(stringArray[1], 3);
  stringArray[2] = shiftCharToRight(stringArray[2], 2);
  stringArray[3] = shiftCharToRight(stringArray[3], 1);

  text = stringArray.join();
  return text;
}

String substituteCharacters(String text){
  return text;
}


