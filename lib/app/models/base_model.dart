import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

mixin BaseModel {
  Timestamp createdAt = Timestamp.now();
  Timestamp updatedAt = Timestamp.now();
  final DateFormat _formatador1 = DateFormat('EEE, dd/MM/y', 'pt_BR');

  Map<String, dynamic> toBaseMap() => {
        "createdAt": createdAt,
        "updatedAt": updatedAt,
      };

  String get createdAtFormated => _formatador1.format(createdAt.toDate());
}
