import 'package:flutter_application_1/Layout/Cubit/searchState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../components/dio_helper.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit() : super((NewsSearchLoading()));

  static SearchCubit get(context) => BlocProvider.of(context);

   List<dynamic> search = [];
  void getSearch(value) {
    emit(NewsSearchLoading());
    DioHelper.getData(url: 'v2/everything', query: {
      'q': '$value',
      'apiKey': 'd5ec87b167e74fb2a8f7687eb0b0d798'
    }).then((value) {
      search = value.data["articles"];
      // print(business[1]['source']['id']);
      // print(business);
      emit(NewsSearchSuccess());
    }).catchError((Error) {
      emit(NewsSearchError(Error.toString())
          // print(NewsgetError(error.toString()))
          );
      print(Error.toString());
    });
  }
}
