
import 'package:awesome_ayaflix/src/domain/entities/cast.dart';
import 'package:awesome_ayaflix/src/domain/entities/movie.dart';
import 'package:awesome_ayaflix/src/domain/entities/movie_detail.dart';
import 'package:awesome_ayaflix/src/domain/entities/video.dart';

abstract class MovieRepository {
  Future<List<Movie>> getPopularMovies({int page = 1});
  Future<List<Movie>> searchMovies(String query, {int page = 1});
  Future<MovieDetail> getMovieDetail(int movieId);
  Future<List<Cast>> getMovieCredits(int movieId);
  Future<List<Video>> getMovieVideos(int movieId);
  Future<void> addMovieToFavorites(Movie movie);
  Future<void> removeMovieFromFavorites(int movieId);
  Future<List<Movie>> getFavoriteMovies();
  Future<bool> isMovieFavorite(int movieId);
}
