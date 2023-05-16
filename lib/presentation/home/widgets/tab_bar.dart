import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../buisness_logic/cubit/home_cubit.dart';

class BottomTabBar extends StatelessWidget {
  const BottomTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();
    return Flexible(
      child: TabBar(
        isScrollable: true,
        tabs: List.generate(cubit.tabItems.length, (index) {
          final current = cubit.tabItems[index];
          final isFirst = index == 0;

          return Tab(
            icon: isFirst ? const Icon(Icons.home) : null,
            text: isFirst ? null : current.name,
          );
        }).toList(),
      ),
    );
  }
}
