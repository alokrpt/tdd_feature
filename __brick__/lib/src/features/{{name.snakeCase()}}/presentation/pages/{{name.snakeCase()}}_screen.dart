import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/extensions/context_extension.dart';
import '../../../../core/injector/injection_container.dart';
import '../../../../presentation/atoms/loader.dart';
import '../../../../presentation/custom_widgets/custom_sliver_appbar.dart';
import '../../../../presentation/molecules/failure_view.dart';
import '../cubit/{{name.snakeCase()}}_cubit.dart';
class {{name.pascalCase()}}Screen extends StatelessWidget {
  const {{name.pascalCase()}}Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          {{name.pascalCase()}}Cubit({{name.camelCase()}}UseCase: sl(),)..{{name.camelCase()}}(id: "demoId"),
      child: Scaffold(
        body: BlocBuilder<{{name.pascalCase()}}Cubit, {{name.pascalCase()}}State>(
          builder: (context, state) {
            return CustomScrollView(
              slivers: [
              const  CustomSliverAppBar(
                  title: "{{name.titleCase()}}",
                ),
                if (state is {{name.pascalCase()}}Loading)
                  sliverCenterLoader
                else if (state is {{name.pascalCase()}}Failed)
                  FailureView(
                    useSliver: true,
                    type: state.type,
                  )
                else if (state is {{name.pascalCase()}}Loaded)
                  SliverToBoxAdapter(
                    child: Column(
                      children: const [
                        // TODO: Insert your own widgets.
                      ]
                    ),
                  )
                else
                  const Text('Unexpected State')
              ],
            );
          },
        ),
      ),
    );
  }
}
