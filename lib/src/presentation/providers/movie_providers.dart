import 'package:awesome_ayaflix/src/data/datasources/local/movie_local_data_source.dart';
import 'package:awesome_ayaflix/src/data/datasources/remote/dio_client.dart';
import 'package:awesome_ayaflix/src/data/datasources/remote/movie_remote_data_source.dart';
import 'package:awesome_ayaflix/src/data/repositories/movie_repository_impl.dart';
import 'package:awesome_ayaflix/src/domain/entities/cast.dart';
import 'package:awesome_ayaflix/src/domain/entities/movie.dart';
import 'package:awesome_ayaflix/src/domain/entities/movie_detail.dart';
import 'package:awesome_ayaflix/src/domain/entities/video.dart';
import 'package:awesome_ayaflix/src/domain/repositories/movie_repository.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movie_providers.g.dart';

@riverpod
DioClient dioClient(ref) {
  return DioClient();
}

@riverpod
MovieRemoteDataSource movieRemoteDataSource(ref) {
  return MovieRemoteDataSourceImpl(ref.watch(dioClientProvider));
}

@riverpod
MovieLocalDataSource movieLocalDataSource(ref) {
  return MovieLocalDataSourceImpl(Hive.box('favorites'));
}

@riverpod
MovieRepository movieRepository(ref) {
  return MovieRepositoryImpl(
    ref.watch(movieRemoteDataSourceProvider),
    ref.watch(movieLocalDataSourceProvider),
  );
}

@riverpod
Future<MovieDetail> movieDetail(ref, int movieId) {
  return ref.watch(movieRepositoryProvider).getMovieDetail(movieId);
}

@riverpod
Future<List<Cast>> movieCredits(ref, int movieId) {
  return ref.watch(movieRepositoryProvider).getMovieCredits(movieId);
}

@riverpod
Future<List<Video>> movieVideos(ref, int movieId) {
  return ref.watch(movieRepositoryProvider).getMovieVideos(movieId);
}

@riverpod
class PopularMovies extends _$PopularMovies {
  @override
  Future<List<Movie>> build() async {
    return _fetchPage(1);
  }

  Future<List<Movie>> _fetchPage(int page) async {
    final result = await ref
        .read(movieRepositoryProvider)
        .getPopularMovies(page: page);
    return result.fold((failure) => [], (movies) => movies);
  }

  Future<void> fetchNextPage() async {
    final page = state.value!.length ~/ 20 + 1;
    final newMovies = await _fetchPage(page + 1);
    state = AsyncData([...state.value!, ...newMovies]);
  }
}

@riverpod
class SearchMovies extends _$SearchMovies {
  @override
  Future<List<Movie>> build(String query) async {
    if (query.isEmpty) {
      return [];
    }
    return _fetchPage(query, 1);
  }

  Future<List<Movie>> _fetchPage(String query, int page) async {
    final result = await ref
        .read(movieRepositoryProvider)
        .searchMovies(query, page: page);
    return result.fold((failure) => [], (movies) => movies);
  }

  Future<void> fetchNextPage(String query) async {
    final page = state.value!.length ~/ 20 + 1;
    final newMovies = await _fetchPage(query, page + 1);
    state = AsyncData([...state.value!, ...newMovies]);
  }
}

@riverpod
class SearchQuery extends _$SearchQuery {
  @override
  String build() => '';

  void setQuery(String query) => state = query;
}

@riverpod
Future<List<Movie>> favoriteMovies(ref) {
  return ref.watch(movieRepositoryProvider).getFavoriteMovies();
}

@riverpod
class FavoriteStatus extends _$FavoriteStatus {
  @override
  Future<bool> build(int movieId) async {
    final result = await ref
        .read(movieRepositoryProvider)
        .isMovieFavorite(movieId);
    return result.fold((failure) => false, (isFav) => isFav);
  }

  Future<void> toggleFavorite(Movie movie) async {
    final result = await ref
        .read(movieRepositoryProvider)
        .isMovieFavorite(movie.id);
    final isFav = result.fold((failure) => false, (isFav) => isFav);
    if (isFav) {
      await ref
          .read(movieRepositoryProvider)
          .removeMovieFromFavorites(movie.id);
    } else {
      await ref.read(movieRepositoryProvider).addMovieToFavorites(movie);
    }
    state = AsyncData(!isFav);
    ref.invalidate(favoriteMoviesProvider);
  }
}
