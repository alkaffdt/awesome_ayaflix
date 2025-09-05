import 'package:awesome_ayaflix/src/presentation/screens/movies_screen/widgets/movie_screen_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:awesome_ayaflix/src/presentation/providers/movie_providers.dart';

import 'package:awesome_ayaflix/src/presentation/widgets/movie_card_widget.dart';
import 'package:awesome_ayaflix/src/presentation/widgets/movie_card_shimmer.dart';

class MoviesScreen extends ConsumerStatefulWidget {
  const MoviesScreen({super.key});

  @override
  MoviesScreenState createState() => MoviesScreenState();
}

class MoviesScreenState extends ConsumerState<MoviesScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _isLoadingMore = false;

  ScrollController get scrollController => _scrollController;

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

    return LayoutBuilder(builder: (context, constraints) {
      final crossAxisCount = (constraints.maxWidth / 180).floor();
      return CustomScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        controller: _scrollController,
        slivers: [
          movies.when(
            data: (movies) {
              return SliverGrid.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  childAspectRatio: 0.7,
                ),
                itemBuilder: (context, index) {
                  if (index == movies.length) {
                    return _isLoadingMore
                        ? const Center(child: CircularProgressIndicator())
                        : const SizedBox.shrink();
                  }
                  final movie = movies[index];
                  return MovieCard(movie: movie);
                },
                itemCount: movies.length + 1,
              );
            },
            loading: () {
              return SliverGrid.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  childAspectRatio: 0.7,
                ),
                itemBuilder: (context, index) => const MovieCardShimmer(),
                itemCount: 10,
              );
            },
            error: (error, stackTrace) {
              return SliverToBoxAdapter(
                child: Center(child: Text(error.toString())),
              );
            },
          ),
        ],
      );
    });
  }
}
