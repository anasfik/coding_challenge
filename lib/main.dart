import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'data/repositories/soltana_repository.dart';
import 'data/services/local.dart';
import 'presentation/home/home.dart';

Future<void> main() async {
  await LocalDatabase.instance.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => SoltanaRepository(),
      child: const MaterialApp(
        title: 'Cosing challeng',
        home: HomeScreen(),
      ),
    );
  }
}
