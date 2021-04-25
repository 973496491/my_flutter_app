import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:my_flutter_app/dao/home_dao.dart';
import 'package:my_flutter_app/model/common_model.dart';
import 'package:my_flutter_app/model/grid_nav_model.dart';
import 'package:my_flutter_app/model/home_model.dart';
import 'package:my_flutter_app/model/sales_box_model.dart';
import 'package:my_flutter_app/widget/grid_nav.dart';
import 'package:my_flutter_app/widget/loading_container.dart';
import 'package:my_flutter_app/widget/local_nav.dart';
import 'package:my_flutter_app/widget/sales_box.dart';
import 'package:my_flutter_app/widget/sub_nav.dart';
import 'package:my_flutter_app/widget/webview.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

const APPBAR_SCROLL_OFFSET = 100;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CommonModel> _bannerList = [];
  List<CommonModel> _localNavList = [];
  List<CommonModel> _subNavList = [];
  GridNavModel _gridNavModel;
  SalesBoxModel _salesBoxModel;

  var _appBarAlpha = ValueNotifier(0.0);
  var _loadingStatus = true;
  var _refreshController = RefreshController(initialRefresh: false);
  var _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _handleRefresh();

    _scrollController.addListener(() {
      _onScroll(_scrollController.offset);
    });
  }

  // 滑动监听
  _onScroll(offset) {
    double alpha = offset / APPBAR_SCROLL_OFFSET;
    if (alpha < 0) {
      alpha = 0;
    } else if (alpha > 1) {
      alpha = 1;
    }
    _appBarAlpha.value = alpha;
  }

  Future<Null> _handleRefresh() async {
    try {
      HomeModel model = await HomeDao.fetch();
      setState(() {
        _localNavList = model.localNavList;
        _subNavList = model.subNavList;
        _gridNavModel = model.gridNav;
        _salesBoxModel = model.salesBox;
        _bannerList = model.bannerList;
        _loadingStatus = false;
        _refreshController.refreshCompleted();
      });
    } catch (e) {
      setState(() {
        print(e);
        setState(() {
          _loadingStatus = false;
          _refreshController.refreshCompleted();
        });
      });
    }
    return null;
  }

  @override
  void dispose() {
    _appBarAlpha.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff2f2f2),
      body: LoadingContainer(
        isLoading: _loadingStatus,
        child: Stack(
          children: <Widget>[
            MediaQuery.removePadding(
              removeTop: true,
              context: context,
              child: SmartRefresher(
                onRefresh: _handleRefresh,
                controller: _refreshController,
                scrollController: _scrollController,
                child: _body,
              ),
            ),
            ValueListenableBuilder(
              valueListenable: _appBarAlpha,
              builder: (BuildContext context, double alpha, Widget child) {
                return _titleView(alpha);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget get _body {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          _bannerView,
          Padding(
              padding: EdgeInsets.fromLTRB(7, 4, 7, 4),
              child: LocalNav(localNavList: _localNavList)),
          Padding(
            padding: EdgeInsets.fromLTRB(7, 0, 7, 4),
            child: GridNav(gridNavModel: _gridNavModel,),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(7, 0, 7, 4),
            child: SubNav(subNavList: _subNavList),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(7, 0, 7, 4),
            child: SalesBox(salesBox: _salesBoxModel),
          ),
        ],
      ),
    );
  }

  // Title
  Widget _titleView(double alpha) {
    return Opacity(
      opacity: alpha,
      child: Container(
        height: 80,
        decoration: BoxDecoration(color: Colors.white),
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(top: 20),
            child: Text('首页'),
          ),
        ),
      ),
    );
  }

  // Banner
  Widget get _bannerView {
    return Container(
      height: 160,
      child: Swiper(
        itemCount: _bannerList.length,
        autoplay: true,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                MaterialPageRoute(builder: (context) {
                    var model = _bannerList[index];
                    return WebView(
                      url: model.url,
                      title: model.title,
                      hideAppBar: model.hideAppBar,
                    );
                  }),
              );
            },
            child: Image.network(
              _bannerList[index].icon,
              fit: BoxFit.cover,
            ),
          );
        },
        pagination: SwiperPagination(),
      ),
    );
  }
}
