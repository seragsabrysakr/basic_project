import 'package:dartz/dartz.dart';
import 'package:delivery/core/data/network/error_handler.dart';
import 'package:delivery/core/data/network/save_api.dart';
import 'package:delivery/core/data/response/base_response.dart';
import 'package:delivery/feature/data/data_source/remote_data_source.dart';
import 'package:delivery/feature/data/responce/entity.dart';
import 'package:delivery/feature/domain/model/use_model.dart';
import 'package:delivery/feature/domain/repository/user_repository.dart';
import 'package:injectable/injectable.dart';

import '../mappers/user_mapper.dart';

@Injectable(as: UserRepository)
class UserRepositoryImpl implements UserRepository {
  final SafeApi api;
  final RemoteDataSource remoteDataSource;
  final UserMapper _userMapper;

  UserRepositoryImpl(this.api, this.remoteDataSource, this._userMapper);

  @override
  Future<Either<Failure, UserModel>> login() async{
    return api.call(
        apiCall: remoteDataSource.login(),
    // if we wait for message we don't use this //
      onMap: (BaseResponse<UserEntity> response) {
        var data = _userMapper.mapFromEntity(response.data);
        return data;
      },

    );
  }
}
