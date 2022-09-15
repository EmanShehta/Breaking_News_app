import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/network/remote/dio_helper.dart';
import 'package:news_app/shared/Components.dart';

import 'cubit/status.dart';
import 'modules/search/search.dart';

class news_layout extends StatelessWidget {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<newcubit, NewStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = newcubit.get(context);
            return Scaffold(
              appBar: AppBar(
                title: Text('News App'),
                actions: [
                  IconButton(onPressed: () {
                    navigateTo(context, searchscreen(),);
                  }, icon: Icon(Icons.search)),
                  IconButton(
                    onPressed: () {
                      cubit.ChangeAppMode();
                    },
                    icon: Icon(Icons.brightness_2_rounded),),],
              ),
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: cubit.currentidx,
                onTap: (index) {
                  cubit.chanegebottomnavbar(index);
                },
                items: cubit.bottomitems,
              ),
              body: cubit.screens[cubit.currentidx],
            );
          });
  }
}
