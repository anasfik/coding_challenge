import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../buisness_logic/cubit/home_cubit.dart';
import 'tab_bar.dart';
import 'top_bar.dart';

class HomeAppBar extends StatelessWidget with PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();
    return Theme(
      data: Theme.of(context).copyWith(
        appBarTheme: const AppBarTheme(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
        ),
        tabBarTheme: const TabBarTheme(
          indicatorColor: Colors.transparent,
          indicator: null,
        ),
      ),
      child: DefaultTabController(
        length: cubit.tabItems.length,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: <Color>[
                Colors.purple,
                Colors.purple.shade900,
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
          ),
          child: Column(
            children: const <Widget>[
              SizedBox(height: 7.5),
              TopBar(),
              Spacer(),
              BottomTabBar(),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(130);
}
