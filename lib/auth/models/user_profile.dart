import 'package:json_annotation/json_annotation.dart';

part 'user_profile.g.dart';

@JsonSerializable()
class UserProfile {
  String name;
  String email;
  DateTime lastLoggedIn;
  DateTime registrationDate;
  String photoUrl;
  bool introSeen;
  List<String> recipes;

  UserProfile({
    required this.name,
    required this.email,
    required this.lastLoggedIn,
    required this.registrationDate,
    required this.photoUrl,
    required this.introSeen,
    required this.recipes,
  });

  /// Connect the generated [_$UserProfileEntityFromJson] function to the `fromJson`
  /// factory.
  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);

  /// Connect the generated [_$UserProfileEntityToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$UserProfileToJson(this);
}
