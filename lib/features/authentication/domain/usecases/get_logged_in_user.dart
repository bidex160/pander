import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:pander/core/constants/firebase_constants.dart';
import 'package:pander/core/error/failures.dart';
import 'package:pander/core/usecases/usecase.dart';
import 'package:pander/features/authentication/domain/entities/auth_data.dart';

class GetLoggedInUser extends UseCase<AuthData, NoParams> {
  final FirebaseAuth firebaseAuth;

  GetLoggedInUser({@required this.firebaseAuth});

  @override
  Future<Either<Failure, AuthData>> call(NoParams params) async {
    final user = firebaseAuth.currentUser;
    if (user == null) {
      return Left(FirebaseAuthFailure(code: FirebaseConstants.UserNotFound));
    }
    return Right(AuthData(user: user));
  }
}