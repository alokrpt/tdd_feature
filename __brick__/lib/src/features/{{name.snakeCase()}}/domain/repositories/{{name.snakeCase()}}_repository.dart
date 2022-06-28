import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/{{name.snakeCase()}}_entity.dart';
import '../use_cases/{{name.snakeCase()}}_use_case.dart';

abstract class {{name.pascalCase()}}Repository {
  Future<Either<Failure, {{name.pascalCase()}}Entity>> {{name.camelCase()}}(
      {{name.pascalCase()}}Params params);
}
