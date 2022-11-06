import 'package:setu_farmer_app/src/features/{{name.snakeCase()}}/data/models/{{name.snakeCase()}}_model.dart';
import 'package:setu_farmer_app/src/features/{{name.snakeCase()}}/domain/entities/{{name.snakeCase()}}_entity.dart';

extension {{name.pascalCase()}}EntityTestData on {{name.pascalCase()}}Entity {
  static {{name.pascalCase()}}Entity create() {
    return const {{name.pascalCase()}}Entity(
      id: "id",
    );
  }

  static {{name.pascalCase()}}Entity createModel() {
    return const {{name.pascalCase()}}Model(
      id: "id",
    );
  }
}
