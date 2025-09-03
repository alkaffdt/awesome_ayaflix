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
String _$movieRepositoryHash() => r'ab0a7c312eea341e699f45acce998dbdef19bf43';

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
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
