import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Layout/Cubit/states.dart';
import 'package:flutter_application_1/Layout/components/dio_helper.dart';
import 'package:flutter_application_1/Modul/business.dart';
import 'package:flutter_application_1/Modul/scinece.dart';
import 'package:flutter_application_1/Modul/setting.dart';
import 'package:flutter_application_1/Modul/sports.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(InitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentInd = 0;

  List<BottomNavigationBarItem> Navigation = [
    BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Business'),
    BottomNavigationBarItem(icon: Icon(Icons.science), label: 'science'),
    BottomNavigationBarItem(icon: Icon(Icons.sports), label: 'sports'),
    BottomNavigationBarItem(
        icon: Icon(Icons.settings_input_antenna), label: 'settings'),
  ];
  List<Widget> Screens = [
    Businessscreen(),
    Scinecescreen(),
    SportScreen(),
    SettingScreen()
  ];
  void change(int ind) {
    currentInd = ind;
    // if (ind == 0) {
    //   print('hello again');
    // }
    emit(ChangeNav());
  }

  List<dynamic> business = [];
  void getBusiness() {
    emit(NewsgetLoading());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'business',
      'apiKey': 'd5ec87b167e74fb2a8f7687eb0b0d798'
    }).then((value) {
      business = value.data["articles"];
      print(business[1]['source']['id']);
      // print(business);
      emit(NewsgetSuccess());
    }).catchError((Error) {
      emit(NewsgetError(Error.toString())
          // print(NewsgetError(error.toString()))
          );
      print(Error.toString());
    });
  }

  List<dynamic> sports = [];
  void getsports() {
    emit(NewsSportsgetLoading());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'sports',
      'apiKey': 'd5ec87b167e74fb2a8f7687eb0b0d798'
    }).then((value) {
      sports = value.data["articles"];
      // print(business[1]['source']['id']);
      // print(business);
      emit(NewsSportsgetSuccess());
    }).catchError((Error) {
      emit(NewsSportsgetError(Error.toString())
          // print(NewsgetError(error.toString()))
          );
      print(Error.toString());
    });
  }

  List<dynamic> science = [];
  void getScince() {
    emit(NewsScincegetLoading());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'science',
      'apiKey': 'd5ec87b167e74fb2a8f7687eb0b0d798'
    }).then((value) {
      science = value.data["articles"];
      // print(business[1]['source']['id']);
      // print(business);
      emit(NewsScincegetSuccess());
    }).catchError((Error) {
      emit(NewsScincegetError(Error.toString())
          // print(NewsgetError(error.toString()))
          );
      print(Error.toString());
    });
  }

  void changeMode() {
    isDark = !isDark;
    print(isDark);

    emit(NewsChangeMode());
  }

  bool isDark = false;

  // List<dynamic> search = [];
  // void getSearch(value) {
  //   emit(NewsSearchLoading());
  //   DioHelper.getData(url: 'v2/everything', query: {
  //     'q': '$value',
  //     'apiKey': 'd5ec87b167e74fb2a8f7687eb0b0d798'
  //   }).then((value) {
  //     search = value.data["articles"];
  //     // print(business[1]['source']['id']);
  //     // print(business);
  //     emit(NewsSearchSuccess());
  //   }).catchError((Error) {
  //     emit(NewsSearchError(Error.toString())
  //         // print(NewsgetError(error.toString()))
  //         );
  //     print(Error.toString());
  //   });
  // }
}
