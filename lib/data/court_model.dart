class Court {
  String? key;
  CourtData? courtData;

  Court(this.key, this.courtData);
}

class CourtData {
  String? name;
  String? imagePath;
  String? place;
  double? ticketPrice;


  CourtData( this.name, this.imagePath, this.place, this.ticketPrice);

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "image": imagePath,
      "place": place,
      "ticket_price": ticketPrice,
    };
  }

  CourtData.fromJson(Map<dynamic, dynamic> json) {
    name = json["name"];
    imagePath = json["image"];
    place = json["place"];
    ticketPrice = checkDouble(json["ticket_price"]);
  }

  double? checkDouble(value) {
    if (value is String) {
      return double.parse(value);
    } else if (value is double) {
      return value;
    } else if (value is int) {
      return double.parse(value.toString());
    } else {
      return 0.0;
    }
  }

  int? checkInteger(established) {
    if (established is String) {
      return int.parse(established);
    } else if (established is double) {
      return int.parse(established.toString());
    } else if (established is int) {
      return established;
    } else {
      return 0;
    }
  }
}
