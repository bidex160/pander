import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:pander/core/error/failures.dart';
import 'package:pander/core/usecases/usecase.dart';

class ResetPassword extends UseCase<void, ResetPasswordParams> {
  final FirebaseAuth firebaseAuth;

  ResetPassword({@required this.firebaseAuth});
  
  @override
  Future<Either<Failure, void>> call(ResetPasswordParams params) async {
    try {
      await firebaseAuth.sendPasswordResetEmail(email: params.email);
      return Right(null);
    } on FirebaseAuthException catch(e) {
      return Left(FirebaseAuthFailure(code: e.code));
    }
  }

}

class ResetPasswordParams extends Equatable {
  final String email;

  ResetPasswordParams({@required this.email});
  
  @override
  List<Object> get props => [email];
}