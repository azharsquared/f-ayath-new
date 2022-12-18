import 'package:hive/hive.dart';

// Generated by `flutter packages pub run build_runner build`.
//flutter packages pub run build_runner build
part 'user_count_with_favourite.g.dart';

@HiveType(typeId: 3)
class UserCountWithFavourite extends HiveObject {
  @HiveField(0)
  int? id;
  @HiveField(1)
  int duaId;
  @HiveField(2)
  int? userCount;



  UserCountWithFavourite({
    this.id,
    required this.duaId,
    int? userCount,
  }) :
        this.userCount = 0
  ;


  @override
  String toString() {
    return 'UserCountWithFavourite(id=$id, useCount=$userCount, userId=$duaId)';
  }
}