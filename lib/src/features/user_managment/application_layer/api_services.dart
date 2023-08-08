import 'package:http/http.dart' as http;
import 'dart:convert';


class ApiServices
{
  String baseUrl = 'http://api.workiom.site';
  // ----- Before registration we need to check if the tenant is available and not taken by another tenant
  Future<dynamic> isTenantAvailable(String tenantName) async {
    final response = await http.post(
      Uri.parse('https://api.workiom.com/api/services/app/Account/IsTenantAvailable'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "tenancyName": tenantName
      }),
    );
    if (response.statusCode == 200) {
      // we cant use the response body before decode the json data:
      var responseBody = jsonDecode(response.body);
      return responseBody['result']['tenantId'];
    } else {
      throw Exception('Failed to load api data.');
    }
  }

  void registerTenant(String email, String adminFirstName, String adminLastName, String adminPassword, String tenancyName) async{
    final response = await http.post(
      Uri.parse('https://api.workiom.com/api/services/app/TenantRegistration/RegisterTenant').replace(queryParameters: {"timeZone": "Europe/Istanbul"}),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },

      body: jsonEncode(<String, dynamic>{
        "adminEmailAddress": email,
        "adminFirstName": adminFirstName,
        "adminLastName": adminLastName,
        "adminPassword": adminPassword,
        "captchaResponse": null,
        "editionId": 2,
        "name": tenancyName,
        "tenancyName": tenancyName,
      }),
    );
    if (response.statusCode == 200) {
      // we cant use the response body before decode the json data:
      var responseBody = jsonDecode(response.body);
      print('-------------------------------');
      print(responseBody['result']['tenantId']);
    } else {
      throw Exception('Failed to load api register.');
    }
  }

}