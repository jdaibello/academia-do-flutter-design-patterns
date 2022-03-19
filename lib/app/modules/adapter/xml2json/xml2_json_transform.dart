import 'package:design_patterns/app/modules/adapter/xml2json/xml2_json_adapter.dart';
import 'package:dio/dio.dart';

class Xml2JsonTransform extends DefaultTransformer {
  @override
  Future transformResponse(
    RequestOptions options,
    ResponseBody response,
  ) async {
    var responseData = await super.transformResponse(options, response);
    return Xml2JsonAdapter.adapter(responseData);
  }
}
