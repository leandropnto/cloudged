import 'dart:convert';

class User {
  final String uid;
  final String name;
  final String email;
  final String description;
  final String alias;
  User({
    this.uid,
    this.name,
    this.email,
    this.description,
    this.alias,
  });

  User copyWith({
    String uid,
    String name,
    String email,
    String description,
    String alias,
  }) {
    return User(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      email: email ?? this.email,
      description: description ?? this.description,
      alias: alias ?? this.alias,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'description': description,
      'alias': alias,
      'uid': uid,
    };
  }

  static User fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return User(
      uid: map['uid'],
      name: map['name'],
      email: map['email'],
      description: map['description'],
      alias: map['alias'],
    );
  }

  String toJson() => json.encode(toMap());

  static User fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(name: $name, email: $email)';
  }

 
  
}
