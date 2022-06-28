import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/utils/failure_type.dart';
import '../../domain/entities/{{name.snakeCase()}}_entity.dart';
import '../../domain/use_cases/{{name.snakeCase()}}_use_case.dart';

part '{{name.snakeCase()}}_state.dart';

class {{name.pascalCase()}}Cubit extends Cubit<{{name.pascalCase()}}State> {
  {{name.pascalCase()}}Cubit(this.useCase) : super({{name.pascalCase()}}Initial());
  final {{name.pascalCase()}}UseCase useCase;

    Future<void> {{name.camelCase()}}({required String id}) async {
    emit({{name.pascalCase()}}Loading());
    final result = await useCase({{name.pascalCase()}}Params(id));
    result.fold(
        (failure) =>
            emit({{name.pascalCase()}}Failed(FailureTypeHelper.fromFailure(failure))),
        (entity) => emit({{name.pascalCase()}}Success({{name.camelCase()}}Entity: entity)));
  }
}
