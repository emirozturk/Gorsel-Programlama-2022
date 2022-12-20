class Response {
  bool? isSuccess;
  String? message;
  dynamic body;
  Response.fromJson(Map<String, dynamic> json) {
    isSuccess = json["isSuccess"] as bool;
    message = json["message"];
    body = json["body"];
  }
}
