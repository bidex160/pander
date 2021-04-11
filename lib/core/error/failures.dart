import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

abstract class Failure extends Equatable {
  @override
  List<Object> get props => [];
}

class FirestoreFailure extends Failure {
  final String code;

  FirestoreFailure({@required this.code});
}
class FirebaseAuthFailure extends Failure {
  final String code;

  FirebaseAuthFailure({@required this.code});
}

class FirebaseCloudFunctionFailure extends Failure {
  final String message;

  FirebaseCloudFunctionFailure({@required this.message});
}

class SharedPreferencesFailure extends Failure {}