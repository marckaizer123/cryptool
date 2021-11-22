import 'package:cryptool/app.dart';
import 'package:cryptool/style.dart';
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final String _resultingText;
  final String _key;
  final double _fontSize = 20.0;
  final bool crypted;

  Result(this._key, this._resultingText, this.crypted);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Result',
          style: Theme.of(context).appBarTheme.textTheme.headline1,
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SelectableText.rich(
                TextSpan(
                  text: 'Key : ',
                  style: StyleMaker.bodyTextStyle(
                    fontSize: _fontSize,
                    fontWeight: FontWeight.bold,
                  ),
                  children: <InlineSpan>[
                    TextSpan(
                      text: '$_key',
                      style: StyleMaker.bodyTextStyle(fontSize: _fontSize),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              SelectableText.rich(
                TextSpan(
                  text: crypted ? 'Cipher Text : ' : 'Plain Text : ',
                  style: StyleMaker.bodyTextStyle(
                    fontSize: _fontSize,
                    fontWeight: FontWeight.bold,
                  ),
                  children: <InlineSpan>[
                    TextSpan(
                      text: '$_resultingText',
                      style: StyleMaker.bodyTextStyle(fontSize: _fontSize),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Container(
                padding: EdgeInsets.all(5.0),
                decoration: BoxDecoration(color: Colors.black45),
                child: FlatButton(
                  onPressed: () => Navigator.pushNamed(context, HomeRoute),
                  child: Text(
                    'Main Menu',
                    style: StyleMaker.buttonTextStyle(
                      fontColor: Colors.white,
                      fontSize: 30.0,
                    ),
                  ),
                ),
              ),
              //For Debug and Testing
              SizedBox(
                height: 30.0,
              ),

              crypted
                  ? Container(
                      padding: EdgeInsets.all(5.0),
                      decoration: BoxDecoration(color: Colors.black45),
                      child: FlatButton(
                        onPressed: () => Navigator.pushNamed(
                            context, DecryptRoute,
                            arguments: {
                              'key_': _key,
                              'cipherText': _resultingText,
                            }),
                        child: Text(
                          'Test',
                          style: StyleMaker.buttonTextStyle(
                            fontColor: Colors.white,
                            fontSize: 30.0,
                          ),
                        ),
                      ),
                    )
                  : SizedBox(
                      height: 0,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
