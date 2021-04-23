import 'package:my_flutter_app/model/common_model.dart';

class SalesBoxModel {
  String _icon;
  String _moreUrl;
  CommonModel _bigCard1;
  CommonModel _bigCard2;
  CommonModel _smallCard1;
  CommonModel _smallCard2;
  CommonModel _smallCard3;
  CommonModel _smallCard4;

  String get icon => _icon;

  String get moreUrl => _moreUrl;

  CommonModel get bigCard1 => _bigCard1;

  CommonModel get bigCard2 => _bigCard2;

  CommonModel get smallCard1 => _smallCard1;

  CommonModel get smallCard2 => _smallCard2;

  CommonModel get smallCard3 => _smallCard3;

  CommonModel get smallCard4 => _smallCard4;

  SalesBoxModel(
      {String icon,
      String moreUrl,
      CommonModel bigCard1,
      CommonModel bigCard2,
      CommonModel smallCard1,
      CommonModel smallCard2,
      CommonModel smallCard3,
      CommonModel smallCard4}) {
    _icon = icon;
    _moreUrl = moreUrl;
    _bigCard1 = bigCard1;
    _bigCard2 = bigCard2;
    _smallCard1 = smallCard1;
    _smallCard2 = smallCard2;
    _smallCard3 = smallCard3;
    _smallCard4 = smallCard4;
  }

  factory SalesBoxModel.fromJson(Map<String, dynamic> json) {
    return SalesBoxModel(
      icon: json['icon'],
      moreUrl: json['moreUrl'],
      bigCard1: CommonModel.fromJson(json['bigCard1']),
      bigCard2: CommonModel.fromJson(json['bigCard2']),
      smallCard1: CommonModel.fromJson(json['smallCard1']),
      smallCard2: CommonModel.fromJson(json['smallCard2']),
      smallCard3: CommonModel.fromJson(json['smallCard3']),
      smallCard4: CommonModel.fromJson(json['smallCard4']),
    );
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_icon != null) {
      map["icon"] = _icon;
    }
    if (_moreUrl != null) {
      map["moreUrl"] = _moreUrl;
    }
    if (_bigCard1 != null) {
      map["bigCard1"] = _bigCard1.toJson();
    }
    if (_bigCard2 != null) {
      map["bigCard2"] = _bigCard2.toJson();
    }
    if (_smallCard1 != null) {
      map["smallCard1"] = _smallCard1.toJson();
    }
    if (_smallCard2 != null) {
      map["smallCard2"] = _smallCard2.toJson();
    }
    if (_smallCard3 != null) {
      map["smallCard3"] = _smallCard3.toJson();
    }
    if (_smallCard4 != null) {
      map["smallCard4"] = _smallCard4.toJson();
    }
    return map;
  }
}
