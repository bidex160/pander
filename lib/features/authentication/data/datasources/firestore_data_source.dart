import 'package:pander/features/authentication/data/models/user_data_model.dart';
import 'package:pander/features/authentication/domain/entities/user_data.dart';

abstract class FirestoreDataSource {
  /// Throws a [FirestoreException] for all errors
  Future<UserDataModel> getUserData(String username);

  /// Throws a [FirestoreException] for all errors
  Future<UserDataModel> saveUserData(UserData userData);
}