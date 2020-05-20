import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class Folder {
  final String uid;
  final String name;
  final String type;
  final String color;
  final DateTime createdAt;
  final String icon;

  Folder({
    this.uid,
    this.name,
    this.type,
    this.color,
    this.createdAt,
    this.icon
  });

  Folder copyWith({
    String uid,
    String name,
    String type,
    String color,
    DateTime createdAt,
    String icon,
  }) {
    return Folder(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      type: type ?? this.type,
      color: color ?? this.color,
      createdAt: createdAt ?? this.createdAt,
      icon: icon ?? this.icon,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'type': type,
      'color': color,
      'createdAt': Timestamp.fromDate(createdAt),
      'icon': icon,
    };
  }

  static Folder fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    final createdAt = (map['createdAt'] as Timestamp).millisecondsSinceEpoch;

    return Folder(
      uid: map['uid'],
      name: map['name'],
      type: map['type'],
      color: map['color'],
      createdAt: DateTime.fromMillisecondsSinceEpoch(createdAt),
      icon: map['icon'],
    );
  }

  String toJson() => json.encode(toMap());

  static Folder fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'Folder(uid: $uid, name: $name)';
  }

}
