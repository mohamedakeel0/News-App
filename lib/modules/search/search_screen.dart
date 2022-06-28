import 'package:api_new/Shared/compontents/components.dart';
import 'package:api_new/Shared/cubic/cubic.dart';
import 'package:api_new/Shared/cubic/states.dart';


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Searchscreen extends StatelessWidget {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(listener: (context, state) {

    },builder: (context, state) {

var list=NewsCubit.get(context).Search;
      return  Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: defaultFormField(
                  controller: searchController,
                  type: TextInputType.text,
                  change: (value) {
                    NewsCubit.get(context).getSearch(value);
                  },
                  validate: (value) {
                    if (value.isEmpty) {
                      return 'search must not empty';
                    }
                    return null;
                  },
                  label: 'search',
                  prefix: Icons.search),
            ),
            Expanded(child: articlebuilder(list, context,isSearch: true)),
          ],
        ),
      );
    },

    );
  }
}
