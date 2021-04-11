import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:pander/core/error/failures.dart';
import 'package:pander/core/usecases/usecase.dart';
import 'package:pander/features/authentication/domain/entities/auth_data.dart';

class SignInUser extends UseCase<AuthData, SignInUserParams> {
  final FirebaseAuth _firebaseAuth;

  SignInUser({
    @required FirebaseAuth firebaseAuth, @required authenticationRepository
  }): _firebaseAuth = firebaseAuth;
  
  @override
  Future<Either<Failure, AuthData>> call(SignInUserParams params) async {
    try {
      UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: params.email,
        password: params.password
      );

      return Right(AuthData(
        user: userCredential.user,
        userCredential: userCredential.credential
      ));
    } on FirebaseAuthException catch(e) {
      return Left(FirebaseAuthFailure(code: e.code));
    }
  }
}

class SignInUserParams extends Equatable {
  final String email;
  final String password;

  SignInUserParams({@required this.email, @required this.password});

  @override
  List<Object> get props => [email, password];
}