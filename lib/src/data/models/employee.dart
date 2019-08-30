class Employee {
  int id;
  String firstName;
  String lastName;
  String pin;
  int roleId;
  String email;
  String mobile;
  String merchantId;
  bool isActive;
  String deviceId;
  String avatarName;

  Employee(
      {this.id,
      this.firstName,
      this.lastName,
      this.pin,
      this.roleId,
      this.email,
      this.mobile,
      this.merchantId,
      this.isActive,
      this.deviceId,
      this.avatarName});

  Employee.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    pin = json['pin'];
    roleId = json['roleId'];
    email = json['email'];
    mobile = json['mobile'];
    merchantId = json['merchantId'].toString();
    isActive = json['isActive'];
    deviceId = json['deviceId'];
    avatarName = json['avatarName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['pin'] = this.pin;
    data['roleId'] = this.roleId;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['merchantId'] = this.merchantId;
    data['isActive'] = this.isActive;
    data['deviceId'] = this.deviceId;
    data['avatarName'] = this.avatarName;
    return data;
  }
}
