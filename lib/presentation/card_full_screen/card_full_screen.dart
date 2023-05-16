import 'package:coding_challenge_app/data/models/soltana_model.dart';
import 'package:coding_challenge_app/presentation/card_full_screen/widgets/share_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../buisness_logic/cubit/home_cubit.dart';
import '../home/widgets/card.dart';
import '../home/widgets/widgets/app_bar.dart';
import 'content_text.dart';

class SoltanaPostFullScreen extends StatelessWidget {
  const SoltanaPostFullScreen({
    super.key,
    required this.post,
  });

  final SoltanaPost post;
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: context.read<HomeCubit>(),
      child: Scaffold(
        appBar: const SoltanaPostFullScreenAppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const SizedBox(height: 15),
              SoltanaPostCard(post: post),
              const ShareButtons(),
              const SizedBox(height: 30),
              SoltanaPostFullScreenText(content: post.content),
              const SizedBox(height: 15),
              const ShareButtons(),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
