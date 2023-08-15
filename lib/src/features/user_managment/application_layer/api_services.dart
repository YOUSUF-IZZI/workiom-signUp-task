import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:workiom/src/features/user_managment/application_layer/secure_storage_services.dart';


class ApiServices
{
  String baseUrl = 'https://api.workiom.com';

  // ----- Before registration we need to check if the tenant is available and not taken by another tenant
  Future<dynamic> isTenantAvailable(String tenantName) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/services/app/Account/IsTenantAvailable'),
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

  // ----- Register a tenant with user ---------------
  Future<dynamic> registerTenant(String email, String adminFirstName, String adminLastName, String adminPassword, String tenancyName) async{
    final response = await http.post(
      Uri.parse('$baseUrl/api/services/app/TenantRegistration/RegisterTenant?timeZone=Europe/Istanbul'),
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
      return responseBody['success'];
    } else {
      return false;
    }
  }

  // ----- Login the user In ---------------
  Future<dynamic> loginUserIn(String userNameOrEmailAddress, String password, String tenantName) async{
    final response = await http.post(
      Uri.parse('$baseUrl/api/TokenAuth/Authenticate'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "ianaTimeZone": "Europe/Istanbul",
        "password": password,
        "rememberClient": false,
        "returnUrl": null,
        "singleSignIn": false,
        "tenantName": tenantName,
        "userNameOrEmailAddress": userNameOrEmailAddress,
      }),
    );
    var responseBody = jsonDecode(response.body);
    return responseBody;
  }

  // ----- Get Current Login Information ---------------
  Future<String?> getCurrentLoginInformation() async{
    final response = await http.get(
      Uri.parse('$baseUrl/api/services/app/Session/GetCurrentLoginInformations'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${await SecureStorageServices().readAccessToken()}'
      },
    );
    var responseBody = jsonDecode(response.body);
    return responseBody['result']['user']['name'];
  }
}