import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../buisness_logic/cubit/home_cubit.dart';

class BottomTabBar extends StatelessWidget {
  const BottomTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();
    return SizedBox(
      height: 45,
      child: TabBar(
        indicator: null,
        indicatorColor: Colors.transparent,
        isScrollable: true,
        tabs: List.generate(cubit.tabItems.length, (index) {
          final current = cubit.tabItems[index];
          final isFirst = index == 0;

          return Container(
            child: Tab(
              child: isFirst
                  ? const Icon(
                      Icons.home,
                      size: 20,
                    )
                  : Text(
                      current.name,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
