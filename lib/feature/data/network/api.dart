import 'package:delivery/core/app_utils/app_constants.dart';
import 'package:delivery/core/data/response/base_response.dart';
import 'package:delivery/feature/data/responce/entity.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'api.g.dart';

@RestApi(baseUrl: AppConstants.baseUrl)
abstract class ServiceClient {
  factory ServiceClient(Dio dio, {String baseUrl}) = _ServiceClient;

  @GET("api/item-categories")
  Future<BaseResponse<UserEntity>> login();
}
