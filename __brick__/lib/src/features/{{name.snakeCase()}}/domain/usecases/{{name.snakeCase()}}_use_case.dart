import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/{{name.snakeCase()}}_entity.dart';
import '../repositories/{{name.snakeCase()}}_repository.dart';

class {{name.pascalCase()}}UseCase
    implements UseCase<{{name.pascalCase()}}Entity, {{name.pascalCase()}}Params> {
  final {{name.pascalCase()}}Repository repository;

  {{name.pascalCase()}}UseCase(this.repository);

  @override
  Future<Either<Failure, {{name.pascalCase()}}Entity>> call(
      {{name.pascalCase()}}Params params) async {
    return await repository.{{name.camelCase()}}(params);
  }
}

class {{name.pascalCase()}}Params extends Equatable {
  final String id;

  const {{name.pascalCase()}}Params(this.id);

  @override
  List<Object?> get props => [id];
}
