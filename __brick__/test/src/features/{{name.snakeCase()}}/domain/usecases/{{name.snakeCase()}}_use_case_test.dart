import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:setu_farmer_app/src/core/error/failures.dart';
import 'package:setu_farmer_app/src/features/{{name.snakeCase()}}/domain/repositories/{{name.snakeCase()}}_repository.dart';
import 'package:setu_farmer_app/src/features/{{name.snakeCase()}}/domain/usecases/{{name.snakeCase()}}_use_case.dart';

import '../../data/models/test_data_extension.dart';
import '{{name.snakeCase()}}_use_case_test.mocks.dart';

@GenerateMocks([{{name.pascalCase()}}Repository])
void main() {
  late Mock{{name.pascalCase()}}Repository repository;
  late {{name.pascalCase()}}UseCase useCase;

  setUp(() {
    repository = Mock{{name.pascalCase()}}Repository();
    useCase = {{name.pascalCase()}}UseCase(repository);
  });
  group('{{name.lowerCase()}}', () {

    const params = {{name.pascalCase()}}Params(
      id: 'id',
    );
    test(
        'should return entity when call to method from usecase is successful',
        () async {
      //arrange
      when(repository.{{name.camelCase()}}(params)).thenAnswer(
          (_) async => Right({{name.pascalCase()}}EntityTestData.create()));

      //act
      final result = await useCase(params);

      //assert
      expect(result, Right({{name.pascalCase()}}EntityTestData.create()));
      verify(useCase.call(params));
      verifyNoMoreInteractions(repository);
    });

    test(
        'should return failure when call to method from usecase is failed',
        () async {
      //arrange
      when(repository.{{name.camelCase()}}(params))
          .thenAnswer((_) async => Left(ServerFailure()));

      //act
      final result = await useCase(params);

      //assert
      expect(result, Left(ServerFailure()));
      verify(repository.{{name.camelCase()}}(params));
      verifyNoMoreInteractions(repository);
    });
  });
}
