import 'package:flutter/material.dart';

// 关注页面
class FollowSoftwareEngineersPage extends StatefulWidget {
  @override
  _FollowSoftwareEngineersPageState createState() =>
      _FollowSoftwareEngineersPageState();
}

class _FollowSoftwareEngineersPageState
    extends State<FollowSoftwareEngineersPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: NestedScrollView(
        floatHeaderSlivers: false,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              elevation: 0,
              title: const Text(
                '你可能感兴趣的开源软件作者',
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
              floating: false,
              forceElevated: innerBoxIsScrolled,
            ),
          ];
        },
        body: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //横轴元素个数
              crossAxisCount: 2,
              //纵轴间距
              mainAxisSpacing: 10.0,
              //横轴间距
              crossAxisSpacing: 10.0,
              //子组件宽高长度比例
              childAspectRatio: 1.0,
            ),
            itemCount: 100,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return Text('第$index条');
            }),
      ),
    );
  }
}
