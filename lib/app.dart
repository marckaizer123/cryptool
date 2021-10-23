// app.dart

import 'package:cryptool/screens/encrpt/encrypt.dart';
import 'package:cryptool/screens/home/home.dart';
import 'package:cryptool/screens/result/result.dart';
import 'package:flutter/material.dart';

import 'screens/decrypt/decrypt.dart';
import 'style.dart';

const HomeRoute = '/';
const EncryptRoute = '/encrypt';
const DecryptRoute = '/decrypt';
const ResultRoute = '/result';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: _routes(),
      theme: _theme(),
      debugShowCheckedModeBanner: false,
    );
  }

  RouteFactory _routes() {
    return (settings) {
      final Map<String, dynamic> arguments = settings.arguments;
      Widget screen;
      switch (settings.name) {
        case HomeRoute:
          screen = Home();
          break;
        case EncryptRoute:
          screen = EncryptionScreen();
          break;
        case DecryptRoute:
          screen = DecryptionScreen();
          break;
        case ResultRoute:
          screen = Result(arguments['key'], arguments['resultingText'],
              arguments['isCipher']);
          break;
        default:
          return null;
      }
      return MaterialPageRoute(builder: (BuildContext context) => screen);
    };
  }

  ThemeData _theme() {
    return ThemeData(
        appBarTheme:
            AppBarTheme(textTheme: TextTheme(headline1: AppBarTextStyle)),
        textTheme: TextTheme(
          headline1: TitleTextStyle,
          bodyText1: BodyTextStyle,
          headline2: TitleTextStyle2,
        ));
  }
}
