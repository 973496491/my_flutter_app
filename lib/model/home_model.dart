import 'package:my_flutter_app/model/common_model.dart';
import 'package:my_flutter_app/model/config_model.dart';
import 'package:my_flutter_app/model/grid_nav_model.dart';
import 'package:my_flutter_app/model/sales_box_model.dart';

class HomeModel {
  ConfigModel _config;
  List<CommonModel> _bannerList;
  List<CommonModel> _localNavList;
  List<CommonModel> _subNavList;
  GridNavModel _gridNav;
  SalesBoxModel _salesBox;

  ConfigModel get config => _config;

  List<CommonModel> get bannerList => _bannerList;

  List<CommonModel> get localNavList => _localNavList;

  List<CommonModel> get subNavList => _subNavList;

  GridNavModel get gridNav => _gridNav;

  SalesBoxModel get salesBox => _salesBox;

  HomeModel(
      {ConfigModel config,
      List<CommonModel> bannerList,
      List<CommonModel> localNavList,
      List<CommonModel> subNavList,
      GridNavModel gridNav,
      SalesBoxModel salesBox}) {
    _config = config;
    _bannerList = bannerList;
    _localNavList = localNavList;
    _subNavList = subNavList;
    _gridNav = gridNav;
    _salesBox = salesBox;
  }

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    var localNavListJson = json['localNavList'] as List;
    List<CommonModel> localNavList =
        localNavListJson.map((e) => CommonModel.fromJson(e)).toList();

    var bannerListJson = json['bannerList'] as List;
    List<CommonModel> bannerList =
        bannerListJson.map((e) => CommonModel.fromJson(e)).toList();

    var subNavListJson = json['subNavList'] as List;
    List<CommonModel> subNavList =
        subNavListJson.map((e) => CommonModel.fromJson(e)).toList();

    return HomeModel(
      localNavList: localNavList,
      bannerList: bannerList,
      subNavList: subNavList,
      config: ConfigModel.fromJson(json['config']),
      gridNav: GridNavModel.fromJson(json['gridNav']),
      salesBox: SalesBoxModel.fromJson(json['salesBox']),
    );
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_config != null) {
      map["config"] = _config.toJson();
    }
    if (_bannerList != null) {
      map["bannerList"] = _bannerList.map((v) => v.toJson()).toList();
    }
    if (_localNavList != null) {
      map["localNavList"] = _localNavList.map((v) => v.toJson()).toList();
    }
    if (_gridNav != null) {
      map["gridNav"] = _gridNav.toJson();
    }
    if (_subNavList != null) {
      map["subNavList"] = _subNavList.map((v) => v.toJson()).toList();
    }
    if (_salesBox != null) {
      map["salesBox"] = _salesBox.toJson();
    }
    return map;
  }
}
