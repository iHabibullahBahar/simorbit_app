class MessageModel {
  bool? status;
  List<Data>? data;

  MessageModel({this.status, this.data});

  MessageModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? imei;
  int? deviceId;
  String? phoneNo;
  String? content;
  String? createdAt;

  Data(
      {this.id,
      this.imei,
      this.deviceId,
      this.phoneNo,
      this.content,
      this.createdAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imei = json['imei'];
    deviceId = json['device_id'];
    phoneNo = json['phone_no'];
    content = json['content'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['imei'] = this.imei;
    data['device_id'] = this.deviceId;
    data['phone_no'] = this.phoneNo;
    data['content'] = this.content;
    data['created_at'] = this.createdAt;
    return data;
  }
}
