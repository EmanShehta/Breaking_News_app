import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/status.dart';
import 'package:news_app/shared/Components.dart';

class sportssscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<newcubit,NewStates>(
      listener: (context,state){},
      builder: (context,state){
        var  list=newcubit.get(context).sports;
        return articleBuilder(list,context);
      },
    );
  }
}



