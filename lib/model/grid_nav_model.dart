import 'package:my_flutter_app/model/common_model.dart';

class GridNavModel {
  GridNavItem _hotel;
  GridNavItem _flight;
  GridNavItem _travel;

  GridNavItem get hotel => _hotel;

  GridNavItem get flight => _flight;

  GridNavItem get travel => _travel;

  GridNavModel({GridNavItem hotel, GridNavItem flight, GridNavItem travel}) {
    _hotel = hotel;
    _flight = flight;
    _travel = travel;
  }

  factory GridNavModel.fromJson(Map<String, dynamic> json) {
    return json != null
        ? GridNavModel(
            hotel: GridNavItem.fromJson(json['hotel']),
            flight: GridNavItem.fromJson(json['flight']),
            travel: GridNavItem.fromJson(json['travel']),
          )
        : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["hotel"] = _hotel.toJson();
    map["flight"] = _flight.toJson();
    map["travel"] = _travel.toJson();
    return map;
  }
}

class GridNavItem {
  String _startColor;
  String _endColor;
  CommonModel _mainItem;
  CommonModel _item1;
  CommonModel _item2;
  CommonModel _item3;
  CommonModel _item4;

  String get startColor => _startColor;

  String get endColor => _endColor;

  CommonModel get mainItem => _mainItem;

  CommonModel get item1 => _item1;

  CommonModel get item2 => _item2;

  CommonModel get item3 => _item3;

  CommonModel get item4 => _item4;

  GridNavItem(
      {String startColor,
      String endColor,
      CommonModel mainItem,
      CommonModel item1,
      CommonModel item2,
      CommonModel item3,
      CommonModel item4}) {
    _startColor = startColor;
    _endColor = endColor;
    _mainItem = mainItem;
    _item1 = item1;
    _item2 = item2;
    _item3 = item3;
    _item4 = item4;
  }

  factory GridNavItem.fromJson(Map<String, dynamic> json) {
    return GridNavItem(
      startColor: json['startColor'],
      endColor: json['endColor'],
      mainItem: CommonModel.fromJson(json['mainItem']),
      item1: CommonModel.fromJson(json['item1']),
      item2: CommonModel.fromJson(json['item2']),
      item3: CommonModel.fromJson(json['item3']),
      item4: CommonModel.fromJson(json['item4']),
    );
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_startColor != null) {
      map["startColor"] = _startColor;
    }
    if (_endColor != null) {
      map["endColor"] = _endColor;
    }
    if (_mainItem != null) {
      map["mainItem"] = _mainItem.toJson();
    }
    if (_item1 != null) {
      map["item1"] = _item1.toJson();
    }
    if (_item2 != null) {
      map["item2"] = _item2.toJson();
    }
    if (_item3 != null) {
      map["item3"] = _item3.toJson();
    }
    if (_item4 != null) {
      map["item4"] = _item4.toJson();
    }
    return map;
  }
}
