import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_app/models/user.dart';

class UserPreferences {
  static late SharedPreferences _preferences;
  static const _keyUser = 'user';

  static const dummyUser = User(
    imagePath:
        'https://previews.123rf.com/images/triken/triken1608/triken160800029/61320775-male-avatar-profile-picture-default-user-avatar-guest-avatar-simply-human-head-vector-illustration-i.jpg?fj=1',
    name: 'User name',
    email: 'user.name@gmail.com',
    about:
        'In this field you can write about yourself, about your goals and hobbies. Feel free to use all lines you needs ',
    birthDay: '  dd/ mm / yy ',
    favSport: 'Soccer',
  );

  static Future init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future setUser(User user) async {
    final json = jsonEncode(user.toJason());

    await _preferences.setString(_keyUser, json);
  }

  static User getUser() {
    final json = _preferences.getString(_keyUser);
    return json == null ? dummyUser : User.fromJson(jsonDecode(json));
  }
}
