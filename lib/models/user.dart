class User {
  final String imagePath;
  final String name;
  final String email;
  final String about;
  final String birthDay;
  final String favSport;

  const User({
    required this.imagePath,
    required this.name,
    required this.email,
    required this.about,
    required this.birthDay,
    required this.favSport,
  });

  User copy({
    final String? imagePath,
    final String? name,
    final String? email,
    final String? about,
    final String? birthDay,
    final String? favSport,
  }) =>
      User(
        imagePath: imagePath ?? this.imagePath,
        name: name ?? this.name,
        email: email ?? this.email,
        about: about ?? this.about,
        birthDay: birthDay ?? this.birthDay,
        favSport: favSport ?? this.favSport,
      );

  static User fromJson(Map<String, dynamic> json) => User(
        imagePath: json['imagePath'],
        name: json['name'],
        email: json['email'],
        about: json['about'],
        birthDay: json['birthDay'],
        favSport: json['favSport'],
      );

  Map<String, dynamic> toJason() => {
        'imagePath': imagePath,
        'name': name,
        'email': email,
        'about': about,
        'birthDay': birthDay,
        'favSport': favSport,
      };
}
