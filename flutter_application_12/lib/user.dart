class User {
  String name;
  String country;
  String email;
  String picture;

  User({
    required this.name,
    required this.country,
    required this.email,
    required this.picture,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name:
          "${json['name']['title']} ${json['name']['first']} ${json['name']['last']}",
      country: json['location']['country'],
      email: json['email'],
      picture: json['picture']['medium'],
    );
  }
}
