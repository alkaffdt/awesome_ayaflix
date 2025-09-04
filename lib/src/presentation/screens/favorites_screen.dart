
import 'package:awesome_ayaflix/src/presentation/widgets/movie_card_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:awesome_ayaflix/src/presentation/providers/movie_providers.dart';
import 'package:awesome_ayaflix/src/presentation/widgets/movie_card_widget.dart';

class FavoritesScreen extends ConsumerWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteMovies = ref.watch(favoriteMoviesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Movies'),
      ),
      body: favoriteMovies.when(
        data: (movies) {
          if (movies.isEmpty) {
            return const Center(
              child: Text('No favorite movies yet.'),
            );
          }
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.7,
            ),
            itemCount: movies.length,
            itemBuilder: (context, index) {
              final movie = movies[index];
              return MovieCard(movie: movie);
            },
          );
        },
        loading: () {
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.7,
            ),
            itemCount: 10,
            itemBuilder: (context, index) => const MovieCardShimmer(),
          );
        },
        error: (error, stackTrace) => Center(child: Text(error.toString())),
      ),
    );
  }
}
