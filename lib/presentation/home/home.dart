import 'package:coding_challenge_app/buisness_logic/cubit/home_cubit.dart';
import 'package:coding_challenge_app/presentation/home/widgets/card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repositories/soltana_repository.dart';
import '../card_full_screen/card_full_screen.dart';
import 'widgets/home_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (context) => HomeCubit(
        repository: RepositoryProvider.of<SoltanaRepository>(context),
      ),
      child: Builder(
        builder: (context) {
          final cubit = context.read<HomeCubit>();

          return SafeArea(
            child: DefaultTabController(
                length: cubit.tabItems.length,
                child: Scaffold(
                  drawer: const Drawer(),
                  appBar: const HomeAppBar(),
                  body: TabBarView(
                    children: cubit.tabItems.map((e) => e.screen).toList(),
                  ),
                )),
          );
        },
      ),
    );
  }
}
