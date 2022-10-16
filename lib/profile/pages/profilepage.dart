import 'package:flutter/material.dart';
import 'package:task_app/global/utilities/consts.dart';
import '../../global/data/user_preferences.dart';
import '../../test_widgets/profile_widget.dart';
import 'profile_edit_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.getUser();

    return Builder(
      builder: (context) => Scaffold(
        body: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            ProfileWidget(
              imagePath: user.imagePath,
              onClicked: () async {
                await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const EditProfilePage(),
                  ),
                );
                setState(() {});
              },
            ),
            addVerticalSpace(24),
            Column(
              children: [
                Text(
                  user.name,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
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
            ),
            addVerticalSpace(48),
            Container(
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
                  addVerticalSpace(16),
                  Text(
                    user.birthDay,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  addVerticalSpace(30),
                  Text(
                    'Favorite sport',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  addVerticalSpace(16),
                  Text(
                    user.favSport,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
