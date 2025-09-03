
import 'package:awesome_ayaflix/src/data/datasources/remote/dio_client.dart';
import 'package:awesome_ayaflix/src/data/datasources/remote/movie_remote_data_source.dart';
import 'package:awesome_ayaflix/src/data/repositories/movie_repository_impl.dart';
import 'package:awesome_ayaflix/src/domain/entities/movie.dart';
import 'package:awesome_ayaflix/src/domain/repositories/movie_repository.dart';
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
MovieRepository movieRepository(ref) {
  return MovieRepositoryImpl(ref.watch(movieRemoteDataSourceProvider));
}

@riverpod
class PopularMovies extends _$PopularMovies {
  @override
  Future<List<Movie>> build() async {
    return _fetchPage(1);
  }

  Future<List<Movie>> _fetchPage(int page) {
    return ref.read(movieRepositoryProvider).getPopularMovies(page: page);
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

  Future<List<Movie>> _fetchPage(String query, int page) {
    return ref.read(movieRepositoryProvider).searchMovies(query, page: page);
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
