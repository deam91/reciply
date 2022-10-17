import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_settings.g.dart';

@collection
@JsonSerializable()
class UserSettings {
  UserSettings();
  Id? id;
  bool? isOnboarded;

  /// Connect the generated [_$UserSettingsEntityFromJson] function to the `fromJson`
  /// factory.
  factory UserSettings.fromJson(Map<String, dynamic> json) =>
      _$UserSettingsFromJson(json);

  /// Connect the generated [_$UserSettingsEntityToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$UserSettingsToJson(this);
}
