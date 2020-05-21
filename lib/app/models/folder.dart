import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloudged/app/common/constants/colors.dart';
import 'base_model.dart';

class Folder with BaseModel {
  final String uid;
  final String name;
  final String type;
  final String color;
  final String icon;

  Folder({this.uid, this.name, this.type, this.color, this.icon});

  Folder copyWith({
    String uid,
    String name,
    String type,
    String color,
    String icon,
  }) {
    return Folder(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      type: type ?? this.type,
      color: color ?? this.color,
      icon: icon ?? this.icon,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'type': type,
      'color': color,
      'icon': icon,
    }..addAll(toBaseMap());
  }

  static Folder fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    final now = Timestamp.now();
    var folder = Folder(
      uid: map['uid'],
      name: map['name'],
      type: map['type'],
      color: map['color'],
      icon: map['icon'],
    )..createdAt = map['createdAt'] ?? now;

    folder.updatedAt = map['updateAt'] ?? now;
    return folder;
  }

  String toJson() => json.encode(toMap()..addAll(toBaseMap()));

  static Folder fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'Folder(uid: $uid, name: $name)';
  }

  factory Folder.startFolder() {
    return Folder(
        name: "Documents",
        type: "documents",
        icon: "folder",
        color: "0xFF567DF4");
  }
}
