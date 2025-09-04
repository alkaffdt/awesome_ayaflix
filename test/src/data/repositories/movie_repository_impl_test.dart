import 'package:awesome_ayaflix/src/data/datasources/local/movie_local_data_source.dart';
import 'package:awesome_ayaflix/src/data/datasources/remote/movie_remote_data_source.dart';
import 'package:awesome_ayaflix/src/data/models/cast_model.dart';
import 'package:awesome_ayaflix/src/data/models/favorite_movie.dart';
import 'package:awesome_ayaflix/src/data/models/movie_detail_model.dart';
import 'package:awesome_ayaflix/src/data/models/movie_model.dart';
import 'package:awesome_ayaflix/src/data/models/video_model.dart';
import 'package:awesome_ayaflix/src/data/repositories/movie_repository_impl.dart';
import 'package:awesome_ayaflix/src/core/error/failure.dart';
import 'package:awesome_ayaflix/src/domain/entities/cast.dart';
import 'package:awesome_ayaflix/src/domain/entities/movie.dart';
import 'package:awesome_ayaflix/src/domain/entities/movie_detail.dart';
import 'package:awesome_ayaflix/src/domain/entities/video.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/test_helper.mocks.dart';

void main() {
  late MockMovieRemoteDataSource mockRemoteDataSource;
  late MockMovieLocalDataSource mockLocalDataSource;
  late MovieRepositoryImpl repository;

  setUpAll(() {
    provideDummy<Either<Failure, List<MovieModel>>>(Left(Failure('dummy')));
    provideDummy<Either<Failure, MovieModel>>(Left(Failure('dummy')));
    provideDummy<Either<Failure, MovieDetailModel>>(Left(Failure('dummy')));
    provideDummy<Either<Failure, List<CastModel>>>(Left(Failure('dummy')));
    provideDummy<Either<Failure, List<VideoModel>>>(Left(Failure('dummy')));
    provideDummy<Either<Failure, void>>(Left(Failure('dummy')));
    provideDummy<Either<Failure, bool>>(Left(Failure('dummy')));
  });

  setUp(() {
    mockRemoteDataSource = MockMovieRemoteDataSource();
    mockLocalDataSource = MockMovieLocalDataSource();
    repository = MovieRepositoryImpl(mockRemoteDataSource, mockLocalDataSource);
  });

  group('getPopularMovies', () {
    final tMovieModelList = [
      MovieModel(id: 1, title: 'Test Movie 1', overview: 'Desc 1', posterPath: '/path1', backdropPath: '/path1', voteAverage: 7.1),
      MovieModel(id: 2, title: 'Test Movie 2', overview: 'Desc 2', posterPath: '/path2', backdropPath: '/path2', voteAverage: 7.2),
    ];
    final tMovieList = tMovieModelList.map((e) => e.toEntity()).toList();

    test('should return a list of movies when the call to remote data source is successful', () async {
      // arrange
      when(mockRemoteDataSource.getPopularMovies(page: anyNamed('page'))).thenAnswer((_) async => Right(tMovieModelList));

      // act
      final result = await repository.getPopularMovies();

      // assert
      verify(mockRemoteDataSource.getPopularMovies(page: anyNamed('page')));
      expect(result, isA<Right<Failure, List<Movie>>>());
      result.fold((l) => fail('should not be a failure'), (r) => expect(r, tMovieList));
    });

    test('should return a failure when the call to remote data source is unsuccessful', () async {
      // arrange
      when(mockRemoteDataSource.getPopularMovies(page: anyNamed('page'))).thenAnswer((_) async => Left(Failure('Server Failure')));

      // act
      final result = await repository.getPopularMovies();

      // assert
      verify(mockRemoteDataSource.getPopularMovies(page: anyNamed('page')));
      expect(result, isA<Left<Failure, List<Movie>>>());
    });
  });

  group('searchMovies', () {
    final tMovieModelList = [
      MovieModel(id: 1, title: 'Test Movie 1', overview: 'Desc 1', posterPath: '/path1', backdropPath: '/path1', voteAverage: 7.1),
      MovieModel(id: 2, title: 'Test Movie 2', overview: 'Desc 2', posterPath: '/path2', backdropPath: '/path2', voteAverage: 7.2),
    ];
    final tMovieList = tMovieModelList.map((e) => e.toEntity()).toList();
    const tQuery = 'test';

    test('should return a list of movies when the call to remote data source is successful', () async {
      // arrange
      when(mockRemoteDataSource.searchMovies(tQuery, page: anyNamed('page'))).thenAnswer((_) async => Right(tMovieModelList));

      // act
      final result = await repository.searchMovies(tQuery);

      // assert
      verify(mockRemoteDataSource.searchMovies(tQuery, page: anyNamed('page')));
      expect(result, isA<Right<Failure, List<Movie>>>());
      result.fold((l) => fail('should not be a failure'), (r) => expect(r, tMovieList));
    });

    test('should return a failure when the call to remote data source is unsuccessful', () async {
      // arrange
      when(mockRemoteDataSource.searchMovies(tQuery, page: anyNamed('page'))).thenAnswer((_) async => Left(Failure('Server Failure')));

      // act
      final result = await repository.searchMovies(tQuery);

      // assert
      verify(mockRemoteDataSource.searchMovies(tQuery, page: anyNamed('page')));
      expect(result, isA<Left<Failure, List<Movie>>>());
    });
  });

  group('getMovieDetail', () {
    const tMovieId = 1;
    final tMovieDetailModel = MovieDetailModel(id: 1, title: 'Test Movie', overview: 'Desc', posterPath: '/path', backdropPath: '/path', voteAverage: 7.0, genres: [], releaseDate: '2022-01-01', runtime: 120);
    final tMovieDetail = tMovieDetailModel.toEntity();

    test('should return movie detail when the call to remote data source is successful', () async {
      // arrange
      when(mockRemoteDataSource.getMovieDetail(tMovieId)).thenAnswer((_) async => Right(tMovieDetailModel));

      // act
      final result = await repository.getMovieDetail(tMovieId);

      // assert
      verify(mockRemoteDataSource.getMovieDetail(tMovieId));
      expect(result, isA<Right<Failure, MovieDetail>>());
      result.fold((l) => fail('should not be a failure'), (r) => expect(r, tMovieDetail));
    });

    test('should return a failure when the call to remote data source is unsuccessful', () async {
      // arrange
      when(mockRemoteDataSource.getMovieDetail(tMovieId)).thenAnswer((_) async => Left(Failure('Server Failure')));

      // act
      final result = await repository.getMovieDetail(tMovieId);

      // assert
      verify(mockRemoteDataSource.getMovieDetail(tMovieId));
      expect(result, isA<Left<Failure, MovieDetail>>());
    });
  });

  group('getMovieCredits', () {
    const tMovieId = 1;
    final tCastModelList = [
      CastModel(id: 1, name: 'Actor 1', character: 'Character 1', profilePath: '/path1'),
      CastModel(id: 2, name: 'Actor 2', character: 'Character 2', profilePath: '/path2'),
    ];
    final tCastList = tCastModelList.map((e) => e.toEntity()).toList();

    test('should return movie credits when the call to remote data source is successful', () async {
      // arrange
      when(mockRemoteDataSource.getMovieCredits(tMovieId)).thenAnswer((_) async => Right(tCastModelList));

      // act
      final result = await repository.getMovieCredits(tMovieId);

      // assert
      verify(mockRemoteDataSource.getMovieCredits(tMovieId));
      expect(result, isA<Right<Failure, List<Cast>>>());
      result.fold((l) => fail('should not be a failure'), (r) => expect(r, tCastList));
    });

    test('should return a failure when the call to remote data source is unsuccessful', () async {
      // arrange
      when(mockRemoteDataSource.getMovieCredits(tMovieId)).thenAnswer((_) async => Left(Failure('Server Failure')));

      // act
      final result = await repository.getMovieCredits(tMovieId);

      // assert
      verify(mockRemoteDataSource.getMovieCredits(tMovieId));
      expect(result, isA<Left<Failure, List<Cast>>>());
    });
  });

  group('getMovieVideos', () {
    const tMovieId = 1;
    final tVideoModelList = [
      VideoModel(id: '1', key: 'key1', name: 'Video 1', site: 'YouTube', type: 'Trailer'),
      VideoModel(id: '2', key: 'key2', name: 'Video 2', site: 'YouTube', type: 'Teaser'),
    ];
    final tVideoList = tVideoModelList.map((e) => e.toEntity()).toList();

    test('should return movie videos when the call to remote data source is successful', () async {
      // arrange
      when(mockRemoteDataSource.getMovieVideos(tMovieId)).thenAnswer((_) async => Right(tVideoModelList));

      // act
      final result = await repository.getMovieVideos(tMovieId);

      // assert
      verify(mockRemoteDataSource.getMovieVideos(tMovieId));
      expect(result, isA<Right<Failure, List<Video>>>());
      result.fold((l) => fail('should not be a failure'), (r) => expect(r, tVideoList));
    });

    test('should return a failure when the call to remote data source is unsuccessful', () async {
      // arrange
      when(mockRemoteDataSource.getMovieVideos(tMovieId)).thenAnswer((_) async => Left(Failure('Server Failure')));

      // act
      final result = await repository.getMovieVideos(tMovieId);

      // assert
      verify(mockRemoteDataSource.getMovieVideos(tMovieId));
      expect(result, isA<Left<Failure, List<Video>>>());
    });
  });

  group('addMovieToFavorites', () {
    final tMovie = Movie(id: 1, title: 'Test Movie', overview: 'Desc', posterPath: '/path', backdropPath: '/path', voteAverage: 7.0);
    final tFavoriteMovie = FavoriteMovie(id: 1, title: 'Test Movie', posterPath: '/path');

    test('should call addMovieToFavorites on local data source', () async {
      // arrange
      when(mockLocalDataSource.addMovieToFavorites(tFavoriteMovie)).thenAnswer((_) async => Future.value());

      // act
      final result = await repository.addMovieToFavorites(tMovie);

      // assert
      verify(mockLocalDataSource.addMovieToFavorites(tFavoriteMovie));
      expect(result, isA<Right<Failure, void>>());
    });

    test('should return a failure when local data source throws an exception', () async {
      // arrange
      when(mockLocalDataSource.addMovieToFavorites(tFavoriteMovie)).thenThrow(Exception('Local DB Error'));

      // act
      final result = await repository.addMovieToFavorites(tMovie);

      // assert
      verify(mockLocalDataSource.addMovieToFavorites(tFavoriteMovie));
      expect(result, isA<Left<Failure, void>>());
    });
  });

  group('removeMovieFromFavorites', () {
    const tMovieId = 1;

    test('should call removeMovieFromFavorites on local data source', () async {
      // arrange
      when(mockLocalDataSource.removeMovieFromFavorites(tMovieId)).thenAnswer((_) async => Future.value());

      // act
      final result = await repository.removeMovieFromFavorites(tMovieId);

      // assert
      verify(mockLocalDataSource.removeMovieFromFavorites(tMovieId));
      expect(result, isA<Right<Failure, void>>());
    });

    test('should return a failure when local data source throws an exception', () async {
      // arrange
      when(mockLocalDataSource.removeMovieFromFavorites(tMovieId)).thenThrow(Exception('Local DB Error'));

      // act
      final result = await repository.removeMovieFromFavorites(tMovieId);

      // assert
      verify(mockLocalDataSource.removeMovieFromFavorites(tMovieId));
      expect(result, isA<Left<Failure, void>>());
    });
  });

  group('getFavoriteMovies', () {
    final tFavoriteMovieList = [
      FavoriteMovie(id: 1, title: 'Test Movie 1', posterPath: '/path1'),
      FavoriteMovie(id: 2, title: 'Test Movie 2', posterPath: '/path2'),
    ];
    final tMovieList = tFavoriteMovieList
        .map((e) => Movie(id: e.id, title: e.title, overview: '', posterPath: e.posterPath, backdropPath: null, voteAverage: 0.0))
        .toList();

    test('should return a list of favorite movies from local data source', () async {
      // arrange
      when(mockLocalDataSource.getFavoriteMovies()).thenAnswer((_) async => tFavoriteMovieList);

      // act
      final result = await repository.getFavoriteMovies();

      // assert
      verify(mockLocalDataSource.getFavoriteMovies());
      expect(result, isA<Right<Failure, List<Movie>>>());
      result.fold((l) => fail('should not be a failure'), (r) => expect(r, tMovieList));
    });

    test('should return a failure when local data source throws an exception', () async {
      // arrange
      when(mockLocalDataSource.getFavoriteMovies()).thenThrow(Exception('Local DB Error'));

      // act
      final result = await repository.getFavoriteMovies();

      // assert
      verify(mockLocalDataSource.getFavoriteMovies());
      expect(result, isA<Left<Failure, List<Movie>>>());
    });
  });

  group('isMovieFavorite', () {
    const tMovieId = 1;

    test('should return true if movie is favorite', () async {
      // arrange
      when(mockLocalDataSource.isMovieFavorite(tMovieId)).thenAnswer((_) async => true);

      // act
      final result = await repository.isMovieFavorite(tMovieId);

      // assert
      verify(mockLocalDataSource.isMovieFavorite(tMovieId));
      expect(result, isA<Right<Failure, bool>>());
      result.fold((l) => fail('should not be a failure'), (r) => expect(r, true));
    });

    test('should return false if movie is not favorite', () async {
      // arrange
      when(mockLocalDataSource.isMovieFavorite(tMovieId)).thenAnswer((_) async => false);

      // act
      final result = await repository.isMovieFavorite(tMovieId);

      // assert
      verify(mockLocalDataSource.isMovieFavorite(tMovieId));
      expect(result, isA<Right<Failure, bool>>());
      result.fold((l) => fail('should not be a failure'), (r) => expect(r, false));
    });

    test('should return a failure when local data source throws an exception', () async {
      // arrange
      when(mockLocalDataSource.isMovieFavorite(tMovieId)).thenThrow(Exception('Local DB Error'));

      // act
      final result = await repository.isMovieFavorite(tMovieId);

      // assert
      verify(mockLocalDataSource.isMovieFavorite(tMovieId));
      expect(result, isA<Left<Failure, bool>>());
    });
  });
}
