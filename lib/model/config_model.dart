class ConfigModel {
  String _searchUrl;

  String get searchUrl => _searchUrl;

  ConfigModel({String searchUrl}) {
    _searchUrl = searchUrl;
  }

  ConfigModel.fromJson(dynamic json) {
    _searchUrl = json["searchUrl"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_searchUrl != null) {
      map["searchUrl"] = _searchUrl;
    }
    return map;
  }
}
