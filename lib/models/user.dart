class User {
  Name? name;
  Picture? picture;
  String? email;
  String? phone;

  User({this.name, this.picture, this.email, this.phone});

  User.fromJson(Map<String, dynamic> json)
      : name = Name.fromJson(json['name']),
        picture = Picture.fromJson(json['picture']),
        email = json['email'],
        phone = json['phone'];

  @override
  String toString() {
    return 'User{name: $name, picture: $picture, email: $email, phone: $phone}';
  }
}

class Name {
  String? last;
  String? first;

  Name({this.last, this.first});

  Name.fromJson(Map<String, dynamic> json)
      : last = json['last'],
        first = json['first'];
}

class Picture {
  String? medium;

  Picture({this.medium});

  Picture.fromJson(Map<String, dynamic> json) : medium = json['large'];
}
