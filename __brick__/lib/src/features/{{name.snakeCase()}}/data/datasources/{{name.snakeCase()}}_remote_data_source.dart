import 'package:flutter/cupertino.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/network/gql_query.dart';
import '../../../../core/network/graphql_helper.dart';
import '../../../../core/utils/sentry_helper.dart';
import '../../../../core/network/graphql_helper.dart';
import '../../domain/entities/{{name.snakeCase()}}_entity.dart';
import '../../domain/usecases/{{name.snakeCase()}}_use_case.dart';
import '../models/{{name.snakeCase()}}_model.dart';

abstract class {{name.pascalCase()}}RemoteDataSource {
  /// get {{name.lowerCase}} from server
  ///
  /// Throws [ServerException] for all error codes.
  Future<{{name.pascalCase()}}Entity> {{name.camelCase()}}({{name.pascalCase()}}Params params);
}

class {{name.pascalCase()}}RemoteDataSourceImpl implements {{name.pascalCase()}}RemoteDataSource{
    final GraphQlHelper client;
    {{name.pascalCase()}}RemoteDataSourceImpl(this.client);

    @override
    Future<{{name.pascalCase()}}Entity> {{name.camelCase()}}({{name.pascalCase()}}Params params) async {
    final result = await client.query(
      document: GqlQuery.{{name.camelCase()}},
      variables: {
        "id": params.id,
      },
    );

    if (result.hasException) {
      await sentryCaptureException(result.exception);
      debugPrint(result.exception.toString());
      throw ServerException(result.exception.toString());
    }

    try {
      final team = {{name.pascalCase()}}Model.fromJson(
          result.data!["key_here"]);
      return team;
    } catch (e) {
      await sentryCaptureException(e);
      throw ParsingException();
    }
    }
}