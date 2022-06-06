import 'dart:convert';

PostRequest postRequestFromJson(String str) =>
    PostRequest.fromJson(json.decode(str));

String postRequestToJson(PostRequest data) => json.encode(data.toJson());

class PostRequest {
  PostRequest({
    required this.title,
    required this.body,
    required this.userId,
  });

  String title;
  String body;
  int userId;

  factory PostRequest.fromJson(Map<String, dynamic> json) => PostRequest(
        title: json["title"],
        body: json["body"],
        userId: json["userId"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "body": body,
        "userId": userId,
      };
}
