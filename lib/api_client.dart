import 'package:api/User.dart';
import 'package:api/post.dart';
import 'package:dio/dio.dart';

import 'apis.dart';
import 'package:retrofit/http.dart';
part 'api_client.g.dart';

@RestApi(baseUrl: "https://jsonplaceholder.typicode.com/")
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;
  static final client =
      ApiClient(Dio(BaseOptions(contentType: "application/json")));
  @GET("users")
  Future<List<UserList>> getUsers();
  @GET("posts")
  Future<dynamic> postUsers(@Path("id") int id);

  @POST("posts")
  Future postUers(@Body() PostRequest request);
  // @DELETE(Apis.users)
  // Future<dynamic> deleteuser(@Path("id") String id);

}
