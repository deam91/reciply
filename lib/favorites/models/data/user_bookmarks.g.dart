// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_bookmarks.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserBookmarks _$UserBookmarksFromJson(Map<String, dynamic> json) =>
    UserBookmarks(
      (json['bookmarks'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$UserBookmarksToJson(UserBookmarks instance) =>
    <String, dynamic>{
      'bookmarks': instance.bookmarks,
    };
