import 'package:flutter_secure_storage/flutter_secure_storage.dart';


class SecureStorageServices
{
  final accessTokenStorage = const FlutterSecureStorage();

  // Write Secure Data
  Future<void> writeAccessToken(String? accessToken) async{
    await accessTokenStorage.write(key: 'accessToken', value: accessToken);
  }
  // Read Secure Data
  Future<String> readAccessToken() async{
    String? token = await accessTokenStorage.read(key: 'accessToken');
    if (token != null) {
      print('------------------------------');
      print('readAccessToken function done:  $token');
      return token;
    }  else {
      print('readAccessToken failed ---------------------------------');
      return '';
    }
  }
  // Delete Secure Data
  Future<void> deleteAccessToken(String? accessToken) async{
    await accessTokenStorage.delete(key: 'accessToken');
  }

}