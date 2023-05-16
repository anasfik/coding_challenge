import 'package:coding_challenge_app/buisness_logic/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repositories/soltana_repository.dart';
import 'widgets/home_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: BlocProvider<HomeCubit>(
        create: (context) => HomeCubit(
          repository: RepositoryProvider.of<SoltanaRepository>(context),
        ),
        child: SafeArea(
          child: Scaffold(
            drawer: Drawer(),
            appBar: const HomeAppBar(),
            body: const Center(
              child: Text('Hello world'),
            ),
          ),
        ),
      ),
    );
  }
}
