import 'package:flutter/foundation.dart';

class FirestoreException implements Exception {
  final String code;

  FirestoreException({@required this.code});
}

class FirebaseCloudFunctionException implements Exception {
  final String message;

  FirebaseCloudFunctionException({@required this.message});
}

class SharedPreferencesException implements Exception {}