import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_1/Layout/Cubit/cubit.dart';
import 'package:flutter_application_1/Layout/Cubit/states.dart';
import 'package:flutter_application_1/Layout/components/components.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Layout/Cubit/SearchCubit.dart';
import '../Layout/Cubit/searchState.dart';

class SearchScreen extends StatelessWidget {
  var Searchcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, SearchStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var list = SearchCubit.get(context).search;
          return Scaffold(
            appBar: AppBar(),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: defaultTextFormField(
                      controller: Searchcontroller,
                      type: TextInputType.text,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return "Search must not be empty!!";
                        }
                      },
                      label: 'search',
                      f: (value) {
                        SearchCubit.get(context).getSearch(value);
                        print(
                            "#################${SearchCubit.get(context).search}");
                      },
                      icon: Icons.search),
                ),
                Expanded(child: articalItem(list, context))
              ],
            ),
          );
        });
  }
}
