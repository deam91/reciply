import 'package:json_annotation/json_annotation.dart';

part 'user_bookmarks.g.dart';

@JsonSerializable()
class UserBookmarks {
  UserBookmarks(this.bookmarks);
  final List<String>? bookmarks;

  /// Connect the generated [_$UserBookmarksEntityFromJson] function to the `fromJson`
  /// factory.
  factory UserBookmarks.fromJson(Map<String, dynamic> json) =>
      _$UserBookmarksFromJson(json);

  /// Connect the generated [_$UserBookmarksEntityToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$UserBookmarksToJson(this);
}
