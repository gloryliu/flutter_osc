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
      setState(() {
        _softwareList.currentSize = value.data?.currentSize;
        _softwareList.items?.addAll(value.data?.items ?? []);
      });
    });
  }

  /// 获取banner
  void _getBanners() {
    ApiRepository.getProjectBannerList().then((value) {
      _banners.addAll(value.data ?? []);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: 1,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _banners.length,
                    itemBuilder: (BuildContext context, int index) {
                      var banner = _banners[index];
                      return Image.network(banner.img ?? '');
                    }),
                ListView.separated(
                  itemCount: _softwareList.items?.length ?? 0,
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
                )
              ],
            );
          }),
    );
  }
}
