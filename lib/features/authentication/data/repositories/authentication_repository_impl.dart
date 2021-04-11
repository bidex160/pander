import 'package:flutter/foundation.dart';
import 'package:dartz/dartz.dart';
import 'package:pander/core/error/exceptions.dart';
import 'package:pander/core/error/failures.dart';
import 'package:pander/features/authentication/data/datasources/firestore_data_source.dart';
import 'package:pander/features/authentication/data/datasources/shared_preferences_data_source.dart';
import 'package:pander/features/authentication/domain/entities/user_data.dart';
import 'package:pander/features/authentication/domain/repositories/authentication_repository.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final FirestoreDataSource firestoreDataSource;
  final SharedPreferencesDataSource sharedPreferencesDataSource;

  AuthenticationRepositoryImpl({
    @required this.firestoreDataSource,
    @required this.sharedPreferencesDataSource
  });
  
  @override
  Future<Either<Failure, UserData>> getUserInfo(String username) async {
    try {
      final userData = await firestoreDataSource.getUserData(username);
      return Right(userData);
    } on FirestoreException catch (e) {
      return Left(FirestoreFailure(code: e.code));
    }
  }
  
    @override
    Future<Either<Failure, UserData>> saveUserInfo(UserData userData) async {
      try {
        final result = await firestoreDataSource.saveUserData(userData);
        return Right(result);
      } on FirestoreException catch(e) {
        return Left(FirestoreFailure(code: e.code));
      }
  }
}