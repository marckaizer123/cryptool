const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';

Map<String, String> decrypt_(String text, String key) {
  List<String> subTable = buildSubTable();
  List<String> textArray = splitStringBySixteen(text).toList();
  print("Ciphertext input: $text");
  print("Key: $key");
  for (int i = 0; i < textArray.length; i++) {
    text = textArray[i];

    for (int j = 0; j < 4; j++) {
      print("Before reverse second substitution:  $text");
      text = reverseSubstituteCharacters2(text, key, subTable);
      print("After reverse second substitution:  $text");
      text = reverseTransposeBlocks(text);
      print("After reverse block transposition:  $text");
      text = reverseTransposeCharacters(text);
      print("After reverse character transposition  $text");
      text = reverseSubstituteCharacters(text, key);
      print("After reverse substitution:  $text");
    }
    textArray[i] = text;
  }
  text = textArray.join();
  print("Plaintext output: $text");

  return {
    'text': text,
    'key': key,
  };
}

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

String reverseSubstituteCharacters(String text, String key) {
  int index = 0;
  for (int i = 0; i < 16; i++) {
    index = _chars.indexOf(text[i]) - _chars.indexOf(key[i]);
    if (index < 0) {
      index = index + _chars.length;
    }
    text = replaceCharAt(text, i, _chars[index]);
  }
  return text;
}

String reverseTransposeCharacters(String text) {
  List textArray = splitStringByFour(text).toList();

  textArray[1] = shiftCharToLeft(textArray[1], 3);
  textArray[2] = shiftCharToLeft(textArray[2], 2);
  textArray[3] = shiftCharToLeft(textArray[3], 1);

  text = textArray.join();
  return text;
}

String reverseTransposeBlocks(String text) {
  List<String> stringArray = splitStringByFour(text).toList();
  String temp = "";
  temp = stringArray[3];
  stringArray[3] = stringArray[2];
  stringArray[2] = stringArray[1];
  stringArray[1] = stringArray[0];
  stringArray[0] = temp;
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

String reverseSubstituteCharacters2(
    String text, String key, List<String> subTable) {
  int index = 0;
  int index2 = 0;
  String newChar = "";
  for (int i = 0; i < 16; i++) {
    index = _chars.indexOf(key[i]); //search for index of key char

    index2 = subTable[index].indexOf(text[i]);
    newChar = _chars[index2];
    text = replaceCharAt(text, i, newChar);
  }
  return text;
}
