import 'package:flutter/material.dart';
import 'package:flutter_osc/utils/assets_color.dart';

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
              return Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black26,
                    width: 0.5,
                  ),
                  borderRadius:
                  BorderRadius.circular(5), // 也可控件一边圆角大小
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(60),
                        child: Container(
                          child: Image.network(
                            'https://avatars.githubusercontent.com/u/10879203?v=4',
                            width: 60,
                            height: 60,
                          ),
                        ),
                      ),
                      Text(
                        '张三',
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      ),
                      Text(
                        'java作者',
                        style: TextStyle(color: Colors.black26, fontSize: 12),
                      ),
                      FlatButton(
                        onPressed: () {},
                        child: Container(
                          padding: EdgeInsets.only(
                              left: 10, top: 2, right: 10, bottom: 2),
                          decoration: BoxDecoration(
                            color: Color(color_ff24cf5f), // 边色与边宽度
                            borderRadius:
                            BorderRadius.circular(5), // 也可控件一边圆角大小
                          ),
                          child: Text(
                            '+ 关注',
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
