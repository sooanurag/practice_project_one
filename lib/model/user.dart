class User {
  final String id;
  final String name;
  final String email;
  final String password;
  final String address;
  final String type;
  final String token;
  final String v;

  User({
    this.id="",
    required this.name,
    required this.email,
    required this.password,
    this.address="",
    this.type = "",
    this.token = "",
    this.v = "",
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "email": email,
      "password": password,
      "address": address,
      "type": type,
      "token":token,
      "v": v,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map["_id"] ?? "",
      name: map["name"] ?? "",
      email: map["email"] ?? "",
      password: map["password"] ?? "",
      address: map["address"] ?? "",
      type: map["type"] ?? "",
      token: map["token"],
      v: map["__v"] ?? "",
    );
  }
}
