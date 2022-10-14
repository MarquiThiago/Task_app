import 'package:flutter/material.dart';
import 'package:task_app/global/utilities/consts.dart';
import 'package:task_app/global/utilities/my_calendar.dart';

import 'user.dart';
import 'user_preferences.dart';
import 'profile_widget.dart';
import 'edit_profile_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    const user = UserPreferences.myUser;

    return Builder(
      builder: (context) => Scaffold(
        body: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            ProfileWidget(
              imagePath: user.imagePath,
              onClicked: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const EditProfilePage(),
                  ),
                );
              },
            ),
            const SizedBox(height: 24),
            buildName(user),
            const SizedBox(height: 48),
            buildAbout(user),
          ],
        ),
      ),
    );
  }

  Widget buildName(User user) => Column(
        children: [
          Text(
            user.name,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const SizedBox(height: 4),
          Text(
            user.email,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 17,
            ),
          )
        ],
      );

  Widget buildAbout(User user) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            addVerticalSpace(16),
            Text(
              user.about,
              style: Theme.of(context).textTheme.bodyText2,
            ),
            addVerticalSpace(30),
            Text(
              'Birth day',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            addVerticalSpace(20),
            const MyCalendar(),
          ],
        ),
      );
}
