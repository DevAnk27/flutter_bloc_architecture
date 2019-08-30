class ApiResponse {
  bool status;
  String message;
  dynamic data;

  ApiResponse(this.status, this.message, this.data);

  ApiResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = new Map<String, dynamic>();
    map['status'] = this.status;
    map['message'] = this.message;
    map['data'] = this.data;
    return data;
  }
}
