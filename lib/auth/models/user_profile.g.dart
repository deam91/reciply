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
      lastLoggedIn: DateTime.parse(json['lastLoggedIn'] as String),
      registrationDate: DateTime.parse(json['registrationDate'] as String),
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
      'lastLoggedIn': instance.lastLoggedIn.toIso8601String(),
      'registrationDate': instance.registrationDate.toIso8601String(),
      'photoUrl': instance.photoUrl,
      'recipes': instance.recipes,
    };
