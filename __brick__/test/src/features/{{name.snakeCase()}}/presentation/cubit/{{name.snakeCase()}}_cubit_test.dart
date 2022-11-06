import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:setu_farmer_app/src/core/error/failures.dart';
import 'package:setu_farmer_app/src/core/utils/failure_type.dart';
import 'package:setu_farmer_app/src/features/{{name.snakeCase()}}/domain/entities/{{name.snakeCase()}}_entity.dart';
import 'package:setu_farmer_app/src/features/{{name.snakeCase()}}/domain/usecases/{{name.snakeCase()}}_use_case.dart';
import 'package:setu_farmer_app/src/features/{{name.snakeCase()}}/presentation/cubit/{{name.snakeCase()}}_cubit.dart';

import '../../data/models/test_data_extension.dart';
import '{{name.snakeCase()}}_cubit_test.mocks.dart';

@GenerateMocks([{{name.pascalCase()}}UseCase])
void main() {
  late Mock{{name.pascalCase()}}UseCase {{name.camelCase()}}UseCase;
  late {{name.pascalCase()}}Cubit cubit;

  setUp(() {
    {{name.camelCase()}}UseCase = Mock{{name.pascalCase()}}UseCase();
    cubit = {{name.pascalCase()}}Cubit(
      {{name.camelCase()}}UseCase: {{name.camelCase()}}UseCase,
    );
  });

group('{{name.lowerCase()}}', () {

  const params = {{name.pascalCase()}}Params(
      id: 'id',
    );

  var entity = {{name.pascalCase()}}EntityTestData.create();

  test(
    'should return initial state',
    () => expect(cubit.state, {{name.pascalCase()}}Initial()),
  );

  blocTest(
    'should emit success states when method {{name.camelCase()}} called from usecase is successful',
    build: () => cubit,
    setUp: () {
      when({{name.camelCase()}}UseCase(params)).thenAnswer(
        (_) async => Right(
          entity,
        ),
      );
    },
    act: (_) {
      cubit.{{name.camelCase()}}(
        id: 'id',
      );
    },
    expect: () =>
    [
      {{name.pascalCase()}}Loading(),
      {{name.pascalCase()}}Loaded({{name.camelCase()}}Entity: entity),
    ],
  );
  blocTest(
    'should emit network failure states when there is no connection',
    build: () => cubit,
    setUp: () {
      when({{name.camelCase()}}UseCase(params)).thenAnswer(
        (_) async => Left(NoConnectionFailure()),
      );
    },
    act: (_) {
      cubit.{{name.camelCase()}}(
        id: 'id',
      );
    },
    expect: () => [
      {{name.pascalCase()}}Loading(),
      const {{name.pascalCase()}}Failed(FailureType.network),
    ],
  );
  blocTest(
    'should emit server failure states when exception returned from {{name.camelCase()}} method call',
    build: () => cubit,
    setUp: () {
      when({{name.camelCase()}}UseCase(params)).thenAnswer(
        (_) async => Left(ServerFailure()),
      );
    },
    act: (_) {
      cubit.{{name.camelCase()}}(
        id: 'id',
      );
    },
    expect: () => [
      {{name.pascalCase()}}Loading(),
      const {{name.pascalCase()}}Failed(FailureType.server),
    ],
  );
  });
}
