import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/Layout/Cubit/states.dart';
import 'package:flutter_application_1/Layout/components/components.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Layout/Cubit/cubit.dart';

class Businessscreen extends StatelessWidget {
  const Businessscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var lis = NewsCubit.get(context).business;
          return articalItem(lis,context);
        });
  }
}
