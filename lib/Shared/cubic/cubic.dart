

import 'package:api_new/Netwok/remot/dio_helper.dart';
import 'package:api_new/Shared/cubic/states.dart';


import 'package:api_new/modules/news/bussines.dart';
import 'package:api_new/modules/news/science.dart';
import 'package:api_new/modules/news/sports.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);
  int currentindex = 0;
  List<BottomNavigationBarItem>bottomItem = [
    BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Business'),
    BottomNavigationBarItem(icon: Icon(Icons.sports), label: 'Sports'),
    BottomNavigationBarItem(icon: Icon(Icons.science), label: 'Science'),

  ];
  void changeBottomNavBar(int index){
    currentindex=index;
    if(index==1)
      getSports();
    if(index==2)
      getScience();
    emit(NewBottomNavState());
  }
  List <Widget> screens=[
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
  ];
  List<dynamic>business=[];
  void getBusiness(){
    emit(NewBusinessLoadingState());
    if(business.length==0){
      DioHelper.getdata(url: 'v2/top-headlines', query: {
        'country': 'eg',
        'category': 'business',
        'apiKey': 'd3ff9531db714781936b4b3bc81e0a38',
      }).then((value) {
        //  print(value.data['articles'][0]['title']);
        business=value.data['articles'];
        print(business[0]['title']);
        emit(NewGetBusinessSuccessState());
      }).catchError((error){
        print(error.toString());
        emit(NewGetBusinessErrorState(error.toString()));
      });}else{
      emit(NewGetBusinessSuccessState());
    }
  }
  List<dynamic>Science=[];
  void getScience(){
    emit(NewScienceLoadingState());
    if(Science.length==0){ DioHelper.getdata(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'science',
      'apiKey': 'd3ff9531db714781936b4b3bc81e0a38',
    }).then((value) {
      //  print(value.data['articles'][0]['title']);
      Science=value.data['articles'];
      print(Science[0]['title']);
      emit(NewGetScienceSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(NewGetScienceErrorState(error.toString()));
    });}else{ emit(NewGetScienceSuccessState());}
  }
  List<dynamic>Sports=[];
  void getSports(){
    emit(NewSportsLoadingState());
    if(Sports.length==0){DioHelper.getdata(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'sports',
      'apiKey': 'd3ff9531db714781936b4b3bc81e0a38',
    }).then((value) {
      //  print(value.data['articles'][0]['title']);
      Sports=value.data['articles'];
      print(Sports[0]['title']);
      emit(NewGetSportsSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(NewGetSportsErrorState(error.toString()));
    });}else{emit(NewGetSportsSuccessState());}
  }
  List<dynamic>Search=[];
  void getSearch(String value){
    emit(NewSearchLoadingState());
    Search=[];
    if(Search.length==0){ DioHelper.getdata(url: 'v2/everything', query: {
      'q': '${value}',
      'apiKey': 'd3ff9531db714781936b4b3bc81e0a38',
    }).then((value) {
      //  print(value.data['articles'][0]['title']);
      Search=value.data['articles'];
      print(  Search[0]['title']);
      emit(NewGetSearchSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(NewGetSearchErrorState(error.toString()));
    });}else{ emit(NewGetSearchSuccessState());}
  }
}


