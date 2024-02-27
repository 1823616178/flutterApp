import 'package:test1/utils/http.dart';

class Api {
  static const BASE_URL = "123.161.179.32";
  static const PORT = 59573;

  var _request = HttpRequest(Api.BASE_URL, PORT);
  static const getBookCategoryUri = "/api2/bookApi/getBookCategory";
  static const selectBookPropertiesListUri =
      "/api2/bookApi/selectBookPropertiesList";
  static const selectBookIsExist =
      "/api2//bookApi/selectBookPartListAndIsExist";
  static const selectBookContent = "/api2/bookApi/selectBookContentTextInfo";

  /// 请求侧列表导航数据
  Future<Map<dynamic, dynamic>> advancedRetrievalParams(query) async {
    final Map result =
        await _request.post(getBookCategoryUri, queryParameters: query);
    return result;
  }

  ///获取图书资源
  Future<Map<dynamic, dynamic>> selectBookPropertiesList(body) async {
    final Map result =
        await _request.post(selectBookPropertiesListUri, body: body);
    return result;
  }

  /// 获取阅读页图书目录
  Future<Map<dynamic, dynamic>> selectBookPartListAndIsExist(body) async {
    final Map result =
        await _request.post(Api.selectBookIsExist, queryParameters: body);
    return result;
  }

  /// 获取阅读页文章详情
  Future<Map<dynamic, dynamic>> selectBookContentTextInfo(body) async {
    final Map result =
        await _request.post(Api.selectBookContent, queryParameters: body);
    return result;
  }
}
