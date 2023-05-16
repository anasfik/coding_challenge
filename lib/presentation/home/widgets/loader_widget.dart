import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../buisness_logic/cubit/home_cubit.dart';

class WidgetMeantForLoading extends StatelessWidget {
  const WidgetMeantForLoading({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();

    return GestureDetector(
      onTap: () {
        cubit.loadMorePosts();
      },
      child: Center(
        child: ClipOval(
          child: Container(
            height: 70.0,
            width: 70.0,
            color: Colors.grey.shade200,
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
