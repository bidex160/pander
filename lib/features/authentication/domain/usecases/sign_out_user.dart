import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:dartz/dartz.dart';
import 'package:pander/core/error/failures.dart';
import 'package:pander/core/usecases/usecase.dart';

class SignOutUser extends UseCase<void, NoParams> {
  final FirebaseAuth firebaseAuth;

  SignOutUser({@required this.firebaseAuth});
  
  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    await firebaseAuth.signOut();
    return null;
  }

}