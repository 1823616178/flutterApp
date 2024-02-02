import 'package:test1/utils/http.dart';

class Api {
  static const BASE_URL = "123.161.179.32";
  static const PORT = 59573;

  var _request = HttpRequest(Api.BASE_URL, PORT);
  static const getBookCategoryUri = "/api2/bookApi/getBookCategory";

  void advancedRetrievalParams(
      Map<String, dynamic> query, RequestCallBack requestCallBack) async {
    final Map result =
        await _request.post(getBookCategoryUri, queryParameters: query);
    requestCallBack(result);
  }
}
