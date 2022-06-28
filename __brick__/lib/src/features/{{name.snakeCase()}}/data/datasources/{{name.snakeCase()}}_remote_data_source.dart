import '../../../../core/network/graphql_helper.dart';
import '../../domain/entities/{{name.snakeCase()}}_entity.dart';
import '../../domain/use_cases/{{name.snakeCase()}}_use_case.dart';

abstract class {{name.pascalCase()}}RemoteDataSource {
  /// get {{name.lowerCase}} from server
  ///
  /// Throws [ServerException] for all error codes.
  Future<{{name.pascalCase()}}Entity> {{name.camelCase()}}({{name.pascalCase()}}Params params);
}

class {{name.pascalCase()}}RemoteDataSourceImpl implements {{name.pascalCase()}}RemoteDataSource{
    
}