
class GiftsModel {
  final bool success;
  final List<Datum> data;
  final String message;

  GiftsModel({
    required this.success,
    required this.data,
    required this.message,
  });

  factory GiftsModel.fromJson(Map<String, dynamic> json) => GiftsModel(
    success: json["success"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "message": message,
  };
}

class Datum {
  final int id;
  final String imageMain;

  Datum({
    required this.id,
    required this.imageMain,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    imageMain: json["image_main"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image_main": imageMain,
  };
}
