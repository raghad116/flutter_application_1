import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/Layout/components/components.dart';
import 'package:flutter_application_1/Modul/search.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Layout/Cubit/cubit.dart';
import '../Layout/Cubit/states.dart';

class NewsLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NewsCubit.get(context);
        return Scaffold(
          // backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text(
              'News App',
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    navigateTo(context, SearchScreen());
                  },
                  icon: Icon(Icons.search)),
              IconButton(
                icon: Icon(Icons.brightness_4_outlined),
                onPressed: () {
                  NewsCubit.get(context).changeMode();
                },
              )
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentInd,
            //selectedItemColor: Colors.amber,
            type: BottomNavigationBarType.fixed,
            items: cubit.Navigation,
            onTap: (index) {
              cubit.change(index);
              //هون وقت بكبس عالايقونات تبع ال navigation bar
              // if (index == 1) {
              //   print('hello');
              // }
            },
          ),
          body: cubit.Screens[cubit.currentInd],
          // floatingActionButton: FloatingActionButton(onPressed: () {
          //   cubit.getBusiness();
          // },
          // backgroundColor: Colors.red,
          // child: Icon(Icons.add),
          // ),
        );
      },
    );
  }
}
