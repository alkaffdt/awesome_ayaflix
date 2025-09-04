
import 'package:hive/hive.dart';

part 'favorite_movie.g.dart';

@HiveType(typeId: 0)
class FavoriteMovie extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String? posterPath;

  FavoriteMovie({
    required this.id,
    required this.title,
    this.posterPath,
  });
}
