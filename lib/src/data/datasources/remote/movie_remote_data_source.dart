
import 'package:awesome_ayaflix/src/data/datasources/remote/api_constants.dart';
import 'package:awesome_ayaflix/src/data/datasources/remote/dio_client.dart';
import 'package:awesome_ayaflix/src/data/models/movie_model.dart';

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> getPopularMovies({int page = 1});
  Future<List<MovieModel>> searchMovies(String query, {int page = 1});
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
}
