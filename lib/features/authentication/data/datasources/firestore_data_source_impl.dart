import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:pander/core/constants/firebase_constants.dart';
import 'package:pander/core/error/exceptions.dart';
import 'package:pander/features/authentication/data/datasources/firestore_data_source.dart';
import 'package:pander/features/authentication/data/models/user_data_model.dart';
import 'package:pander/features/authentication/domain/entities/user_data.dart';

class FirestoreDataSourceImpl implements FirestoreDataSource {
  final FirebaseFirestore firebaseFirestore;

  FirestoreDataSourceImpl({@required this.firebaseFirestore});
  
  @override
  Future<UserDataModel> getUserData(String username) async {
    final querysnapshot = await firebaseFirestore.collection('users')
      .where('username', isEqualTo: username)
      .get();
    final documents = querysnapshot.docs;  
    if (documents.length <= 0) {
      throw FirestoreException(code: FirebaseConstants.DocumentNotFound);
    }
    
    final document = documents[0];
    return UserDataModel.fromSnapshot(document.data());
  }
  
  @override
  Future<UserDataModel> saveUserData(UserData userData) async {
    try {
      UserDataModel userDataModel = UserDataModel(username: userData.username);
      final result = await firebaseFirestore.collection('users')
        .add(userDataModel.toMap());

      final snapshot = await result.get();  
      return UserDataModel.fromSnapshot(snapshot.data());
    } on Exception {
      throw FirestoreException(code: FirebaseConstants.DocumentSaveFailed);
    }
  }

}