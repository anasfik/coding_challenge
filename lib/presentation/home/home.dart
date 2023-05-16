import 'package:coding_challenge_app/buisness_logic/cubit/home_cubit.dart';
import 'package:coding_challenge_app/presentation/home/widgets/card.dart';
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
            drawer: const Drawer(),
            appBar: const HomeAppBar(),
            body: BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                if (state.hasError) {
                  return const Center(
                    child: Icon(Icons.error),
                  );
                } else if (state.isFetching) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  final posts = state.posts;
                  return ListView.builder(
                    itemCount: posts.length,
                    itemBuilder: (context, index) {
                      final current = posts[index];

                      return SoltanaPostCard(post: current);
                    },
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
