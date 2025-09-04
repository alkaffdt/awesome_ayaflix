import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:awesome_ayaflix/src/presentation/providers/movie_providers.dart';
import 'package:awesome_ayaflix/src/presentation/screens/favorites_screen.dart';
import 'package:awesome_ayaflix/src/presentation/widgets/movie_card_widget.dart';
import 'package:awesome_ayaflix/src/presentation/widgets/movie_card_shimmer.dart';

class MoviesScreen extends ConsumerStatefulWidget {
  const MoviesScreen({super.key});

  @override
  ConsumerState<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends ConsumerState<MoviesScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _isLoadingMore = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() async {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      if (_isLoadingMore) return;

      setState(() {
        _isLoadingMore = true;
      });

      final searchQuery = ref.read(searchQueryProvider);
      if (searchQuery.isEmpty) {
        await ref.read(popularMoviesProvider.notifier).fetchNextPage();
      } else {
        await ref
            .read(searchMoviesProvider(searchQuery).notifier)
            .fetchNextPage(searchQuery);
      }

      setState(() {
        _isLoadingMore = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final searchQuery = ref.watch(searchQueryProvider);
    final movies = searchQuery.isEmpty
        ? ref.watch(popularMoviesProvider)
        : ref.watch(searchMoviesProvider(searchQuery));

    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            title: const Text('Ayaflix'),
            floating: true,
            pinned: true,
            snap: false,
            actions: [
              IconButton(
                icon: const Icon(Icons.favorite),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FavoritesScreen(),
                    ),
                  );
                },
              ),
            ],
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(kToolbarHeight),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  style: const TextStyle(color: Colors.black),
                  onChanged: (query) {
                    ref.read(searchQueryProvider.notifier).setQuery(query);
                  },
                  decoration: InputDecoration(
                    hintText: 'Search movies...',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
            ),
          ),
          movies.when(
            data: (movies) {
              return SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                ),
                delegate: SliverChildBuilderDelegate((context, index) {
                  if (index == movies.length) {
                    return _isLoadingMore
                        ? const Center(child: CircularProgressIndicator())
                        : const SizedBox.shrink();
                  }
                  final movie = movies[index];
                  return MovieCard(movie: movie);
                }, childCount: movies.length + 1),
              );
            },
            loading: () {
              return SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, index) => const MovieCardShimmer(),
                  childCount: 10,
                ),
              );
            },
            error: (error, stackTrace) {
              return SliverToBoxAdapter(
                child: Center(child: Text(error.toString())),
              );
            },
          ),
        ],
      ),
    );
  }
}
