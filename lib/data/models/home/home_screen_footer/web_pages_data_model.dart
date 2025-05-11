import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class WebPagesDataModel {
  @HiveField(0)
  bool? success;
  @HiveField(1)
  List<Data>? data;

  WebPagesDataModel({this.success, this.data});

  WebPagesDataModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

@HiveType(typeId: 1)
class Data {
  @HiveField(0)
  String? sId;
  @HiveField(1)
  String? title;
  @HiveField(2)
  String? route;
  @HiveField(3)
  String? content;
  @HiveField(4)
  String? type;
  @HiveField(5)
  String? createdAt;
  @HiveField(6)
  int? iV;

  Data(
      {this.sId,
        this.title,
        this.route,
        this.content,
        this.type,
        this.createdAt,
        this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    route = json['route'];
    content = json['content'];
    type = json['type'];
    createdAt = json['createdAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['route'] = this.route;
    data['content'] = this.content;
    data['type'] = this.type;
    data['createdAt'] = this.createdAt;
    data['__v'] = this.iV;
    return data;
  }
}
