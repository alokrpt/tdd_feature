part of '{{name.snakeCase()}}_cubit.dart';

abstract class {{name.pascalCase()}}State extends Equatable {
  const {{name.pascalCase()}}State();
  
  @override
  List<Object> get props => [];
}

class {{name.pascalCase()}}Initial extends {{name.pascalCase()}}State {}

class {{name.pascalCase()}}Loading extends {{name.pascalCase()}}State {}

class {{name.pascalCase()}}Success extends {{name.pascalCase()}}State {
    final {{name.pascalCase()}}Entity {{name.camelCase()}}Entity;

    const {{name.pascalCase()}}Success({required this.{{name.camelCase()}}Entity});

      @override
  List<Object> get props => [{{name.camelCase()}}Entity];
}

class {{name.pascalCase()}}Failed extends {{name.pascalCase()}}State {
    final FailureType type;

    const {{name.pascalCase()}}Failed(this.type);

    @override
    List<Object> get props => [type];
}
