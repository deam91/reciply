import 'package:cloud_firestore/cloud_firestore.dart';

const firebaseImagesPath = 'images/';

Timestamp? timestampFromJson(dynamic timestampJson) {
  if (timestampJson is Timestamp) return timestampJson;
  if (timestampJson is Map) {
    final map = Map<String, dynamic>.from(timestampJson);
    final seconds = map["_seconds"];
    final nanoseconds = map["_nanoseconds"];
    return Timestamp(seconds, nanoseconds);
  }
  return null;
}

String timestampToJson(Timestamp? timestamp) {
  return timestamp?.toDate().toString() ?? '';
}
