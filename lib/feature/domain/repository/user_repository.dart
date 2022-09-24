import 'package:dartz/dartz.dart';
import 'package:delivery/core/data/network/error_handler.dart';
import 'package:delivery/feature/domain/model/use_model.dart';

abstract class UserRepository {
  Future<Either<Failure, UserModel>> login();
}
