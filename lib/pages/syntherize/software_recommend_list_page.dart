
import 'package:flutter/material.dart';
import 'package:flutter_osc/api/api_repository.dart';

// 软件推荐列表

class SoftwareRecommendPage extends StatefulWidget {
  @override
  _SoftwareRecommendPageState createState() => _SoftwareRecommendPageState();
}

class _SoftwareRecommendPageState extends State<SoftwareRecommendPage> {

  @override
  void initState() {
    _getRecommendSoftware();
    super.initState();
  }

  void _getRecommendSoftware() {
    ApiRepository.getSoftwareList().then((value){
      print('list currentSize = ${value.data?.currentSize}');
      print('list size = ${value.data?.items?.length}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('软件列表'),
    );
  }
}
