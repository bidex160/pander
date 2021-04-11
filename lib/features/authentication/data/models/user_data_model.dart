import 'package:flutter/foundation.dart';
import 'package:pander/features/authentication/domain/entities/user_data.dart';

class UserDataModel extends UserData {
  UserDataModel({@required String username}): super(username: username);

  factory UserDataModel.fromSnapshot(Map<String, dynamic> snapshot) {
    return UserDataModel(
      username: snapshot['username']
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'username': this.username
    };
  }
}