import 'dart:math';

const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';

Map<String, String> encrypt_(String plainText) {
  plainText = plainText.replaceAll(
      new RegExp(r'[^\w\s]+'), ''); //remove special symbols
  plainText = plainText.replaceAll(" ", ""); //remove spaces

  String key = getRandomString(16);
  if (plainText.length < 16) {
    for (int i = plainText.length; i < 16; i++) {
      plainText = plainText + "z";
    }
  }

  for (int i = 0; i < 4; i++) {
    // print("Before keyProcess  $plainText");
    plainText = keyProcess(plainText, key);
    // print("After keyProcess  $plainText");
    plainText = transposeCharacters(plainText);
    // print("After transpose  $plainText");
  }
  //loop 16x
  return {
    "text": plainText,
    "key": key,
  };
}

Random _rnd = Random.secure();
String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
    length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

String replaceCharAt(String oldString, int index, String newChar) {
  return oldString.substring(0, index) +
      newChar +
      oldString.substring(index + 1);
}

Iterable<String> splitStringByFour(String text) {
  RegExp rx = new RegExp(r".{1,4}(?=(.{4})+(?!.))|.{1,4}$");
  return rx.allMatches(text).map((m) => m.group(0));
}

String shiftCharToRight(String textArray, int shiftBy) {
  for (int i = 0;
      i < shiftBy;
      i++) //Repeats the procedure until the shift value is reached.
  {
    textArray = textArray.substring(3) +
        textArray.substring(0,
            3); //places the last character at the first position and shifts everything to the right by 1 place.
  }

  return textArray;
}

String keyProcess(String text, String key) {
  int index = 0;
  for (int i = 0; i < 16; i++) {
    index = _chars.indexOf(text[i]) + _chars.indexOf(key[i]);
    if (index > _chars.length - 1) {
      index = index - _chars.length;
    }
    text = replaceCharAt(text, i, _chars[index]);
  }
  return text;
}

String transposeCharacters(String text) {
  List textArray = splitStringByFour(text).toList();

  textArray[1] = shiftCharToRight(textArray[1], 3);
  textArray[2] = shiftCharToRight(textArray[2], 2);
  textArray[3] = shiftCharToRight(textArray[3], 1);

  text = textArray.join();
  return text;
}

String substituteCharacters(String text) {
  return text;
}
