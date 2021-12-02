import 'dart:math';

const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
Random _rnd = Random.secure();

Map<String, String> encrypt_(String text) {
  String key = getRandomString(16);
  List<String> subTable = buildSubTable();
  print("Plaintext input: $text");
  print("Key: $key");
  text = text.replaceAll(new RegExp(r'[^\w\s]+'), ''); //remove special symbols
  text = text.replaceAll(" ", ""); //remove spaces
  List<String> textArray = splitStringBySixteen(text).toList();
  for (int i = 0; i < textArray.length; i++) {
    if (textArray[i].length < 16) {
      // if string block has less than 16 characters, pad the string with 'z'.
      for (int j = textArray[i].length; j < 16; j++) {
        textArray[i] = textArray[i] + "z";
      }
    }
    text = textArray[i];
    for (int k = 0; k < 4; k++) {
      print("Before substitution: $text");
      text = substituteCharacters(text, key);
      print("After substitution: $text");
      text = transposeCharacters(text);
      print("After character transposition: $text");
      text = transposeBlocks(text);
      print("After block transposition: $text");
      text = substituteCharacters2(text, key, subTable);
      print("After second substitution: $text");
    }
    textArray[i] = text;
  }
  text = textArray.join();
  print("Ciphertext output: $text");

  return {
    'text': text,
    'key': key,
  };
}

String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
    length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
String replaceCharAt(String oldString, int index, String newChar) {
  return oldString.substring(0, index) +
      newChar +
      oldString.substring(index + 1);
}

Iterable<String> splitStringByFour(String text) {
  RegExp rx = new RegExp(r"\w{1,4}");
  return rx.allMatches(text).map((m) => m.group(0));
}

Iterable<String> splitStringBySixteen(String text) {
  RegExp rx = new RegExp(r"\w{1,16}");
  return rx.allMatches(text).map((m) => m.group(0));
}

String shiftCharToRight(String text, int shiftBy) {
  for (int i = 0;
      i < shiftBy;
      i++) //Repeats the procedure until the shift value is reached.
  {
    text = text.substring(3) +
        text.substring(0,
            3); //places the last character at the first position and shifts everything to the right by 1 place.
  }
  return text;
}

String shiftCharToLeft(String text, int shiftBy) {
  for (int i = 0;
      i < shiftBy;
      i++) //Repeats the procedure until the shift value is reached.
  {
    text = text.substring(1) +
        text.substring(0,
            1); //places the first character at the last position and shifts everything to the left by 1 place.
  }
  return text;
}

String substituteCharacters(String text, String key) {
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
  List<String> stringArray = splitStringByFour(text).toList();

  stringArray[1] = shiftCharToRight(stringArray[1], 3);
  stringArray[2] = shiftCharToRight(stringArray[2], 2);
  stringArray[3] = shiftCharToRight(stringArray[3], 1);

  return stringArray.join();
}

String transposeBlocks(String text) {
  List<String> stringArray = splitStringByFour(text).toList();
  String temp = "";
  temp = stringArray[0];
  stringArray[0] = stringArray[1];
  stringArray[1] = stringArray[2];
  stringArray[2] = stringArray[3];
  stringArray[3] = temp;
  return stringArray.join();
}

List<String> buildSubTable() {
  String subTableLine = _chars;
  List<String> subTable = [];

  for (int i = 0; i < subTableLine.length; i++) {
    subTable.add(subTableLine);
    subTableLine = shiftCharToLeft(subTableLine, 1);
  }
  //subTable.forEach((string) { print(string);});
  return subTable;
}

String substituteCharacters2(String text, String key, List<String> subTable) {
  int index1 = 0;
  int index2 = 0;
  String newChar = "";
  for (int i = 0; i < 16; i++) {
    index1 = _chars.indexOf(text[i]);
    index2 = _chars.indexOf(key[i]);
    newChar = subTable[index1][index2];

    text = replaceCharAt(text, i, newChar);
  }
  return text;
}
