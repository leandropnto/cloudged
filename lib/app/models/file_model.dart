import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class FileModel {
  final String uid;
  final String name;
  final DateTime createdAt;
  final String contentType;
  final String urlDownload;
  final String owner;
  final String user;
  final int size;

  FileModel({
    this.uid,
    this.name,
    this.createdAt,
    this.contentType,
    this.urlDownload,
    this.owner,
    this.user,
    this.size,
  });

  FileModel copyWith({
    String uid,
    String name,
    DateTime createdAt,
    String contentType,
    String urlDownload,
    String owner,
    String user,
    int size,
  }) {
    return FileModel(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      createdAt: createdAt ?? this.createdAt,
      contentType: contentType ?? this.contentType,
      urlDownload: urlDownload ?? this.urlDownload,
      owner: owner ?? this.owner,
      user: user ?? this.user,
      size: size ?? this.size,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'createdAt': Timestamp.fromDate(createdAt),
      'contentType': contentType,
      'urlDownload': urlDownload,
      'owner': owner,
      'user': user,
      'size': size,
    };
  }

  static FileModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    final createdAt = (map['createdAt'] as Timestamp).millisecondsSinceEpoch;

    return FileModel(
      uid: map['uid'],
      name: map['name'],
      createdAt: DateTime.fromMillisecondsSinceEpoch(createdAt),
      contentType: map['contentType'],
      urlDownload: map['urlDownload'],
      owner: map['owner'],
      user: map['user'],
      size: map['size'],
    );
  }

  String toJson() => json.encode(toMap());

  static FileModel fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return '''
FileModel(name: $name, createdAt: $createdAt, contentType: $contentType, urlDownload: $urlDownload, owner: $owner, user: $user)''';
  }

  String get fileSize =>
      size != null && size > 0 ? "${(size / 1024).round()}Kb" : "N/A";
}
