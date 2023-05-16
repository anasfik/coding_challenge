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
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: MaterialApp(
          theme: theme,
          title: 'Coding challenge',
          home: const HomeScreen(),
          builder: (context, child) {
            return Directionality(
              textDirection: TextDirection.rtl,
              child: child!,
            );
          },
        ),
      ),
    );
  }
}

final theme = ThemeData.from(
  colorScheme: const ColorScheme.light(
    primary: Colors.purple,
    secondary: Colors.purpleAccent,
  ),
).copyWith(
  appBarTheme: const AppBarTheme(
    elevation: 0.0,
    backgroundColor: Colors.transparent,
  ),
  tabBarTheme: const TabBarTheme(
    indicatorColor: Colors.transparent,
    indicator: null,
  ),
);
