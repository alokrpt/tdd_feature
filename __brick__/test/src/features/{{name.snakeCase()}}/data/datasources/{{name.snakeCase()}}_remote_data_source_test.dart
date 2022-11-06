import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:setu_farmer_app/src/core/error/exceptions.dart'
    as fs_exceptions;
import 'package:setu_farmer_app/src/core/network/gql_query.dart';
import 'package:setu_farmer_app/src/core/network/graphql_helper.dart';
import 'package:setu_farmer_app/src/features/{{name.snakeCase()}}/data/datasources/{{name.snakeCase()}}_remote_data_source.dart';
import 'package:setu_farmer_app/src/features/{{name.snakeCase()}}/domain/usecases/{{name.snakeCase()}}_use_case.dart';

import '../../../../core/network/network_test_helper.dart';
import '../../../../fixtures/fixture_reader.dart';
import '{{name.snakeCase()}}_remote_data_source_test.mocks.dart';
import '../models/test_data_extension.dart';

@GenerateMocks([GraphQlHelper])
void main() {
  late MockGraphQlHelper client;
  late {{name.pascalCase()}}RemoteDataSource remoteDataSource;

  setUp(() {
    client = MockGraphQlHelper();
    remoteDataSource = {{name.pascalCase()}}RemoteDataSourceImpl(client);
  });

  group('{{name.lowerCase()}}', () {
    const params = {{name.pascalCase()}}Params(
      id: 'id',
    );
    final entity = {{name.pascalCase()}}EntityTestData.createModel();
    test('Should return {{name.lowerCase}} entity when API call is successfully',
        () async {

      //arrange
      expectQueryResult(
        client,
        document: GqlQuery.{{name.camelCase()}},
        variables: {
          "id": params.id,
        },
        response:
            jsonDecode(fixture('{{name.snakeCase()}}_response.json'))['data'],
      );

      //act
      final result = await remoteDataSource.{{name.camelCase()}}(params);

      //assert
      expect(result, entity);
    });

    test('Should throw parsing exception on data parsing failure', () async {
      //arrange

      expectQueryResult(
        client,
        document: GqlQuery.{{name.camelCase()}},
        variables: {
          "id": params.id,
        },
        response: {},
      );

      //act
      final call = remoteDataSource.{{name.camelCase()}}(params);

      //assert
      expect(
        () => call,
        throwsA(const TypeMatcher<fs_exceptions.ParsingException>()),
      );
    });

    test('Should throw server exception on unsuccessful API call', () async {
      //arrange

      expectQueryError(
        client,
        document: GqlQuery.{{name.camelCase()}},
        variables: {
          "id": params,
        },
      );

      //act
      final call = remoteDataSource.{{name.camelCase()}}(params);

      //assert
      expect(
        () => call,
        throwsA(const TypeMatcher<fs_exceptions.ServerException>()),
      );
    });
  });
}
