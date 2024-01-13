
class TopTenInvitationsModel {
  final bool success;
  final Data data;
  final String message;

  TopTenInvitationsModel({
    required this.success,
    required this.data,
    required this.message,
  });

  factory TopTenInvitationsModel.fromJson(Map<String, dynamic> json) => TopTenInvitationsModel(
    success: json["success"],
    data: Data.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data.toJson(),
    "message": message,
  };
}

class Data {
  final List<Top3> top3;
  final List<Top7> top7;

  Data({
    required this.top3,
    required this.top7,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    top3: List<Top3>.from(json["top3"].map((x) => Top3.fromJson(x))),
    top7: List<Top7>.from(json["top7"].map((x) => Top7.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "top3": List<dynamic>.from(top3.map((x) => x.toJson())),
    "top7": List<dynamic>.from(top7.map((x) => x.toJson())),
  };
}

class Top3 {
  final String userDisplayName;
  final String userPhotoUrl;
  final String totalPoints;

  Top3({
    required this.userDisplayName,
    required this.userPhotoUrl,
    required this.totalPoints,
  });

  factory Top3.fromJson(Map<String, dynamic> json) => Top3(
    userDisplayName: json["userDisplayName"],
    userPhotoUrl: json["userPhotoURL"],
    totalPoints: json["total_points"],
  );

  Map<String, dynamic> toJson() => {
    "userDisplayName": userDisplayName,
    "userPhotoURL": userPhotoUrl,
    "total_points": totalPoints,
  };
}

class Top7 {
  final String userDisplayName;
  final String userPhotoUrl;
  final String totalPoints;

  Top7({
    required this.userDisplayName,
    required this.userPhotoUrl,
    required this.totalPoints,
  });

  factory Top7.fromJson(Map<String, dynamic> json) => Top7(
    userDisplayName: json["userDisplayName"],
    userPhotoUrl: json["userPhotoURL"],
    totalPoints: json["total_points"],
  );

  Map<String, dynamic> toJson() => {
    "userDisplayName": userDisplayName,
    "userPhotoURL": userPhotoUrl,
    "total_points": totalPoints,
  };
}
