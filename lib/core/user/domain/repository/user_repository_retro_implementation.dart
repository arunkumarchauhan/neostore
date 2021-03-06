import 'package:either_dart/either.dart';
import 'package:either_dart/src/either.dart';
import 'package:neostore/core/user/data/datasource/user_api_service.dart';
import 'package:neostore/core/user/data/datasource/user_remote_data_source.dart';
import 'package:neostore/core/user/data/dto/register_dto.dart';
import 'package:neostore/core/user/data/mapper/user_mapper.dart';
import 'package:neostore/core/user/data/repositories/user_repository.dart';
import 'package:neostore/core/user/domain/entity/user_entity.dart';
import 'package:neostore/core/user/domain/entity/user_login_cred_entity.dart';
import 'package:neostore/core/user/domain/entity/user_response_entity.dart';
import 'package:neostore/utils/models/failure.dart';

class UserRepoRetroImplementation extends UserRepository {
  UserRepoRetroImplementation({required UserApiService remoteDatSource})
      : _remoteDatSource = remoteDatSource;
  late UserApiService _remoteDatSource;
  @override
  Future<Either<Failure, UserDataEntity>> registerUser(
      UserEntity userEntity) async {
    try {
      final response = await _remoteDatSource
          .register(UserMapper.mapUserEntityToRegisterDTO(userEntity));
      if (response.status == 200) {
        return Right(UserDataEntity.fromMap(response.toJson()));
      } else {
        return Left(Failure("${response.usr_msg}"));
      }
    } catch (e) {
      print(e);
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserDataEntity>> loginUser(
      UserLoginCredEntity userLoginCredEntity) async {
    try {
      final response = await _remoteDatSource.login(
          UserMapper.mapUserLoginCredEntityToLoginDTO(userLoginCredEntity));
      if (response.status == 200) {
        return Right(UserDataEntity.fromMap(response.toJson()));
      } else {
        return Left(Failure("${response.usr_msg}"));
      }
    } catch (e) {
      print(e);
      return Left(Failure(e.toString()));
    }
  }
}
