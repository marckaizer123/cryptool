import 'encrypt_.dart';
import 'decrypt_.dart';

class Crypto {
  static Map<String, String> encrypt(String plainText) {
    return encrypt_(plainText);
  }

  static Map<String, String> decrypt(String cipherText, String key) {
    return decrypt_(cipherText, key);
  }
}
