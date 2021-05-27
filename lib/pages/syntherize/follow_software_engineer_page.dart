import 'package:flutter/material.dart';
import 'package:flutter_osc/api/api_repository.dart';

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
      child: Center(
        child: FlatButton(
          child: Text('请求数据'),
          onPressed: () {
            ApiRepository.getSoftwareEngineerList().then((value){
              print('data size = ${value.data?.length}');
            });
          },
        ),
      ),
    );
  }
}
