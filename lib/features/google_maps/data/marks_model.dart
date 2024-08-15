class MarksModel {
  MarksModel({
      String? id, 
      String? address,
      double? latitude,
      double? longitude,
      BakeryHours? bakeryHours, 
      DeliveryHours? deliveryHours,}){
    _id = id;
    _address = address;
    _latitude = latitude;
    _longitude = longitude;
    _bakeryHours = bakeryHours;
    _deliveryHours = deliveryHours;
}

  MarksModel.fromJson(dynamic json) {
    _id = json['id'];
    _address = json['address'];
    _latitude = json['latitude'];
    _longitude = json['longitude'];
    _bakeryHours = json['bakery_hours'] != null ? BakeryHours.fromJson(json['bakery_hours']) : null;
    _deliveryHours = json['delivery_hours'] != null ? DeliveryHours.fromJson(json['delivery_hours']) : null;
  }
  String? _id;
  String? _address;
  double? _latitude;
  double? _longitude;
  BakeryHours? _bakeryHours;
  DeliveryHours? _deliveryHours;

  String? get id => _id;
  String? get address => _address;
  double? get latitude => _latitude;
  double? get longitude => _longitude;
  BakeryHours? get bakeryHours => _bakeryHours;
  DeliveryHours? get deliveryHours => _deliveryHours;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['address'] = _address;
    map['latitude'] = _latitude;
    map['longitude'] = _longitude;
    if (_bakeryHours != null) {
      map['bakery_hours'] = _bakeryHours?.toJson();
    }
    if (_deliveryHours != null) {
      map['delivery_hours'] = _deliveryHours?.toJson();
    }
    return map;
  }

}

class DeliveryHours {
  DeliveryHours({
      String? openAt, 
      String? closeAt, 
      bool? isOpen,}){
    _openAt = openAt;
    _closeAt = closeAt;
    _isOpen = isOpen;
}

  DeliveryHours.fromJson(dynamic json) {
    _openAt = json['open_at'];
    _closeAt = json['close_at'];
    _isOpen = json['is_open'];
  }
  String? _openAt;
  String? _closeAt;
  bool? _isOpen;

  String? get openAt => _openAt;
  String? get closeAt => _closeAt;
  bool? get isOpen => _isOpen;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['open_at'] = _openAt;
    map['close_at'] = _closeAt;
    map['is_open'] = _isOpen;
    return map;
  }

}

class BakeryHours {
  BakeryHours({
      String? openAt, 
      String? closeAt, 
      bool? isOpen,}){
    _openAt = openAt;
    _closeAt = closeAt;
    _isOpen = isOpen;
}

  BakeryHours.fromJson(dynamic json) {
    _openAt = json['open_at'];
    _closeAt = json['close_at'];
    _isOpen = json['is_open'];
  }
  String? _openAt;
  String? _closeAt;
  bool? _isOpen;

  String? get openAt => _openAt;
  String? get closeAt => _closeAt;
  bool? get isOpen => _isOpen;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['open_at'] = _openAt;
    map['close_at'] = _closeAt;
    map['is_open'] = _isOpen;
    return map;
  }

}