import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/status.dart';
import 'package:news_app/shared/Components.dart';

class searchscreen extends StatelessWidget {
  var Searchcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<newcubit,NewStates>(
     listener:(context,state){} ,
      builder: (context,state) {
       var list =newcubit.get(context).search;
       return Scaffold(
          appBar: AppBar(

          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: defaultFormField(
                    controller: Searchcontroller,
                    onChange: (value) {
                     newcubit.get(context).getresualtofsearch(value);
                    },
                    type: TextInputType.text,
                    prefixIcon: Icons.search,
                    label: 'Search',
                    validator: (String? value) {
                      if (value!.isEmpty) return 'Search must not be empty';
                       return null;
                    }, suffixIcon: Icons.search, text: 'Search'),
              ),
              Expanded(child: articleBuilder(list, context ,issearch: true),),
            ],
          )
        );
      }
    );
  }
}
