
import 'package:awesome_ayaflix/src/domain/entities/movie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:awesome_ayaflix/src/presentation/providers/movie_providers.dart';
import 'package:url_launcher/url_launcher.dart';

class MovieDetailsScreen extends ConsumerWidget {
  final int movieId;
  const MovieDetailsScreen({super.key, required this.movieId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movieDetails = ref.watch(movieDetailProvider(movieId));
    final movieCredits = ref.watch(movieCreditsProvider(movieId));
    final movieVideos = ref.watch(movieVideosProvider(movieId));
    final favoriteStatus = ref.watch(favoriteStatusProvider(movieId));

    return Scaffold(
      appBar: AppBar(
        title: movieDetails.when(
          data: (data) => Text(data.title),
          loading: () => const Text(''),
          error: (error, stackTrace) => const Text('Error'),
        ),
        actions: [
          favoriteStatus.when(
            data: (isFavorite) {
              return IconButton(
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: isFavorite ? Colors.red : null,
                ),
                onPressed: () {
                  movieDetails.whenData((details) {
                    ref.read(favoriteStatusProvider(movieId).notifier).toggleFavorite(
                          Movie(
                            id: details.id,
                            title: details.title,
                            overview: details.overview,
                            posterPath: details.posterPath,
                            backdropPath: details.backdropPath,
                            voteAverage: details.voteAverage,
                          ),
                        );
                  });
                },
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, stackTrace) => const Text('Error'),
          ),
        ],
      ),
      body: movieDetails.when(
        data: (details) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  'https://image.tmdb.org/t/p/w500${details.posterPath}',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 300,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        details.title,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.amber),
                          const SizedBox(width: 4),
                          Text(details.voteAverage.toStringAsFixed(1)),
                          const SizedBox(width: 16),
                          Text(details.releaseDate.substring(0, 4)),
                          const SizedBox(width: 16),
                          Text('${details.runtime} min'),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Text(details.overview),
                      const SizedBox(height: 16),
                      Text(
                        'Cast',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: 8),
                      movieCredits.when(
                        data: (cast) {
                          return SizedBox(
                            height: 120,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: cast.length,
                              itemBuilder: (context, index) {
                                final member = cast[index];
                                return SizedBox(
                                  width: 80,
                                  child: Column(
                                    children: [
                                      CircleAvatar(
                                        radius: 30,
                                        backgroundImage: member.profilePath != null
                                            ? NetworkImage(
                                                'https://image.tmdb.org/t/p/w200${member.profilePath}')
                                            : null,
                                        child: member.profilePath == null
                                            ? const Icon(Icons.person)
                                            : null,
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        member.name,
                                        textAlign: TextAlign.center,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          );
                        },
                        loading: () => const Center(child: CircularProgressIndicator()),
                        error: (error, stackTrace) => const Text('Failed to load cast'),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Trailers',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: 8),
                      movieVideos.when(
                        data: (videos) {
                          final trailers = videos
                              .where((video) => video.type == 'Trailer')
                              .toList();
                          return SizedBox(
                            height: 150,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: trailers.length,
                              itemBuilder: (context, index) {
                                final trailer = trailers[index];
                                return Card(
                                  child: InkWell(
                                    onTap: () async {
                                      final url = Uri.parse('https://www.youtube.com/watch?v=${trailer.key}');
                                      if (await canLaunchUrl(url)) {
                                        await launchUrl(url);
                                      }
                                    },
                                    child: Image.network(
                                      'https://img.youtube.com/vi/${trailer.key}/0.jpg',
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        },
                        loading: () => const Center(child: CircularProgressIndicator()),
                        error: (error, stackTrace) => const Text('Failed to load trailers'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(child: Text(error.toString())),
      ),
    );
  }
}
