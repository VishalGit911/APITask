import 'dart:convert';

List<UserData> userDataFromJson(String str) =>
    List<UserData>.from(json.decode(str).map((x) => UserData.fromJson(x)));

String userDataToJson(List<UserData> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserData {
  int userId;
  int id;
  String title;
  String body;

  UserData({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}
