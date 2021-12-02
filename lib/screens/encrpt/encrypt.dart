import 'package:cryptool/app.dart';
import 'package:cryptool/style.dart';
import 'package:flutter/material.dart';
import 'package:cryptool/crypto/crypto.dart';

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
    //nilipat ko yung code  sa crypto/encrypt.dart

    Map<String, String> plainkey = Crypto.encrypt(text);

    Navigator.pushNamed(context, ResultRoute, arguments: {
      "key": plainkey['key'],
      "text": plainkey['text'],
      "crypted": true,
    });
  }
}
