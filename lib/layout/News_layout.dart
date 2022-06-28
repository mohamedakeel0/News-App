import 'package:api_new/Netwok/remot/dio_helper.dart';
import 'package:api_new/Shared/compontents/components.dart';
import 'package:api_new/Shared/cubic/cubic.dart';
import 'package:api_new/Shared/cubic/states.dart';
import 'package:api_new/Shared/cubic_to_mode/cubic.dart';
import 'package:api_new/modules/search/search_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text('News App'),
            actions: [IconButton(onPressed: () {
              navigateTo(context,Searchscreen());


            }, icon: Icon(Icons.search)),IconButton(onPressed: () {
        AppCubit.get(context).changeAppmode();

            }, icon: Icon(Icons.brightness_4_outlined))],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {

            },
            child: Icon(Icons.add),
          ),
          body: cubit.screens[cubit.currentindex],
          bottomNavigationBar: BottomNavigationBar(
            items: cubit.bottomItem,
            currentIndex: cubit.currentindex,
            onTap: (index) {
              cubit.changeBottomNavBar(index);
            },
          ),
        );
      },
    );
  }
}
