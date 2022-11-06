import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:setu_farmer_app/src/core/constants/error_constants.dart';
import 'package:setu_farmer_app/src/core/error/exceptions.dart';
import 'package:setu_farmer_app/src/core/error/failures.dart';
import 'package:setu_farmer_app/src/core/network/network_info.dart';
import 'package:setu_farmer_app/src/features/{{name.snakeCase()}}/data/datasources/{{name.snakeCase()}}_remote_data_source.dart';
import 'package:setu_farmer_app/src/features/{{name.snakeCase()}}/data/repositories/{{name.snakeCase()}}_repository_impl.dart';
import 'package:setu_farmer_app/src/features/{{name.snakeCase()}}/domain/repositories/{{name.snakeCase()}}_repository.dart';
import 'package:setu_farmer_app/src/features/{{name.snakeCase()}}/domain/usecases/{{name.snakeCase()}}_use_case.dart';

import '../models/test_data_extension.dart';
import '{{name.snakeCase()}}_repository_impl_test.mocks.dart';

@GenerateMocks([
  {{name.pascalCase()}}RemoteDataSource,
  NetworkInfo,
])
void main() {
  late Mock{{name.pascalCase()}}RemoteDataSource remoteDataSource;
  late MockNetworkInfo networkInfo;
  late {{name.pascalCase()}}Repository repository;

  setUp(() {
    remoteDataSource = Mock{{name.pascalCase()}}RemoteDataSource();
    networkInfo = MockNetworkInfo();
    repository = {{name.pascalCase()}}RepositoryImpl(
        dataSource: remoteDataSource,
        networkInfo: networkInfo,
        );
  });
  const params = {{name.pascalCase()}}Params(
      id: 'id',
    );
  var entity = {{name.pascalCase()}}EntityTestData.create();

  group('{{name.lowerCase()}}', () {
    test('should return correct result when requested from data sourse', () async {
      //arrange
      when(networkInfo.isConnected).thenAnswer((_) async => true);
      when(remoteDataSource.{{name.camelCase()}}(any)).thenAnswer((_) async => entity);
      //act
      final result = await repository.{{name.camelCase()}}(params);
      //assert
      expect(result, Right(entity));
    });
    test('should return failure when there is no connection', () async {
      //arrange
      when(networkInfo.isConnected).thenAnswer((_) async => false);
      when(remoteDataSource.{{name.camelCase()}}(any)).thenAnswer((_) async => entity);
      //act
      final result = await repository.{{name.camelCase()}}(params);
      //assert
      expect(result, Left(NoConnectionFailure()));
    });
    test('should return failure when there is Server Failure', () async {
      //arrange
      when(networkInfo.isConnected).thenAnswer((_) async => true);
      when(remoteDataSource.{{name.camelCase()}}(any))
          .thenThrow(ServerException(serverFailureMsg));

      //act
      final result = await repository.{{name.camelCase()}}(params);
      //assert
      expect(result, Left(ServerFailure()));
    });
    test('should return failure when there is no data', () async {
      //arrange
      when(networkInfo.isConnected).thenAnswer((_) async => true);
      when(remoteDataSource.{{name.camelCase()}}(any)).thenThrow(NoDataException());
      //act
      final result = await repository.{{name.camelCase()}}(params);
      //assert
      expect(result, Left(NoDataFailure()));
    });
    test('should return failure when there is parsing failure', () async {
      //arrange
      when(networkInfo.isConnected).thenAnswer((_) async => true);
      when(remoteDataSource.{{name.camelCase()}}(any)).thenThrow(ParsingException());
      //act
      final result = await repository.{{name.camelCase()}}(params);
      //assert
      expect(result, Left(ParsingFailure()));
    });
  });
}
