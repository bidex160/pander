import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:dartz/dartz.dart';
import 'package:pander/core/error/failures.dart';
import 'package:pander/core/usecases/usecase.dart';

class SendVerificationMail extends UseCase<void, NoParams> {
  final FirebaseAuth firebaseAuth;

  SendVerificationMail({@required this.firebaseAuth});
  
  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    try {
      if (!firebaseAuth.currentUser.emailVerified) {
        await firebaseAuth.currentUser.sendEmailVerification();
      }

      return Right(null);
    } on FirebaseAuthException catch(e) {
      return Left(FirebaseAuthFailure(code: e.code));
    }
  }

}