import 'package:awesome_ayaflix/src/data/models/cast_model.dart';
import 'package:awesome_ayaflix/src/data/models/movie_detail_model.dart';
import 'package:awesome_ayaflix/src/data/models/video_model.dart';
import 'package:awesome_ayaflix/src/data/datasources/remote/movie_remote_data_source.dart';
import 'package:awesome_ayaflix/src/data/models/movie_model.dart';
import 'package:awesome_ayaflix/src/core/error/failure.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mockito/mockito.dart';

import '../../../../helpers/test_helper.mocks.dart';

void main() {
  late MockDioClient mockDioClient;
  late MockDio mockDio;
  late MovieRemoteDataSourceImpl dataSource;

  setUp(() {
    mockDioClient = MockDioClient();
    mockDio = MockDio();
    when(mockDioClient.dio).thenReturn(mockDio);
    dataSource = MovieRemoteDataSourceImpl(mockDioClient);
  });

  group('getPopularMovies', () {
    final tMovieList = [
      MovieModel(id: 1, title: 'Test Movie 1', overview: 'Desc 1', posterPath: '/path1', backdropPath: '/path1', voteAverage: 7.1),
      MovieModel(id: 2, title: 'Test Movie 2', overview: 'Desc 2', posterPath: '/path2', backdropPath: '/path2', voteAverage: 7.2),
    ];

    test('should return a list of MovieModel when the response code is 200', () async {
      // arrange
      when(mockDio.get(any, queryParameters: anyNamed('queryParameters'))).thenAnswer(
        (_) async => Response(
          requestOptions: RequestOptions(path: ''),
          data: {'results': tMovieList.map((e) => e.toJson()).toList()},
          statusCode: 200,
        ),
      );

      // act
      final result = await dataSource.getPopularMovies();

      // assert
      expect(result, isA<Right<Failure, List<MovieModel>>>());
      result.fold((l) => fail('should not be a failure'), (r) => expect(r, tMovieList));
    });

    test('should return a Failure when the response code is not 200', () async {
      // arrange
      when(mockDio.get(any, queryParameters: anyNamed('queryParameters'))).thenThrow(
        DioException(
          requestOptions: RequestOptions(path: ''),
          response: Response(
            requestOptions: RequestOptions(path: ''),
            data: 'Something went wrong',
            statusCode: 404,
          ),
        ),
      );

      // act
      final result = await dataSource.getPopularMovies();

      // assert
      expect(result, isA<Left<Failure, List<MovieModel>>>());
    });
  });

  group('searchMovies', () {
    final tMovieList = [
      MovieModel(id: 1, title: 'Test Movie 1', overview: 'Desc 1', posterPath: '/path1', backdropPath: '/path1', voteAverage: 7.1),
      MovieModel(id: 2, title: 'Test Movie 2', overview: 'Desc 2', posterPath: '/path2', backdropPath: '/path2', voteAverage: 7.2),
    ];
    const tQuery = 'test';

    test('should return a list of MovieModel when the response code is 200', () async {
      // arrange
      when(mockDio.get(any, queryParameters: anyNamed('queryParameters'))).thenAnswer(
        (_) async => Response(
          requestOptions: RequestOptions(path: ''),
          data: {'results': tMovieList.map((e) => e.toJson()).toList()},
          statusCode: 200,
        ),
      );

      // act
      final result = await dataSource.searchMovies(tQuery);

      // assert
      expect(result, isA<Right<Failure, List<MovieModel>>>());
      result.fold((l) => fail('should not be a failure'), (r) => expect(r, tMovieList));
    });

    test('should return a Failure when the response code is not 200', () async {
      // arrange
      when(mockDio.get(any, queryParameters: anyNamed('queryParameters'))).thenThrow(
        DioException(
          requestOptions: RequestOptions(path: ''),
          response: Response(
            requestOptions: RequestOptions(path: ''),
            data: 'Something went wrong',
            statusCode: 404,
          ),
        ),
      );

      // act
      final result = await dataSource.searchMovies(tQuery);

      // assert
      expect(result, isA<Left<Failure, List<MovieModel>>>());
    });
  });

  group('getMovieDetail', () {
    const tMovieId = 1;
    final tMovieDetail = MovieDetailModel(id: 1, title: 'Test Movie', overview: 'Desc', posterPath: '/path', backdropPath: '/path', voteAverage: 7.0, genres: [], releaseDate: '2022-01-01', runtime: 120);

    test('should return a MovieDetailModel when the response code is 200', () async {
      // arrange
      when(mockDio.get(any)).thenAnswer(
        (_) async => Response(
          requestOptions: RequestOptions(path: ''),
          data: tMovieDetail.toJson(),
          statusCode: 200,
        ),
      );

      // act
      final result = await dataSource.getMovieDetail(tMovieId);

      // assert
      expect(result, isA<Right<Failure, MovieDetailModel>>());
      result.fold((l) => fail('should not be a failure'), (r) => expect(r, tMovieDetail));
    });

    test('should return a Failure when the response code is not 200', () async {
      // arrange
      when(mockDio.get(any)).thenThrow(
        DioException(
          requestOptions: RequestOptions(path: ''),
          response: Response(
            requestOptions: RequestOptions(path: ''),
            data: 'Something went wrong',
            statusCode: 404,
          ),
        ),
      );

      // act
      final result = await dataSource.getMovieDetail(tMovieId);

      // assert
      expect(result, isA<Left<Failure, MovieDetailModel>>());
    });
  });

  group('getMovieCredits', () {
    const tMovieId = 1;
    final tCastList = [
      CastModel(id: 1, name: 'Actor 1', character: 'Character 1', profilePath: '/path1'),
      CastModel(id: 2, name: 'Actor 2', character: 'Character 2', profilePath: '/path2'),
    ];

    test('should return a list of CastModel when the response code is 200', () async {
      // arrange
      when(mockDio.get(any)).thenAnswer(
        (_) async => Response(
          requestOptions: RequestOptions(path: ''),
          data: {'cast': tCastList.map((e) => e.toJson()).toList()},
          statusCode: 200,
        ),
      );

      // act
      final result = await dataSource.getMovieCredits(tMovieId);

      // assert
      expect(result, isA<Right<Failure, List<CastModel>>>());
      result.fold((l) => fail('should not be a failure'), (r) => expect(r, tCastList));
    });

    test('should return a Failure when the response code is not 200', () async {
      // arrange
      when(mockDio.get(any)).thenThrow(
        DioException(
          requestOptions: RequestOptions(path: ''),
          response: Response(
            requestOptions: RequestOptions(path: ''),
            data: 'Something went wrong',
            statusCode: 404,
          ),
        ),
      );

      // act
      final result = await dataSource.getMovieCredits(tMovieId);

      // assert
      expect(result, isA<Left<Failure, List<CastModel>>>());
    });
  });

  group('getMovieVideos', () {
    const tMovieId = 1;
    final tVideoList = [
      VideoModel(id: '1', key: 'key1', name: 'Video 1', site: 'YouTube', type: 'Trailer'),
      VideoModel(id: '2', key: 'key2', name: 'Video 2', site: 'YouTube', type: 'Teaser'),
    ];

    test('should return a list of VideoModel when the response code is 200', () async {
      // arrange
      when(mockDio.get(any)).thenAnswer(
        (_) async => Response(
          requestOptions: RequestOptions(path: ''),
          data: {'results': tVideoList.map((e) => e.toJson()).toList()},
          statusCode: 200,
        ),
      );

      // act
      final result = await dataSource.getMovieVideos(tMovieId);

      // assert
      expect(result, isA<Right<Failure, List<VideoModel>>>());
      result.fold((l) => fail('should not be a failure'), (r) => expect(r, tVideoList));
    });

    test('should return a Failure when the response code is not 200', () async {
      // arrange
      when(mockDio.get(any)).thenThrow(
        DioException(
          requestOptions: RequestOptions(path: ''),
          response: Response(
            requestOptions: RequestOptions(path: ''),
            data: 'Something went wrong',
            statusCode: 404,
          ),
        ),
      );

      // act
      final result = await dataSource.getMovieVideos(tMovieId);

      // assert
      expect(result, isA<Left<Failure, List<VideoModel>>>());
    });
  });
}
