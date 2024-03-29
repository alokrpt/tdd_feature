import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/utils/failure_type.dart';
import '../../domain/entities/{{name.snakeCase()}}_entity.dart';
import '../../domain/usecases/{{name.snakeCase()}}_use_case.dart';

part '{{name.snakeCase()}}_state.dart';

class {{name.pascalCase()}}Cubit extends Cubit<{{name.pascalCase()}}State> {
  {{name.pascalCase()}}Cubit({required this.{{name.camelCase()}}UseCase,}) : super({{name.pascalCase()}}Initial());
  final {{name.pascalCase()}}UseCase {{name.camelCase()}}UseCase;

    Future<void> {{name.camelCase()}}({required String id}) async {
    emit({{name.pascalCase()}}Loading());
    final result = await {{name.camelCase()}}UseCase({{name.pascalCase()}}Params(id: id));
    result.fold(
        (failure) =>
            emit({{name.pascalCase()}}Failed(FailureTypeHelper.fromFailure(failure))),
        (entity) => emit({{name.pascalCase()}}Loaded({{name.camelCase()}}Entity: entity)));
  }
}
