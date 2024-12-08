import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
    String id;
    String name;
    String email;
    int age;
    String phone;
    String city;
    String country;

    User({
        required this.id,
        required this.name,
        required this.email,
        required this.age,
        required this.phone,
        required this.city,
        required this.country,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["user_id"],
        name: json["name"],
        email: json["email"],
        age: json["age"],
        phone: json["phone"],
        city: json["city"],
        country: json["country"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "age": age,
        "phone": phone,
        "city": city,
        "country": country,
    };

    Map<String, dynamic> toMap() => toJson();
}
