import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/{{name.snakeCase()}}_entity.dart';
import '../../domain/repositories/{{name.snakeCase()}}_repository.dart';
import '../../domain/usecases/{{name.snakeCase()}}_use_case.dart';
import '../datasources/{{name.snakeCase()}}_remote_data_source.dart';

class {{name.pascalCase()}}RepositoryImpl implements {{name.pascalCase()}}Repository {
  final {{name.pascalCase()}}RemoteDataSource dataSource;
  final NetworkInfo networkInfo;

  {{name.pascalCase()}}RepositoryImpl({
    required this.dataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, {{name.pascalCase()}}Entity>> {{name.camelCase()}}(
      {{name.pascalCase()}}Params params) async => _result(()=> dataSource.{{name.camelCase()}}(params),);

    Future<Either<Failure, T>> _result<T>(
      Future<T> Function() callback) async {
    if (await networkInfo.isConnected) {
      try {
        return Right(await callback());
      } on NoDataException {
        return Left(NoDataFailure());
      } on ServerException {
        return Left(ServerFailure());
      } on ParsingException {
        return Left(ParsingFailure());
      }
    } else {
      return Left(NoConnectionFailure());
    }
  }
}
