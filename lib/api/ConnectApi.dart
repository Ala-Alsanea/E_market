// ignore_for_file: unused_field, unused_local_variable, avoid_print
import 'dart:convert';

import 'package:http/http.dart' as http;

class ConnectApi {
  final String _API = 'https://fb.amjadfqs.me/api/';
  final String Storge = 'https://fb.amjadfqs.me';

  getAllData(entryPoint) async {
    print(_API + entryPoint);
    var url = Uri.parse(_API + entryPoint);
    var response = await http.get(url);
    print(response.statusCode);
    try {
      if (response.statusCode == 200) {
        return response.body;
      }
      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }
//

  // postData({data = '', entryPoint = "", token = ''}) async {
  //   // print(_localUrl + entryPoint);

  //   //
  //   try {
  //     var url = Uri.https(_localUrl, '/api/' + entryPoint);
  //     print('Response body: ${url.toString()}');
  //     http.Response response = await http.post(
  //       url,
  //       body: jsonEncode(data),
  //       headers: _setHeader(token: token),
  //     );
  //     print('Response body: ${response.body}');
  //     //

  //     print("state-> " + response.statusCode.toString());
  //     if (response.statusCode == 200) {
  //       return response;
  //     }
  //     return false;
  //   } catch (e) {
  //     print(e);
  //     // print('connection filed');
  //     return false;
  //   }
  // }

  // _setHeader({token = ''}) {
  //   return {
  //     'Content-Type': 'application/json',
  //     'Accept': 'application/json',
  //     'Authorization': 'Bearer ' + token,
  //   };
  // }
}
