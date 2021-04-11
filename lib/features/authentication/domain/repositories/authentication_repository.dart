import 'package:dartz/dartz.dart';
import 'package:pander/core/error/failures.dart';
import 'package:pander/features/authentication/domain/entities/user_data.dart';

abstract class AuthenticationRepository {
  Future<Either<Failure, UserData>> getUserInfo(String username);
  Future<Either<Failure, UserData>> saveUserInfo(UserData userData);
}