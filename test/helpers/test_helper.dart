import 'package:awesome_ayaflix/src/data/datasources/local/movie_local_data_source.dart';
import 'package:awesome_ayaflix/src/data/datasources/remote/movie_remote_data_source.dart';
import 'package:awesome_ayaflix/src/data/datasources/remote/dio_client.dart';
import 'package:dio/dio.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([MovieRemoteDataSource, MovieLocalDataSource, DioClient], customMocks: [MockSpec<Dio>(as: #MockDio)])
void main() {}
