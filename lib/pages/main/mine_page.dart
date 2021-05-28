import 'package:flutter/material.dart';

// 我的页面

class MinePage extends StatefulWidget {
  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            _createHeader(),
            _createMenu(),
            _createSettingMenus(),
          ],
        ),
      ),
    );
  }

  Widget _createHeader() {
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(
                left: 20, top: MediaQuery.of(context).padding.top + 20),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: Image.network(
                    'https://avatars.githubusercontent.com/u/10879203?v=4',
                    width: 80,
                    height: 80,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  '点击头像登陆',
                  style: TextStyle(color: Colors.black, fontSize: 18),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '0',
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                      Text(
                        '收藏',
                        style: TextStyle(color: Colors.black54, fontSize: 14),
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '0',
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                      Text(
                        '关注',
                        style: TextStyle(color: Colors.black54, fontSize: 14),
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '0',
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                      Text(
                        '粉丝',
                        style: TextStyle(color: Colors.black54, fontSize: 14),
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '0',
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                      Text(
                        '勋章',
                        style: TextStyle(color: Colors.black54, fontSize: 14),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _createMenu() {
    List<String> icons = [
      'assets/img_user_blog.png',
      'assets/img_user_tweet.png',
      'assets/img_user_question.png',
      'assets/img_user_pub.png',
      'assets/img_user_read_history.png',
      'assets/img_user_radar.png',
      'assets/img_user_event.png',
      'assets/img_user_card.png',
    ];
    List<String> labels = [
      '博客',
      '动弹',
      '问答',
      '投递',
      '阅读历史',
      '技能雷达',
      '我的活动',
      '我的名片',
    ];
    List<Widget> menus = [];
    for (int i = 0; i < 8; i++) {
      menus.add(Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                icons[i],
                width: 20,
                height: 20,
              ),
              SizedBox(height: 5),
              Text(
                labels[i],
                style: TextStyle(color: Colors.black, fontSize: 14),
              )
            ],
          ),
        ),
      ));
    }
    return GridView.count(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 4,
      children: menus,
    );
  }

  Widget _createSettingMenus() {
    List<String> icons = [
      'assets/img_user_tags.png',
      'assets/img_user_black_list.png',
      'assets/img_user_setting.png',
      'assets/img_user_share.png',
      'assets/img_user_feedback.png',
      'assets/img_user_about.png',
    ];
    List<String> labels = [
      '阅读标签管理',
      '我的灰名单',
      '系统设置',
      '邀请好友',
      '反馈',
      '关于',
    ];
    return Container(
      // padding: EdgeInsets.only(left: 10, right: 10),
      child: ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: labels.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: Image.asset(
                icons[index],
                width: 20,
                height: 20,
              ),
              title: Text(
                labels[index],
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
              trailing: Image.asset(
                'assets/ic_arrow_right.png',
                width: 15,
                height: 16,
              ),
            );
          }),
    );
  }
}
