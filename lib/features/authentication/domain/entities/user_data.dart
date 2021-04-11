import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class UserData extends Equatable {
  final String username;

  UserData({@required this.username});
  
  @override
  List<Object> get props => [username];
}