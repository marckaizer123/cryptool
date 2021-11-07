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
    text = text.replaceAll(new RegExp(r'[^\w\s]+'),''); //remove special symbols
    text = text.replaceAll(" ", ""); //remove spaces

    String key = getRandomString(16);

    if (text.length<16){
      for(int i = text.length; i<16; i++){
        text = text + "z";
      }
    }

    for(int i = 0; i<4; i++){
      text = keyProcess(text, key);
    }

    //loop 16x




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

String keyProcess(String text, String key)
{
  int index = 0;
  for(int i = 0; i<16; i++){
    index = _chars.indexOf(text[i]) + _chars.indexOf(key[i]);

    if(index>_chars.length)
      index = index - _chars.length;
    text = replaceCharAt(text, i, _chars[index]);
  }
  return text;
}

String transposeCharacters(String text){
  return text;
}

String substituteCharacters(String text){
  return text;
}


