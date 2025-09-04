
import 'package:awesome_ayaflix/src/data/datasources/local/movie_local_data_source.dart';
import 'package:awesome_ayaflix/src/data/datasources/remote/movie_remote_data_source.dart';
import 'package:awesome_ayaflix/src/data/models/cast_model.dart';
import 'package:awesome_ayaflix/src/data/models/favorite_movie.dart';
import 'package:awesome_ayaflix/src/data/models/movie_detail_model.dart';
import 'package:awesome_ayaflix/src/data/models/movie_model.dart';
import 'package:awesome_ayaflix/src/data/models/video_model.dart';
import 'package:awesome_ayaflix/src/domain/entities/cast.dart';
import 'package:awesome_ayaflix/src/domain/entities/movie.dart';
import 'package:awesome_ayaflix/src/domain/entities/movie_detail.dart';
import 'package:awesome_ayaflix/src/domain/entities/video.dart';
import 'package:awesome_ayaflix/src/domain/repositories/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource remoteDataSource;
  final MovieLocalDataSource localDataSource;

  MovieRepositoryImpl(this.remoteDataSource, this.localDataSource);

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

  @override
  Future<MovieDetail> getMovieDetail(int movieId) async {
    final movieDetailModel = await remoteDataSource.getMovieDetail(movieId);
    return movieDetailModel.toEntity();
  }

  @override
  Future<List<Cast>> getMovieCredits(int movieId) async {
    final castModels = await remoteDataSource.getMovieCredits(movieId);
    final cast = castModels.map((model) => model.toEntity()).toList();
    return cast;
  }

  @override
  Future<List<Video>> getMovieVideos(int movieId) async {
    final videoModels = await remoteDataSource.getMovieVideos(movieId);
    final videos = videoModels.map((model) => model.toEntity()).toList();
    return videos;
  }

  @override
  Future<void> addMovieToFavorites(Movie movie) async {
    final favoriteMovie = FavoriteMovie(
      id: movie.id,
      title: movie.title,
      posterPath: movie.posterPath,
    );
    await localDataSource.addMovieToFavorites(favoriteMovie);
  }

  @override
  Future<void> removeMovieFromFavorites(int movieId) async {
    await localDataSource.removeMovieFromFavorites(movieId);
  }

  @override
  Future<List<Movie>> getFavoriteMovies() async {
    final favoriteMovies = await localDataSource.getFavoriteMovies();
    return favoriteMovies
        .map((e) => Movie(id: e.id, title: e.title, overview: '', posterPath: e.posterPath, backdropPath: null, voteAverage: 0.0))
        .toList();
  }

  @override
  Future<bool> isMovieFavorite(int movieId) async {
    return await localDataSource.isMovieFavorite(movieId);
  }
}
