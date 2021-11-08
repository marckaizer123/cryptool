Map<String, String> decrypt_(String cipherText, String key) {
  for (int i = 0; i < 4; i++) {
    // print("Before reverse transpose:  $cipherText");
    cipherText = reverseTransposeCharacters(cipherText);
    // print("After reverse transpose  $cipherText");
    cipherText = reverseKeyProcess(cipherText, key);
    // print("After reverse key process $cipherText");
  }

  return {
    'text': cipherText,
    'key': key,
  };
}

const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';

String replaceCharAt(String oldString, int index, String newChar) {
  return oldString.substring(0, index) +
      newChar +
      oldString.substring(index + 1);
}

Iterable<String> splitStringByFour(String text) {
  RegExp rx = new RegExp(r".{1,4}(?=(.{4})+(?!.))|.{1,4}$");
  return rx.allMatches(text).map((m) => m.group(0));
}

String shiftCharToLeft(String textArray, int shiftBy) {
  for (int i = 0;
      i < shiftBy;
      i++) //Repeats the procedure until the shift value is reached.
  {
    textArray = textArray.substring(1) +
        textArray.substring(0,
            1); //places the first character at the last position and shifts everything to the left by 1 place.
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

String reverseKeyProcess(String text, String key) {
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
