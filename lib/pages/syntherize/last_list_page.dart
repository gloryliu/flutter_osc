import 'package:flutter/material.dart';
import 'package:flutter_osc/utils/assets_color.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

/// 最新资讯信息列表
class LastInfoPage extends StatefulWidget {
  const LastInfoPage({Key? key}) : super(key: key);

  @override
  _LastInfoPageState createState() => _LastInfoPageState();
}

class _LastInfoPageState extends State<LastInfoPage> {
  final List<String> _bannerImg = [
    'https://static.oschina.net/uploads/cooperation/75410/google-beta-natural-language-api_c5fe12a9-518c-4aa9-a94d-907193c06d8f.png',
    'https://static.oschina.net/uploads/space/2021/0403/083749_OeNC_2720166.png',
    'https://oscimg.oschina.net/oscnet/up-1e817b83c130d04fc1460f8c9ce0f39c153.png',
    'https://static.oschina.net/uploads/space/2021/0324/074319_c7Ao_2720166.jpg',
    'https://static.oschina.net/uploads/space/2021/0325/083317_8ezN_2720166.png',
  ];

  /// 列表
  Widget _getInfoListWidget() {
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (content, index) {
          return _InfoListItemWidget();
        },
        itemCount: 100,
      ),
    );
  }

  /// banner
  Widget _getBannerWidget() {
    return Container(
        margin: EdgeInsets.all(10),
        child: Swiper(
          itemBuilder: (BuildContext context, int index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.network(
                _bannerImg[index],
                fit: BoxFit.fill,
              ),
            );
          },
          itemCount: _bannerImg.length,
          autoplay: true,
          pagination: new SwiperPagination(
              alignment: Alignment.bottomRight,
              builder: DotSwiperPaginationBuilder(
                  activeColor: Color(color_ff24cf5f))),
          control: new SwiperControl(),
        ));
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
              height: 120,
              child: _getBannerWidget(),
            );
          } else if (index == 1) {
            return _getInfoListWidget();
          } else {
            return Container();
          }
        }, childCount: 2)),
      ],
    );
  }
}

/// 最新列表item
class _InfoListItemWidget extends StatefulWidget {
  const _InfoListItemWidget({Key? key}) : super(key: key);

  @override
  __InfoListItemWidgetState createState() => __InfoListItemWidgetState();
}

class __InfoListItemWidgetState extends State<_InfoListItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(children: [
        Expanded(child: Column(
          children: [
            Text('data')
          ],
        )),
        Image.network('https://oscimg.oschina.net/oscnet/up-1e817b83c130d04fc1460f8c9ce0f39c153.png')
      ],),
    );
  }
}
