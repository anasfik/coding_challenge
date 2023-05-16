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
      child: SafeArea(
        child: Scaffold(
          drawer: const Drawer(),
          appBar: const HomeAppBar(),
          body: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              final cubit = context.read<HomeCubit>();

              if (state.hasError) {
                return const Center(
                  child: Icon(Icons.error),
                );
              } else {
                final posts = state.posts;
                return ListView.builder(
                  itemCount: posts.length,
                  controller: cubit.scrollController,
                  itemBuilder: (context, index) {
                    final current = posts[index];

                    return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => BlocProvider.value(
                                value: cubit,
                                child: SoltanaPostFullScreen(post: current),
                              ),
                            ),
                          );
                        },
                        child: SoltanaPostCard(post: current));
                  },
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
