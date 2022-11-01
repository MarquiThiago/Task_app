import 'package:flutter/material.dart';
import 'package:task_app/global/utilities/space.dart';
import 'package:task_app/global/utilities/my_button.dart';
import '../../global/data/user_preferences.dart';
import '../../global/models/user.dart';
import '../../global/itens/profile_widget.dart';
import '../../global/utilities/profile_field.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  EditProfilePageState createState() => EditProfilePageState();
}

class EditProfilePageState extends State<EditProfilePage> {
  User user = UserPreferences.dummyUser;

  @override
  Widget build(BuildContext context) => Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(elevation: 0),
          body: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            physics: const BouncingScrollPhysics(),
            children: [
              ProfileWidget(
                imagePath: user.imagePath,
                isEdit: true,
                onClicked: () async {},
              ),
              addVerticalSpace(20),
              TextFieldWidget(
                label: 'Image Avatar',
                text: user.imagePath,
                onChanged: (imagePath) =>
                    user = user.copy(imagePath: imagePath),
              ),
              addVerticalSpace(20),
              TextFieldWidget(
                label: 'Complete name',
                text: user.name,
                onChanged: (name) => user = user.copy(name: name),
              ),
              addVerticalSpace(20),
              TextFieldWidget(
                label: 'Email',
                text: user.email,
                onChanged: (email) => user = user.copy(email: email),
              ),
              addVerticalSpace(20),
              TextFieldWidget(
                maxLines: 3,
                label: 'About',
                text: user.about,
                onChanged: (about) => user = user.copy(about: about),
              ),
              addVerticalSpace(20),
              TextFieldWidget(
                label: 'Add your birthDay',
                text: user.birthDay,
                onChanged: (birthDay) => user = user.copy(birthDay: birthDay),
              ),
              addVerticalSpace(20),
              TextFieldWidget(
                label: 'What is your favorite sport?',
                text: user.favSport,
                onChanged: (favSport) => user = user.copy(favSport: favSport),
              ),
              addVerticalSpace(10),
              MyButton(
                  text: 'Save',
                  onPressed: () {
                    UserPreferences.setUser(user);
                    Navigator.of(context).pop(context);
                  })
            ],
          ),
        ),
      );
}
