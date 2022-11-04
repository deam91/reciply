import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_profile.g.dart';

@JsonSerializable()
class UserProfile {
  String name;
  String email;
  String aboutMe;
  String work;
  Timestamp? lastLoggedIn;
  Timestamp? registrationDate;
  String photoUrl;
  List<String> recipes;

  UserProfile({
    required this.name,
    required this.email,
    required this.aboutMe,
    required this.work,
    this.lastLoggedIn,
    this.registrationDate,
    required this.photoUrl,
    required this.recipes,
  });

  /// Connect the generated [_$UserProfileEntityFromJson] function to the `fromJson`
  /// factory.
  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);

  /// Connect the generated [_$UserProfileEntityToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$UserProfileToJson(this);
}
