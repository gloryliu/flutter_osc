import 'package:flutter/material.dart';
import 'package:flutter_osc/api/api_repository.dart';
import 'package:flutter_osc/models/project_banner.dart';
import 'package:flutter_osc/models/software_recommended.dart';

// 软件推荐列表

class SoftwareRecommendPage extends StatefulWidget {
  @override
  _SoftwareRecommendPageState createState() => _SoftwareRecommendPageState();
}

class _SoftwareRecommendPageState extends State<SoftwareRecommendPage> {
  SoftwareList _softwareList = SoftwareList();
  List<SoftWareBanner> _banners = [];

  @override
  void initState() {
    _softwareList.items = [];
    _getRecommendSoftware();
    _getBanners();
    super.initState();
  }

  /// 获取列表
  void _getRecommendSoftware() {
    ApiRepository.getSoftwareList().then((value) {
      print(value.toString());
      setState(() {
        _softwareList.currentSize = value.data?.currentSize;
        _softwareList.items?.addAll(value.data?.items ?? []);
      });
    });
  }

  /// 获取banner
  void _getBanners() {
    ApiRepository.getProjectBannerList().then((value) {
      print(value.toString());
      setState(() {
        _banners.addAll(value.data ?? []);
      });
    });
  }

  /// 头部滚动
  Widget _getNestedScrollViewHeader() {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        physics: AlwaysScrollableScrollPhysics(),
        itemCount: _banners.length,
        itemBuilder: (BuildContext context, int index) {
          var banner = _banners[index];
          var boxWidth = (index == _banners.length - 1) ? 10.0 : 0.0;
          return Container(
            height: 100,
            child: Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Stack(
                  children: [
                    Image.network(
                      banner.img ?? '',
                      fit: BoxFit.fill,
                      width: 200,
                      height: 100,
                    ),
                    Positioned(
                      child: Container(
                        margin: EdgeInsets.only(left: 5, bottom: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              banner.name ?? '',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(banner.detail ?? '',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14)),
                          ],
                        ),
                      ),
                      bottom: 0,
                    ),
                  ],
                ),
                SizedBox(
                  width: boxWidth,
                ),
              ],
            ),
          );
        });
  }

  /// 下面列表
  Widget _getNetstedScrollViewBody() {
    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: (_softwareList.items?.length ?? 0),
      itemBuilder: (BuildContext context, int index) {
        var item = _softwareList.items?[index];
        if ('author' == item?.type) {
          return Text('作者');
        } else if ('project' == item?.type) {
          return Text('项目');
        }
        return Container();
      },
      separatorBuilder: (BuildContext context, int index) {
        return Divider();
      },
    );
  }

  /// 中间菜单
  Widget _getMenus() {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                child: Image.asset('assets/ic_softs.png'),
              ),
              SizedBox(height: 3),
              Text(
                '软件分类',
                style: TextStyle(color: Colors.black54, fontSize: 14),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                child: Image.asset('assets/ic_softs.png'),
              ),
              SizedBox(height: 3),
              Text(
                '热门国产',
                style: TextStyle(color: Colors.black54, fontSize: 14),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                child: Image.asset('assets/ic_softs.png'),
              ),
              SizedBox(height: 3),
              Text(
                '最新软件',
                style: TextStyle(color: Colors.black54, fontSize: 14),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                child: Image.asset('assets/ic_softs.png'),
              ),
              SizedBox(height: 3),
              Text(
                '开源公司',
                style: TextStyle(color: Colors.black54, fontSize: 14),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList(
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
          if (index == 0) {
            return Container(
              height: 100,
              child: _getNestedScrollViewHeader(),
            );
          } else if (index == 1) {
            return _getMenus();
          } else if (index == 2) {
            return _getNetstedScrollViewBody();
          } else {
            return Container();
          }
        }, childCount: 3)),
      ],
    );
  }
}
