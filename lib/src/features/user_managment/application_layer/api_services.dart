import 'package:http/http.dart' as http;
import 'dart:convert';


class ApiServices
{
  String baseUrl = 'http://api.workiom.site';

  Future getCurrentLoginInformations(String tenantName) async {
    final response = await http.post(
      Uri.parse('https://api.workiom.com/api/services/app/Account/IsTenantAvailable'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "tenancyName": tenantName
      }),
    );
    var responseBody = jsonDecode(response.body);
    // we can access the received data directly:
    print('--------------------------');
    print(responseBody['result']['tenantId']);

    //return response;
    /*if (response.statusCode == 200) {
      // we cant use the response body before decode the json data:
      var responseBody = jsonDecode(response.body);
      // we can access the received data directly:
      print('-------------------');
      print(responseBody);
    } else {
      throw Exception('Failed to create album.');
    }*/
  }


  Future getPost() async{
    Uri url = Uri.parse('https://jsonplaceholder.typicode.com/posts?userId=1');
    var response = await http.get(url);
    // we cant use the response body before decode the json data:
    var responseBody = jsonDecode(response.body);
    // we can access the received data directly:
    print('-------------------');
    print(responseBody[1]['title']);
  }

  Future addPosts() async{
    Uri url = Uri.parse('https://jsonplaceholder.typicode.com/posts?userId=1');
    var response = await http.post(url, body: {
      'title' : 'yousif',
      'body' : 'interview',
      'userId' : '1'
    });
    // we cant use the response body before decode the json data:
    var responseBody = jsonDecode(response.body);
    // we can access the received data directly:
    print('-------------------');
    print(responseBody);
  }

}