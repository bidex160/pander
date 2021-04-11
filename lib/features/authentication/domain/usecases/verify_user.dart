import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:pander/core/error/failures.dart';
import 'package:pander/core/usecases/usecase.dart';

class VerifyUser extends UseCase<void, VerifyUserParams> {
  final FirebaseAuth firebaseAuth;

  VerifyUser({@required this.firebaseAuth});
  
  @override
  Future<Either<Failure, void>> call(VerifyUserParams params) async {
    try {
      await firebaseAuth.checkActionCode(params.code);
      await firebaseAuth.applyActionCode(params.code);

      firebaseAuth.currentUser.reload();
    } on FirebaseAuthException catch(e) {
      return Left(FirebaseAuthFailure(code: e.code));
    }

    return Right(null);
  }

}

class VerifyUserParams extends Equatable {
  final String code;

  VerifyUserParams({@required this.code});

  @override
  List<Object> get props => [code];
}