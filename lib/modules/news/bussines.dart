
import 'package:api_new/Shared/compontents/components.dart';
import 'package:api_new/Shared/cubic/cubic.dart';
import 'package:api_new/Shared/cubic/states.dart';


import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list=NewsCubit.get(context).business;
        return articlebuilder(list,context);
      },
    );
  }
}
