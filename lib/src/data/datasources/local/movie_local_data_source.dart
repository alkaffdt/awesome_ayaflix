
import 'package:awesome_ayaflix/src/data/models/favorite_movie.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class MovieLocalDataSource {
  Future<void> addMovieToFavorites(FavoriteMovie movie);
  Future<void> removeMovieFromFavorites(int movieId);
  Future<List<FavoriteMovie>> getFavoriteMovies();
  Future<bool> isMovieFavorite(int movieId);
}

class MovieLocalDataSourceImpl implements MovieLocalDataSource {
  final Box<FavoriteMovie> _favoriteBox;

  MovieLocalDataSourceImpl(this._favoriteBox);

  @override
  Future<void> addMovieToFavorites(FavoriteMovie movie) async {
    await _favoriteBox.put(movie.id, movie);
  }

  @override
  Future<void> removeMovieFromFavorites(int movieId) async {
    await _favoriteBox.delete(movieId);
  }

  @override
  Future<List<FavoriteMovie>> getFavoriteMovies() async {
    return _favoriteBox.values.toList();
  }

  @override
  Future<bool> isMovieFavorite(int movieId) async {
    return _favoriteBox.containsKey(movieId);
  }
}
