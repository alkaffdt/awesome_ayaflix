import 'package:awesome_ayaflix/src/core/error/failure.dart';
import 'package:awesome_ayaflix/src/data/datasources/local/movie_local_data_source.dart';
import 'package:awesome_ayaflix/src/data/datasources/remote/movie_remote_data_source.dart';
import 'package:awesome_ayaflix/src/data/models/favorite_movie.dart';
import 'package:awesome_ayaflix/src/domain/entities/cast.dart';
import 'package:awesome_ayaflix/src/domain/entities/movie.dart';
import 'package:awesome_ayaflix/src/domain/entities/movie_detail.dart';
import 'package:awesome_ayaflix/src/domain/entities/video.dart';
import 'package:awesome_ayaflix/src/domain/repositories/movie_repository.dart';
import 'package:fpdart/fpdart.dart';

// ignore: unused_import
import 'package:awesome_ayaflix/src/data/models/movie_model.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource remoteDataSource;
  final MovieLocalDataSource localDataSource;

  MovieRepositoryImpl(this.remoteDataSource, this.localDataSource);

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies({int page = 1}) async {
    final result = await remoteDataSource.getPopularMovies(page: page);
    return result.fold(
      (failure) => Left(failure),
      (movieModels) {
        // For some reason, the analyzer is not picking up the toEntity() extension method.
        // Using an explicit cast to fix the compilation error.
        final movies = movieModels.map((model) => model.toEntity()).toList().cast<Movie>();
        return Right(movies);
      },
    );
  }

  @override
  Future<Either<Failure, List<Movie>>> searchMovies(String query, {int page = 1}) async {
    final result = await remoteDataSource.searchMovies(query, page: page);
    return result.fold(
      (failure) => Left(failure),
      (movieModels) {
        final movies = movieModels.map((model) => model.toEntity()).toList().cast<Movie>();
        return Right(movies);
      },
    );
  }

  @override
  Future<Either<Failure, MovieDetail>> getMovieDetail(int movieId) async {
    final result = await remoteDataSource.getMovieDetail(movieId);
    return result.fold(
      (failure) => Left(failure),
      (movieDetailModel) => Right(movieDetailModel.toEntity()),
    );
  }

  @override
  Future<Either<Failure, List<Cast>>> getMovieCredits(int movieId) async {
    final result = await remoteDataSource.getMovieCredits(movieId);
    return result.fold(
      (failure) => Left(failure),
      (castModels) {
        final cast = castModels.map((model) => model.toEntity()).toList().cast<Cast>();
        return Right(cast);
      },
    );
  }

  @override
  Future<Either<Failure, List<Video>>> getMovieVideos(int movieId) async {
    final result = await remoteDataSource.getMovieVideos(movieId);
    return result.fold(
      (failure) => Left(failure),
      (videoModels) {
        final videos = videoModels.map((model) => model.toEntity()).toList().cast<Video>();
        return Right(videos);
      },
    );
  }

  @override
  Future<Either<Failure, void>> addMovieToFavorites(Movie movie) async {
    try {
      final favoriteMovie = FavoriteMovie(
        id: movie.id,
        title: movie.title,
        posterPath: movie.posterPath,
      );
      final result = await localDataSource.addMovieToFavorites(favoriteMovie);
      return Right(result);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> removeMovieFromFavorites(int movieId) async {
    try {
      final result = await localDataSource.removeMovieFromFavorites(movieId);
      return Right(result);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getFavoriteMovies() async {
    try {
      final favoriteMovies = await localDataSource.getFavoriteMovies();
      final movies = favoriteMovies
          .map((e) => Movie(
                id: e.id,
                title: e.title,
                overview: '',
                posterPath: e.posterPath,
                backdropPath: null,
                voteAverage: 0.0,
              ))
          .toList();
      return Right(movies);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> isMovieFavorite(int movieId) async {
    try {
      final result = await localDataSource.isMovieFavorite(movieId);
      return Right(result);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}