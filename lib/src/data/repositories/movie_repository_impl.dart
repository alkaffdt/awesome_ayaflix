
import 'package:awesome_ayaflix/src/data/datasources/remote/movie_remote_data_source.dart';
import 'package:awesome_ayaflix/src/data/models/movie_model.dart';
import 'package:awesome_ayaflix/src/domain/entities/movie.dart';
import 'package:awesome_ayaflix/src/domain/repositories/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource remoteDataSource;

  MovieRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<Movie>> getPopularMovies({int page = 1}) async {
    final movieModels = await remoteDataSource.getPopularMovies(page: page);
    final movies = movieModels.map((model) => model.toEntity()).toList();
    return movies;
  }

  @override
  Future<List<Movie>> searchMovies(String query, {int page = 1}) async {
    final movieModels = await remoteDataSource.searchMovies(query, page: page);
    final movies = movieModels.map((model) => model.toEntity()).toList();
    return movies;
  }
}
