import '../../domain/entities/{{name.snakeCase()}}_entity.dart';

class {{name.pascalCase()}}Model extends {{name.pascalCase()}}Entity {
  const {{name.pascalCase()}}Model({
    required String id,
  }) : super(
          id:id,
        );

  factory {{name.pascalCase()}}Model.fromJson(Map<String, dynamic> json){
    return {{name.pascalCase()}}Model(
      id: json['id']
    );
  }    
}
