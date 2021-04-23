class CommonModel {
  String _icon;
  String _title;
  String _url;
  String _statusBarColor;
  bool _hideAppBar;

  String get icon => _icon;

  String get title => _title;

  String get url => _url;

  String get statusBarColor => _statusBarColor;

  bool get hideAppBar => _hideAppBar;

  CommonModel(
      {String icon,
      String title,
      String url,
      String statusBarColor,
      bool hideAppBar}) {
    _icon = icon;
    _title = title;
    _url = url;
    _statusBarColor = statusBarColor;
    _hideAppBar = hideAppBar;
  }

  CommonModel.fromJson(dynamic json) {
    _icon = json["icon"];
    _title = json["title"];
    _url = json["url"];
    _statusBarColor = json["statusBarColor"];
    _hideAppBar = json["hideAppBar"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_icon != null) {
      map["icon"] = _icon;
    }
    if (title != null) {
      map["title"] = _title;
    }
    if (_url != null) {
      map["url"] = _url;
    }
    if (_statusBarColor != null) {
      map["statusBarColor"] = _statusBarColor;
    }
    if (_hideAppBar != null) {
      map["hideAppBar"] = _hideAppBar;
    }
    return map;
  }
}
