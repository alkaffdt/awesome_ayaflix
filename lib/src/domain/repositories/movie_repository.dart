import 'package:awesome_ayaflix/src/core/error/failure.dart';
import 'package:awesome_ayaflix/src/domain/entities/cast.dart';
import 'package:awesome_ayaflix/src/domain/entities/movie.dart';
import 'package:awesome_ayaflix/src/domain/entities/movie_detail.dart';
import 'package:awesome_ayaflix/src/domain/entities/video.dart';
import 'package:fpdart/fpdart.dart';

abstract class MovieRepository {
  Future<Either<Failure, List<Movie>>> getPopularMovies({int page = 1});
  Future<Either<Failure, List<Movie>>> searchMovies(String query, {int page = 1});
  Future<Either<Failure, MovieDetail>> getMovieDetail(int movieId);
  Future<Either<Failure, List<Cast>>> getMovieCredits(int movieId);
  Future<Either<Failure, List<Video>>> getMovieVideos(int movieId);
  Future<Either<Failure, void>> addMovieToFavorites(Movie movie);
  Future<Either<Failure, void>> removeMovieFromFavorites(int movieId);
  Future<Either<Failure, List<Movie>>> getFavoriteMovies();
  Future<Either<Failure, bool>> isMovieFavorite(int movieId);
}