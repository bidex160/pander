import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:pander/core/error/failures.dart';
import 'package:pander/core/usecases/usecase.dart';
import 'package:pander/features/authentication/domain/entities/auth_data.dart';
import 'package:pander/features/authentication/domain/entities/user_data.dart';
import 'package:pander/features/authentication/domain/repositories/authentication_repository.dart';

class CreateUser extends UseCase<AuthData, CreateUserParams> {
  final FirebaseAuth _firebaseAuth;
  final AuthenticationRepository _authenticationRepository;

  CreateUser({
    @required FirebaseAuth firebaseAuth, @required authenticationRepository
  }): _firebaseAuth = firebaseAuth, _authenticationRepository = authenticationRepository;
  
  @override
  Future<Either<FirebaseAuthFailure, AuthData>> call(CreateUserParams params) async {
    try {
      UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: params.email,
        password: params.password
      );

      // Save user info to Firestore
      final userData = await _authenticationRepository.getUserInfo(params.username);
      if (userData.isLeft()) {
        UserData userData = UserData(username: params.username);
        await _authenticationRepository.saveUserInfo(userData);
      }

      return Right(AuthData(
        user: userCredential.user,
        userCredential: userCredential.credential
      ));
    } on FirebaseAuthException catch(e) {
      return Left(FirebaseAuthFailure(code: e.code));
    }
  }
}

class CreateUserParams extends Equatable {
  final String username;
  final String email;
  final String password;

  CreateUserParams({@required this.username, @required this.email, @required this.password});

  @override
  List<Object> get props => [username, email, password];
}