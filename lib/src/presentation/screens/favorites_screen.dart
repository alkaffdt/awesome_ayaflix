
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

    return favoriteMovies.when(
      data: (movies) {
        if (movies.isEmpty) {
          return const Center(
            child: Text('No favorite movies yet.'),
          );
        }
        return LayoutBuilder(
          builder: (context, constraints) {
            final crossAxisCount = (constraints.maxWidth / 180).floor();
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                childAspectRatio: 0.7,
              ),
              itemCount: movies.length,
              itemBuilder: (context, index) {
                final movie = movies[index];
                return MovieCard(movie: movie);
              },
            );
          },
        );
      },
      loading: () {
        return LayoutBuilder(
          builder: (context, constraints) {
            final crossAxisCount = (constraints.maxWidth / 180).floor();
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                childAspectRatio: 0.7,
              ),
              itemCount: 10,
              itemBuilder: (context, index) => const MovieCardShimmer(),
            );
          },
        );
      },
      error: (error, stackTrace) => Center(child: Text(error.toString())),
    );
  }
}
