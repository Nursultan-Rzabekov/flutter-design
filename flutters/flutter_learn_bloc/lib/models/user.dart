class User {
  int id;
  String name;
  String email;
  String phone;

  User({this.id, this.name, this.email, this.phone});

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int,
        name = json['name'] as String,
        email = json['email'] as String,
        phone = json['phone'] as String;

  Map<String, dynamic> toJson() =>
      {'id': id, 'name': name, 'email': email, 'phone': phone};
}
