class Response {
  Response({
    this.status,
    this.msg,
  });

  bool status;
  String msg;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        status: json["status"],
        msg: json["msg"],
      );
}
