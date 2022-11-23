// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProfile _$UserProfileFromJson(Map<String, dynamic> json) => UserProfile(
      name: json['name'] as String,
      email: json['email'] as String,
      aboutMe: json['aboutMe'] as String,
      work: json['work'] as String,
      following: json['following'] as int?,
      lastLoggedIn: timestampConverter.fromJson(json['lastLoggedIn']),
      registrationDate: timestampConverter.fromJson(json['registrationDate']),
      photoUrl: json['photoUrl'] as String,
      recipes:
          (json['recipes'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$UserProfileToJson(UserProfile instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'aboutMe': instance.aboutMe,
      'work': instance.work,
      'following': instance.following,
      'lastLoggedIn': timestampConverter.toJson(instance.lastLoggedIn),
      'registrationDate': timestampConverter.toJson(instance.registrationDate),
      'photoUrl': instance.photoUrl,
      'recipes': instance.recipes,
    };
