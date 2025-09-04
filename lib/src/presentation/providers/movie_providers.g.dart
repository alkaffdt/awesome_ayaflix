// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$dioClientHash() => r'6d2d5a2f483a5ba4cdafbb69888493dfbab79b3a';

/// See also [dioClient].
@ProviderFor(dioClient)
final dioClientProvider = AutoDisposeProvider<DioClient>.internal(
  dioClient,
  name: r'dioClientProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$dioClientHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef DioClientRef = AutoDisposeProviderRef<DioClient>;
String _$movieRemoteDataSourceHash() =>
    r'f220787bc48f416827073710a9556f3ec7a844d2';

/// See also [movieRemoteDataSource].
@ProviderFor(movieRemoteDataSource)
final movieRemoteDataSourceProvider =
    AutoDisposeProvider<MovieRemoteDataSource>.internal(
  movieRemoteDataSource,
  name: r'movieRemoteDataSourceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$movieRemoteDataSourceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef MovieRemoteDataSourceRef
    = AutoDisposeProviderRef<MovieRemoteDataSource>;
String _$movieLocalDataSourceHash() =>
    r'285ab219b6f0fcf8af71d79cca85c8c99f9e032d';

/// See also [movieLocalDataSource].
@ProviderFor(movieLocalDataSource)
final movieLocalDataSourceProvider =
    AutoDisposeProvider<MovieLocalDataSource>.internal(
  movieLocalDataSource,
  name: r'movieLocalDataSourceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$movieLocalDataSourceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef MovieLocalDataSourceRef = AutoDisposeProviderRef<MovieLocalDataSource>;
String _$movieRepositoryHash() => r'7cdd39c436e0ceb04d44be387dc942ddd6a28816';

/// See also [movieRepository].
@ProviderFor(movieRepository)
final movieRepositoryProvider = AutoDisposeProvider<MovieRepository>.internal(
  movieRepository,
  name: r'movieRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$movieRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef MovieRepositoryRef = AutoDisposeProviderRef<MovieRepository>;
String _$movieDetailHash() => r'9dce17275b712e8f69edccdf5f7a0afdf8803704';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [movieDetail].
@ProviderFor(movieDetail)
const movieDetailProvider = MovieDetailFamily();

/// See also [movieDetail].
class MovieDetailFamily extends Family<AsyncValue<MovieDetail>> {
  /// See also [movieDetail].
  const MovieDetailFamily();

  /// See also [movieDetail].
  MovieDetailProvider call(
    int movieId,
  ) {
    return MovieDetailProvider(
      movieId,
    );
  }

  @override
  MovieDetailProvider getProviderOverride(
    covariant MovieDetailProvider provider,
  ) {
    return call(
      provider.movieId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'movieDetailProvider';
}

/// See also [movieDetail].
class MovieDetailProvider extends AutoDisposeFutureProvider<MovieDetail> {
  /// See also [movieDetail].
  MovieDetailProvider(
    int movieId,
  ) : this._internal(
          (ref) => movieDetail(
            ref as MovieDetailRef,
            movieId,
          ),
          from: movieDetailProvider,
          name: r'movieDetailProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$movieDetailHash,
          dependencies: MovieDetailFamily._dependencies,
          allTransitiveDependencies:
              MovieDetailFamily._allTransitiveDependencies,
          movieId: movieId,
        );

  MovieDetailProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.movieId,
  }) : super.internal();

  final int movieId;

  @override
  Override overrideWith(
    FutureOr<MovieDetail> Function(MovieDetailRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: MovieDetailProvider._internal(
        (ref) => create(ref as MovieDetailRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        movieId: movieId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<MovieDetail> createElement() {
    return _MovieDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MovieDetailProvider && other.movieId == movieId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, movieId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin MovieDetailRef on AutoDisposeFutureProviderRef<MovieDetail> {
  /// The parameter `movieId` of this provider.
  int get movieId;
}

class _MovieDetailProviderElement
    extends AutoDisposeFutureProviderElement<MovieDetail> with MovieDetailRef {
  _MovieDetailProviderElement(super.provider);

  @override
  int get movieId => (origin as MovieDetailProvider).movieId;
}

String _$movieCreditsHash() => r'fd50c0365c7063b6ec667215b2fe4c60fac6be9a';

/// See also [movieCredits].
@ProviderFor(movieCredits)
const movieCreditsProvider = MovieCreditsFamily();

/// See also [movieCredits].
class MovieCreditsFamily extends Family<AsyncValue<List<Cast>>> {
  /// See also [movieCredits].
  const MovieCreditsFamily();

  /// See also [movieCredits].
  MovieCreditsProvider call(
    int movieId,
  ) {
    return MovieCreditsProvider(
      movieId,
    );
  }

  @override
  MovieCreditsProvider getProviderOverride(
    covariant MovieCreditsProvider provider,
  ) {
    return call(
      provider.movieId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'movieCreditsProvider';
}

/// See also [movieCredits].
class MovieCreditsProvider extends AutoDisposeFutureProvider<List<Cast>> {
  /// See also [movieCredits].
  MovieCreditsProvider(
    int movieId,
  ) : this._internal(
          (ref) => movieCredits(
            ref as MovieCreditsRef,
            movieId,
          ),
          from: movieCreditsProvider,
          name: r'movieCreditsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$movieCreditsHash,
          dependencies: MovieCreditsFamily._dependencies,
          allTransitiveDependencies:
              MovieCreditsFamily._allTransitiveDependencies,
          movieId: movieId,
        );

  MovieCreditsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.movieId,
  }) : super.internal();

  final int movieId;

  @override
  Override overrideWith(
    FutureOr<List<Cast>> Function(MovieCreditsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: MovieCreditsProvider._internal(
        (ref) => create(ref as MovieCreditsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        movieId: movieId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Cast>> createElement() {
    return _MovieCreditsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MovieCreditsProvider && other.movieId == movieId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, movieId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin MovieCreditsRef on AutoDisposeFutureProviderRef<List<Cast>> {
  /// The parameter `movieId` of this provider.
  int get movieId;
}

class _MovieCreditsProviderElement
    extends AutoDisposeFutureProviderElement<List<Cast>> with MovieCreditsRef {
  _MovieCreditsProviderElement(super.provider);

  @override
  int get movieId => (origin as MovieCreditsProvider).movieId;
}

String _$movieVideosHash() => r'81d4a12a2a7a05bc313be0d31c65a4c01be24e58';

/// See also [movieVideos].
@ProviderFor(movieVideos)
const movieVideosProvider = MovieVideosFamily();

/// See also [movieVideos].
class MovieVideosFamily extends Family<AsyncValue<List<Video>>> {
  /// See also [movieVideos].
  const MovieVideosFamily();

  /// See also [movieVideos].
  MovieVideosProvider call(
    int movieId,
  ) {
    return MovieVideosProvider(
      movieId,
    );
  }

  @override
  MovieVideosProvider getProviderOverride(
    covariant MovieVideosProvider provider,
  ) {
    return call(
      provider.movieId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'movieVideosProvider';
}

/// See also [movieVideos].
class MovieVideosProvider extends AutoDisposeFutureProvider<List<Video>> {
  /// See also [movieVideos].
  MovieVideosProvider(
    int movieId,
  ) : this._internal(
          (ref) => movieVideos(
            ref as MovieVideosRef,
            movieId,
          ),
          from: movieVideosProvider,
          name: r'movieVideosProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$movieVideosHash,
          dependencies: MovieVideosFamily._dependencies,
          allTransitiveDependencies:
              MovieVideosFamily._allTransitiveDependencies,
          movieId: movieId,
        );

  MovieVideosProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.movieId,
  }) : super.internal();

  final int movieId;

  @override
  Override overrideWith(
    FutureOr<List<Video>> Function(MovieVideosRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: MovieVideosProvider._internal(
        (ref) => create(ref as MovieVideosRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        movieId: movieId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Video>> createElement() {
    return _MovieVideosProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MovieVideosProvider && other.movieId == movieId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, movieId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin MovieVideosRef on AutoDisposeFutureProviderRef<List<Video>> {
  /// The parameter `movieId` of this provider.
  int get movieId;
}

class _MovieVideosProviderElement
    extends AutoDisposeFutureProviderElement<List<Video>> with MovieVideosRef {
  _MovieVideosProviderElement(super.provider);

  @override
  int get movieId => (origin as MovieVideosProvider).movieId;
}

String _$favoriteMoviesHash() => r'03b3ea2dee7d1f6ed1855c192e0022a5d300b979';

/// See also [favoriteMovies].
@ProviderFor(favoriteMovies)
final favoriteMoviesProvider = AutoDisposeFutureProvider<List<Movie>>.internal(
  favoriteMovies,
  name: r'favoriteMoviesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$favoriteMoviesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FavoriteMoviesRef = AutoDisposeFutureProviderRef<List<Movie>>;
String _$popularMoviesHash() => r'275f0d149adbfb69a882eededb57cdc4fd637531';

/// See also [PopularMovies].
@ProviderFor(PopularMovies)
final popularMoviesProvider =
    AutoDisposeAsyncNotifierProvider<PopularMovies, List<Movie>>.internal(
  PopularMovies.new,
  name: r'popularMoviesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$popularMoviesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PopularMovies = AutoDisposeAsyncNotifier<List<Movie>>;
String _$searchMoviesHash() => r'5367e74f6f660821378ce9f07662485aa80fd33e';

abstract class _$SearchMovies
    extends BuildlessAutoDisposeAsyncNotifier<List<Movie>> {
  late final String query;

  FutureOr<List<Movie>> build(
    String query,
  );
}

/// See also [SearchMovies].
@ProviderFor(SearchMovies)
const searchMoviesProvider = SearchMoviesFamily();

/// See also [SearchMovies].
class SearchMoviesFamily extends Family<AsyncValue<List<Movie>>> {
  /// See also [SearchMovies].
  const SearchMoviesFamily();

  /// See also [SearchMovies].
  SearchMoviesProvider call(
    String query,
  ) {
    return SearchMoviesProvider(
      query,
    );
  }

  @override
  SearchMoviesProvider getProviderOverride(
    covariant SearchMoviesProvider provider,
  ) {
    return call(
      provider.query,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'searchMoviesProvider';
}

/// See also [SearchMovies].
class SearchMoviesProvider
    extends AutoDisposeAsyncNotifierProviderImpl<SearchMovies, List<Movie>> {
  /// See also [SearchMovies].
  SearchMoviesProvider(
    String query,
  ) : this._internal(
          () => SearchMovies()..query = query,
          from: searchMoviesProvider,
          name: r'searchMoviesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$searchMoviesHash,
          dependencies: SearchMoviesFamily._dependencies,
          allTransitiveDependencies:
              SearchMoviesFamily._allTransitiveDependencies,
          query: query,
        );

  SearchMoviesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.query,
  }) : super.internal();

  final String query;

  @override
  FutureOr<List<Movie>> runNotifierBuild(
    covariant SearchMovies notifier,
  ) {
    return notifier.build(
      query,
    );
  }

  @override
  Override overrideWith(SearchMovies Function() create) {
    return ProviderOverride(
      origin: this,
      override: SearchMoviesProvider._internal(
        () => create()..query = query,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        query: query,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<SearchMovies, List<Movie>>
      createElement() {
    return _SearchMoviesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SearchMoviesProvider && other.query == query;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, query.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin SearchMoviesRef on AutoDisposeAsyncNotifierProviderRef<List<Movie>> {
  /// The parameter `query` of this provider.
  String get query;
}

class _SearchMoviesProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<SearchMovies, List<Movie>>
    with SearchMoviesRef {
  _SearchMoviesProviderElement(super.provider);

  @override
  String get query => (origin as SearchMoviesProvider).query;
}

String _$searchQueryHash() => r'3c36752ee11b18a9f1e545eb1a7209a7222d91c9';

/// See also [SearchQuery].
@ProviderFor(SearchQuery)
final searchQueryProvider =
    AutoDisposeNotifierProvider<SearchQuery, String>.internal(
  SearchQuery.new,
  name: r'searchQueryProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$searchQueryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SearchQuery = AutoDisposeNotifier<String>;
String _$favoriteStatusHash() => r'45f8ed3e7168fdb9a30d4c1e28c668d7cde0adcd';

abstract class _$FavoriteStatus
    extends BuildlessAutoDisposeAsyncNotifier<bool> {
  late final int movieId;

  FutureOr<bool> build(
    int movieId,
  );
}

/// See also [FavoriteStatus].
@ProviderFor(FavoriteStatus)
const favoriteStatusProvider = FavoriteStatusFamily();

/// See also [FavoriteStatus].
class FavoriteStatusFamily extends Family<AsyncValue<bool>> {
  /// See also [FavoriteStatus].
  const FavoriteStatusFamily();

  /// See also [FavoriteStatus].
  FavoriteStatusProvider call(
    int movieId,
  ) {
    return FavoriteStatusProvider(
      movieId,
    );
  }

  @override
  FavoriteStatusProvider getProviderOverride(
    covariant FavoriteStatusProvider provider,
  ) {
    return call(
      provider.movieId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'favoriteStatusProvider';
}

/// See also [FavoriteStatus].
class FavoriteStatusProvider
    extends AutoDisposeAsyncNotifierProviderImpl<FavoriteStatus, bool> {
  /// See also [FavoriteStatus].
  FavoriteStatusProvider(
    int movieId,
  ) : this._internal(
          () => FavoriteStatus()..movieId = movieId,
          from: favoriteStatusProvider,
          name: r'favoriteStatusProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$favoriteStatusHash,
          dependencies: FavoriteStatusFamily._dependencies,
          allTransitiveDependencies:
              FavoriteStatusFamily._allTransitiveDependencies,
          movieId: movieId,
        );

  FavoriteStatusProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.movieId,
  }) : super.internal();

  final int movieId;

  @override
  FutureOr<bool> runNotifierBuild(
    covariant FavoriteStatus notifier,
  ) {
    return notifier.build(
      movieId,
    );
  }

  @override
  Override overrideWith(FavoriteStatus Function() create) {
    return ProviderOverride(
      origin: this,
      override: FavoriteStatusProvider._internal(
        () => create()..movieId = movieId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        movieId: movieId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<FavoriteStatus, bool>
      createElement() {
    return _FavoriteStatusProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FavoriteStatusProvider && other.movieId == movieId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, movieId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FavoriteStatusRef on AutoDisposeAsyncNotifierProviderRef<bool> {
  /// The parameter `movieId` of this provider.
  int get movieId;
}

class _FavoriteStatusProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<FavoriteStatus, bool>
    with FavoriteStatusRef {
  _FavoriteStatusProviderElement(super.provider);

  @override
  int get movieId => (origin as FavoriteStatusProvider).movieId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
