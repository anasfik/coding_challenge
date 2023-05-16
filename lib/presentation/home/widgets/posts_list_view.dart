import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../buisness_logic/cubit/home_cubit.dart';
import '../../card_full_screen/card_full_screen.dart';
import 'card.dart';

class HomePostCardsListView extends StatelessWidget {
  const HomePostCardsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
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
                        builder: (_) => BlocProvider.value(
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
    );
  }
}
