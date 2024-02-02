import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'dart:convert' as Convert;
import 'package:http/http.dart' as http;

typedef RequestCallBack = void Function(Map data);

class HttpRequest {
  static requestGet(
      String authority, String unencodedPath, RequestCallBack callBack,
      [Map<String, String>? queryParameters]) async {
    try {
      var httpClient = new HttpClient();
      var uri = new Uri.http(authority, unencodedPath, queryParameters);
      var request = await httpClient.getUrl(uri);
      var response = await request.close();
      var responseBody = await response.transform(Convert.utf8.decoder).join();
      Map data = Convert.jsonDecode(responseBody);
      callBack(data);
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  static const defaultHeader = {
    'Accept': 'application/json',
    "charset": "UTF-8",
    'Accept-Encoding': 'gzip, deflate, br',
    'Accept-Language': 'zh-CN,zh;q=0.9,en;q=0.8'
  };
  final baseUrl;
  final port;

  HttpRequest(this.baseUrl, this.port);

  Future<dynamic> get(String uri, {Map<String, String>? headers}) async {
    try {
      http.Response response = await http.get(baseUrl + uri, headers: headers);
      final statusCode = response.body;
      final body = response.body;
      print('[uri=$uri][statusCode=$statusCode][response=$body]');
      var result = Convert.jsonDecode(body);
      return result;
    } on Exception catch (e) {
      print('[uri=$uri][Exception e=${e.toString()}]');
    }
  }

  Future<dynamic> getResponseBody(String uri,
      {Map<String, String>? headers}) async {
    try {
      http.Response response = await http.get(baseUrl + uri, headers: headers);
      final statusCode = response.statusCode;
      final body = response.body;
//      var result = Convert.jsonDecode(body);
      print('[uri=$uri][statusCode=$statusCode][response=$body]');
      return body;
    } on Exception catch (e) {
      print('[uri=$uri]exception e=${e.toString()}');
      return null;
    }
  }

  Future<dynamic> post(
    String uri, {
    Map<String, String>? headers,
    dynamic queryParameters,
    dynamic body,
  }) async {
    try {
      var path = Uri(
          scheme: "http",
          host: baseUrl,
          port: port,
          path: uri,
          queryParameters: queryParameters);
      http.Response response = await http
          .post(path, body: body, headers: {...defaultHeader, ...?headers});
      final statusCode = response.statusCode;
      final responseBody = Convert.utf8.decode(response.bodyBytes);
      var result = Convert.jsonDecode(responseBody);
      print('[uri=$uri][statusCode=$statusCode][response=$responseBody]');
      return result;
    } on Exception catch (e) {
      print('[uri=$uri]exception e=${e.toString()}');
      return '';
    }
  }
}
