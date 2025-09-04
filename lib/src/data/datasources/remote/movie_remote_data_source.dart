
import 'package:awesome_ayaflix/src/data/datasources/remote/api_constants.dart';
import 'package:awesome_ayaflix/src/data/datasources/remote/dio_client.dart';
import 'package:awesome_ayaflix/src/data/models/cast_model.dart';
import 'package:awesome_ayaflix/src/data/models/movie_detail_model.dart';
import 'package:awesome_ayaflix/src/data/models/movie_model.dart';
import 'package:awesome_ayaflix/src/data/models/video_model.dart';

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> getPopularMovies({int page = 1});
  Future<List<MovieModel>> searchMovies(String query, {int page = 1});
  Future<MovieDetailModel> getMovieDetail(int movieId);
  Future<List<CastModel>> getMovieCredits(int movieId);
  Future<List<VideoModel>> getMovieVideos(int movieId);
}

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  final DioClient _dioClient;

  MovieRemoteDataSourceImpl(this._dioClient);

  @override
  Future<List<MovieModel>> getPopularMovies({int page = 1}) async {
    try {
      final response = await _dioClient.dio.get(
        ApiConstants.popularMovies,
        queryParameters: {'page': page},
      );
      final movies = (response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e))
          .toList();
      return movies;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<MovieModel>> searchMovies(String query, {int page = 1}) async {
    try {
      final response = await _dioClient.dio.get(
        ApiConstants.searchMovies,
        queryParameters: {'query': query, 'page': page},
      );
      final movies = (response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e))
          .toList();
      return movies;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<MovieDetailModel> getMovieDetail(int movieId) async {
    try {
      final response = await _dioClient.dio.get(
        '${ApiConstants.movieDetail}/$movieId',
      );
      return MovieDetailModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<CastModel>> getMovieCredits(int movieId) async {
    try {
      final response = await _dioClient.dio.get(
        '${ApiConstants.movieDetail}/$movieId/credits',
      );
      final cast = (response.data['cast'] as List)
          .map((e) => CastModel.fromJson(e))
          .toList();
      return cast;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<VideoModel>> getMovieVideos(int movieId) async {
    try {
      final response = await _dioClient.dio.get(
        '${ApiConstants.movieDetail}/$movieId/videos',
      );
      final videos = (response.data['results'] as List)
          .map((e) => VideoModel.fromJson(e))
          .toList();
      return videos;
    } catch (e) {
      rethrow;
    }
  }
}
