class UserModel {
  final String accessToken;
  final String tokenType;
  final User user;

  UserModel({
    required this.accessToken,
    required this.tokenType,
    required this.user,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        accessToken: json["access_token"],
        tokenType: json["token_type"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "token_type": tokenType,
        "user": user.toJson(),
      };
}

class User {
  final int id;
  final String name;
  final String email;
  final dynamic emailVerifiedAt;
  final String phone;
  final String image;
  final dynamic totalPoints;
  final DateTime createdAt;
  final DateTime updatedAt;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.emailVerifiedAt,
    required this.phone,
    required this.image,
    required this.totalPoints,
    required this.createdAt,
    required this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        phone: json["phone"],
        image: json["image"],
        totalPoints: json["total_points"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "phone": phone,
        "image": image,
        "total_points": totalPoints,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
