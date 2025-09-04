import 'package:awesome_ayaflix/src/data/models/favorite_movie.dart';
import 'package:awesome_ayaflix/src/presentation/screens/movies_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

bool _hiveInitialized = false;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(FavoriteMovieAdapter());

  final isOpened = Hive.isBoxOpen('favorites');

  if (!isOpened) {
    await Hive.openBox<FavoriteMovie>('favorites');
  }

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ayaflix',
      theme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
      ),
      home: const MoviesScreen(),
    );
  }
}
