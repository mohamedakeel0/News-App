import 'dart:io';

import 'package:api_new/Netwok/local/cache_helper.dart';
import 'package:api_new/Netwok/remot/dio_helper.dart';
import 'package:api_new/Shared/cubic_to_mode/states.dart';


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Shared/cubic/cubic.dart';
import 'Shared/cubic_to_mode/cubic.dart';
import 'Shared/shared/bloc_Observer/blocObserver.dart';

import 'layout/News_layout.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences.getInstance();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
 late bool? isDark = CacheHelper.getboolean(key: 'isdark');
  if (isDark ==null)
    isDark=true;
  runApp(MyApp(isDark:isDark ,));
}

class MyApp extends StatelessWidget {
  late bool isDark;

  MyApp({required  this.isDark});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NewsCubit()
            ..getBusiness()
            ..getSports()
            ..getScience(),
        ),
        BlocProvider(
          create: (context) => AppCubit()..changeAppmode(fromshared: isDark),
        )
      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                primarySwatch: Colors.orange,
                floatingActionButtonTheme: FloatingActionButtonThemeData(
                  backgroundColor: Colors.orange,
                ),
                appBarTheme: AppBarTheme(
                    titleSpacing: 20,
                    backgroundColor: Colors.white,
                    backwardsCompatibility: false,
                    elevation: 0.0,
                    systemOverlayStyle:
                        SystemUiOverlayStyle(statusBarColor: Colors.red),
                    titleTextStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                    iconTheme: IconThemeData(color: Colors.black)),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                    backgroundColor: Colors.white,
                    type: BottomNavigationBarType.fixed,
                    selectedItemColor: Colors.orange,
                    unselectedItemColor: Colors.grey,
                    elevation: 30),
                textTheme: TextTheme(
                    bodyText1: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.black)),
                scaffoldBackgroundColor: Colors.white),
            home: NewsLayout(),
            darkTheme: ThemeData(
                primarySwatch: Colors.orange,
                floatingActionButtonTheme: FloatingActionButtonThemeData(
                  backgroundColor: Colors.orange,
                ),
                appBarTheme: AppBarTheme(
                    titleSpacing: 20,
                    backgroundColor: HexColor('#033E3E'),
                    backwardsCompatibility: false,
                    elevation: 0.0,
                    systemOverlayStyle: SystemUiOverlayStyle(
                        statusBarColor: HexColor('#033E3E'),
                        statusBarBrightness: Brightness.light),
                    titleTextStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                    iconTheme: IconThemeData(color: Colors.white)),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                    backgroundColor: HexColor('#033E3E'),
                    type: BottomNavigationBarType.fixed,
                    selectedItemColor: Colors.orange,
                    unselectedItemColor: Colors.grey,
                    elevation: 30),
                textTheme: TextTheme(
                    bodyText1: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.white)),
                scaffoldBackgroundColor: HexColor('#033E3E')),
            themeMode:
                AppCubit.get(context).isdark ? ThemeMode.dark : ThemeMode.light,
          );
        },
      ),
    );
  }
}
