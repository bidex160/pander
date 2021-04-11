import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthData extends Equatable {
  final AuthCredential userCredential;
  final User user;

  AuthData({this.userCredential, @required this.user});

  @override
  List<Object> get props => [userCredential];
}