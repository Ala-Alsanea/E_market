// ignore_for_file: unused_field, unused_local_variable, avoid_print
import 'dart:convert';

import 'package:http/http.dart' as http;

class ConnectApi {
  final String _localUrl = 'ala.amjadfqs.me';
  final String _storageUrl = 'https://ala.amjadfqs.me/storage/';

  getStorageUrl() {
    return _storageUrl;
  }

  getAllData({entryPoint = "", token = ''}) async {
    print(_localUrl + entryPoint);

    //

    var url = Uri.https(_localUrl, '/api/' + entryPoint);

    http.Response response = await http.get(
      url,
      headers: _setHeader(token: token),
    );
    try {
      print(response.statusCode);
      if (response.statusCode == 200) {
        return response;
      }
      return 'false';
    } catch (e) {
      print(e);
      return 'failed';
    }
  }
//

  postData({data = '', entryPoint = "", token = ''}) async {
    // print(_localUrl + entryPoint);

    //
    try {
      var url = Uri.https(_localUrl, '/api/' + entryPoint);
      print('Response body: ${url.toString()}');
      http.Response response = await http.post(
        url,
        body: jsonEncode(data),
        headers: _setHeader(token: token),
      );
      print('Response body: ${response.body}');
      //

      print("state-> " + response.statusCode.toString());
      if (response.statusCode == 200) {
        return response;
      }
      return false;
    } catch (e) {
      print(e);
      // print('connection filed');
      return false;
    }
  }

  _setHeader({token = ''}) {
    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ' + token,
    };
  }
}
