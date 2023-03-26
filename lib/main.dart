import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/Layout/components/cacheHelper.dart';
import 'package:flutter_application_1/Layout/components/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Layout/Cubit/SearchCubit.dart';
import 'Layout/Cubit/cubit.dart';
import 'Layout/Cubit/states.dart';
import 'Layout/components/bloc_observer.dart';
import 'Layout/components/theme.dart';
import 'Modul/home_layout.dart';
import 'Modul/onBoard.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await DioHelper.init();
 //await CacheHelper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return
         MultiBlocProvider(
          providers: [
             BlocProvider(create: (BuildContext context)=>NewsCubit() ..getBusiness()
              ..getScince()
              ..getsports(),),
                BlocProvider(create: (BuildContext context)=>SearchCubit())
          ],
       
            child: BlocConsumer<NewsCubit, NewsStates>(
                listener: (context, state) {},
                builder: (context, state) {
                  return MaterialApp(
                      theme: light,
                      ////////  themeMode: NewsCubit.get(context).isDark,
                      darkTheme: dark,
                      themeMode: NewsCubit.get(context).isDark
                          ? ThemeMode.dark
                          : ThemeMode.light,
                      debugShowCheckedModeBanner: false,
                      home: OnBoarding());
                }));
  }
}
