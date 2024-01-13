
class DetailsGiftModel {
  final bool success;
  final Data data;
  final String message;

  DetailsGiftModel({
    required this.success,
    required this.data,
    required this.message,
  });

  factory DetailsGiftModel.fromJson(Map<String, dynamic> json) => DetailsGiftModel(
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
  final int id;
  final String imageMain;
  final String icon;
  final List<ListOffer> listOffers;

  Data({
    required this.id,
    required this.imageMain,
    required this.icon,
    required this.listOffers,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    imageMain: json["image_main"],
    icon: json["icon"],
    listOffers: List<ListOffer>.from(json["list_offers"].map((x) => ListOffer.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image_main": imageMain,
    "icon": icon,
    "list_offers": List<dynamic>.from(listOffers.map((x) => x.toJson())),
  };
}

class ListOffer {
  final int id;
  final String amount;
  final String points;

  ListOffer({
    required this.id,
    required this.amount,
    required this.points,
  });

  factory ListOffer.fromJson(Map<String, dynamic> json) => ListOffer(
    id: json["id"],
    amount: json["amount"],
    points: json["points"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "amount": amount,
    "points": points,
  };
}
