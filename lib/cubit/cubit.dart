
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/status.dart';
import 'package:news_app/modules/science/science.dart';
import 'package:news_app/modules/settings/settings.dart';
import 'package:news_app/modules/sports/sports.dart';
import 'package:news_app/network/local/cachehelper.dart';
import 'package:news_app/network/remote/dio_helper.dart';

import '../modules/business/business.dart';

class  newcubit extends Cubit<NewStates> {
  newcubit() : super(NewInitialState());
  static newcubit get(context) => BlocProvider.of(context);
  int currentidx=0;
  List <BottomNavigationBarItem> bottomitems=[
    BottomNavigationBarItem(icon:Icon( Icons.business_outlined),label:'Business' ),
    BottomNavigationBarItem(icon:Icon( Icons.sports_baseball),label:'Sports'),
    BottomNavigationBarItem(icon:Icon( Icons.science_outlined),label: 'Science'),
  ];
  void chanegebottomnavbar (int index)
  {
    currentidx=index;
    if(index==1)
      {
        getsports();
      }
    if(index==2)
      {
        getscience();
      }
    emit(NewBottomnav());
  }
  List<Widget>screens=[
    businessscreen(),
    sportssscreen(),
    sciencesscreen(),
  ];
  List <dynamic>Business =[];
  void getBusiness (){
    emit(NewsGetbussinessLoadingStates());
    DioHelper.getdata(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'business',
        'apiKey': '113d674c0e024c219734dbef88a486f3',
      },
    ).then((value) {
      print(value.data['articles'][0]['title']);
      Business=value.data['articles'];
      print(Business[0]['title']);
      emit(NewsgetbussinessSuccessStates());
    }).catchError((error)
    {
      print(error.toString());
      emit(NewsgetbussinessErrorStates(error));
    });
  }
  List <dynamic>sports =[];
  void getsports (){
    emit(NewsGetsportLoadingStates());
    if( sports.length==0)
      {
        DioHelper.getdata(
          url: 'v2/top-headlines',
          query: {
            'country': 'eg',
            'category': 'sports',
            'apiKey': '113d674c0e024c219734dbef88a486f3',
          },
        ).then((value) {
          print(value.data['articles'][0]['title']);
          sports=value.data['articles'];
          print(sports[0]['title']);
          emit(NewsgetsportSuccessStates());
        }).catchError((error)
        {
          print(error.toString());
          emit(NewsgetsportErrorStates(error));
        });
      }
    else
      {
        emit(NewsgetsportSuccessStates());
      }

  }
  bool isDark=true;
  void ChangeAppMode({bool? fromShared}){
    if (fromShared!=null)
      {
        isDark=fromShared;
        emit(AppchangemodeStates());
      }
    else {
      isDark =!isDark;
      CahceHelper.PutData(Key: 'isDark', Value: isDark).then((value) {
        emit(AppchangemodeStates());
      });
    }
  }
  List <dynamic>science =[];
  void getscience () {
    emit(NewsGetscienceLoadingStates());
    if (science.length == 0) {
      DioHelper.getdata(
        url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'science',
          'apiKey': '113d674c0e024c219734dbef88a486f3',
        },
      ).then((value) {
        print(value.data['articles'][0]['title']);
        science = value.data['articles'];
        print(science[0]['title']);
        emit(NewsgetscienceSuccessStates());
      }).catchError((error) {
        print(error.toString());
        emit(NewsgetscienceErrorStates(error));
      });
    }
    else {
      emit(NewsgetscienceSuccessStates());
    }
  }
  List <dynamic>search =[];
  void getresualtofsearch(String value ) {
    emit(NewsGetscearchLoadingStates());
    search = [];
    DioHelper.getdata(
      url: 'v2/everything',
      query: {
        'q': '$value',
        'apiKey': '113d674c0e024c219734dbef88a486f3',
      },
    ).then((value) {
      print(value.data['articles'][0]['title']);
      search = value.data['articles'];
      print(search[0]['title']);
      emit(NewsgetscearchSuccessStates());
    }).catchError((error) {
      print(error.toString());
      emit(NewsgetscearchErrorStates(error));
    });

  }
}