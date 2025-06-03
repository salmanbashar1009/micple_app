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
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['title'] = title;
    data['route'] = route;
    data['content'] = content;
    data['type'] = type;
    data['createdAt'] = createdAt;
    data['__v'] = iV;
    return data;
  }
}
