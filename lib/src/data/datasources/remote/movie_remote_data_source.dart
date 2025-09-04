import 'package:awesome_ayaflix/src/core/error/failure.dart';
import 'package:awesome_ayaflix/src/data/datasources/remote/api_constants.dart';
import 'package:awesome_ayaflix/src/data/datasources/remote/dio_client.dart';
import 'package:awesome_ayaflix/src/data/models/cast_model.dart';
import 'package:awesome_ayaflix/src/data/models/movie_detail_model.dart';
import 'package:awesome_ayaflix/src/data/models/movie_model.dart';
import 'package:awesome_ayaflix/src/data/models/video_model.dart';
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';

abstract class MovieRemoteDataSource {
  Future<Either<Failure, List<MovieModel>>> getPopularMovies({int page = 1});
  Future<Either<Failure, List<MovieModel>>> searchMovies(String query, {int page = 1});
  Future<Either<Failure, MovieDetailModel>> getMovieDetail(int movieId);
  Future<Either<Failure, List<CastModel>>> getMovieCredits(int movieId);
  Future<Either<Failure, List<VideoModel>>> getMovieVideos(int movieId);
}

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  final DioClient _dioClient;

  MovieRemoteDataSourceImpl(this._dioClient);

  @override
  Future<Either<Failure, List<MovieModel>>> getPopularMovies({int page = 1}) async {
    try {
      final response = await _dioClient.dio.get(
        ApiConstants.popularMovies,
        queryParameters: {'page': page},
      );
      final movies = (response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e))
          .toList();
      return Right(movies);
    } on DioException catch (e) {
      return Left(Failure(_handleDioError(e)));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MovieModel>>> searchMovies(String query, {int page = 1}) async {
    try {
      final response = await _dioClient.dio.get(
        ApiConstants.searchMovies,
        queryParameters: {'query': query, 'page': page},
      );
      final movies = (response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e))
          .toList();
      return Right(movies);
    } on DioException catch (e) {
      return Left(Failure(_handleDioError(e)));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, MovieDetailModel>> getMovieDetail(int movieId) async {
    try {
      final response = await _dioClient.dio.get(
        '${ApiConstants.movieDetail}/$movieId',
      );
      return Right(MovieDetailModel.fromJson(response.data));
    } on DioException catch (e) {
      return Left(Failure(_handleDioError(e)));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<CastModel>>> getMovieCredits(int movieId) async {
    try {
      final response = await _dioClient.dio.get(
        '${ApiConstants.movieDetail}/$movieId/credits',
      );
      final cast = (response.data['cast'] as List)
          .map((e) => CastModel.fromJson(e))
          .toList();
      return Right(cast);
    } on DioException catch (e) {
      return Left(Failure(_handleDioError(e)));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<VideoModel>>> getMovieVideos(int movieId) async {
    try {
      final response = await _dioClient.dio.get(
        '${ApiConstants.movieDetail}/$movieId/videos',
      );
      final videos = (response.data['results'] as List)
          .map((e) => VideoModel.fromJson(e))
          .toList();
      return Right(videos);
    } on DioException catch (e) {
      return Left(Failure(_handleDioError(e)));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  String _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return 'Connection timeout. Please check your internet connection.';
      case DioExceptionType.sendTimeout:
        return 'Send timeout. Please try again later.';
      case DioExceptionType.receiveTimeout:
        return 'Receive timeout. Please try again later.';
      case DioExceptionType.badResponse:
        return 'Received invalid status code: ${error.response?.statusCode}';
      case DioExceptionType.cancel:
        return 'Request to API server was cancelled.';
      case DioExceptionType.connectionError:
        return 'Connection error. Please check your internet connection.';
      case DioExceptionType.unknown:
        return 'An unexpected error occurred. Please try again later.';
      default:
        return 'Something went wrong. Please try again later.';
    }
  }
}