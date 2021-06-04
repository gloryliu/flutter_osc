import 'package:flutter/material.dart';
import 'package:flutter_osc/api/api_repository.dart';
import 'package:flutter_osc/models/project_banner.dart';
import 'package:flutter_osc/models/software_recommended.dart';
import 'package:flutter_osc/utils/assets_color.dart';
import 'package:flutter_osc/widgets/flag_widget.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

// 软件推荐列表

class SoftwareRecommendPage extends StatefulWidget {
  @override
  _SoftwareRecommendPageState createState() => _SoftwareRecommendPageState();
}

class _SoftwareRecommendPageState extends State<SoftwareRecommendPage> {
  int pageSize = 20;
  int page = 1;

  SoftwareList _softwareList = SoftwareList();
  List<SoftWareBanner> _banners = [];

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void initState() {
    _softwareList.items = [];
    _getRecommendSoftware();
    _getBanners();
    super.initState();
  }

  /// 下拉刷新
  void _onRefresh() async {
    page = 1;
    _getRecommendSoftware();
  }

  /// 上拉加载更多
  void _onLoading() async {
    _getRecommendSoftware();
  }

  /// 刷新和加载完成
  void _smartRefreshFinish() {
    _refreshController.refreshCompleted();
    _refreshController.loadComplete();
  }

  /// 获取列表
  void _getRecommendSoftware() {
    ApiRepository.getSoftwareList(pageSize, page).then((value) {
      if (value.data == null) {
        _smartRefreshFinish();
        return;
      }
      if (value.data?.items != null) {
        if (page == 1) {
          _softwareList.items?.clear();
        }
        _softwareList.currentSize = value.data?.currentSize;
        _softwareList.items?.addAll(value.data?.items ?? []);
        int size = value.data?.items?.length ?? 0;
        if (size >= pageSize) {
          page++;
        }
      }
      setState(() {});
      _smartRefreshFinish();
    }).onError((error, stackTrace) {
      _smartRefreshFinish();
    });
  }

  /// 获取banner
  void _getBanners() {
    ApiRepository.getProjectBannerList().then((value) {
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
          return Container(
            height: 100,
            child: _AuthorList(item?.authors),
          );
        } else if ('project' == item?.type) {
          return _ProjectListItemWidget(item?.project);
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
    return SmartRefresher(
      enablePullUp: true,
      enablePullDown: true,
      controller: _refreshController,
      onRefresh: _onRefresh,
      onLoading: _onLoading,
      header: WaterDropHeader(),
      child: CustomScrollView(
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
              return Container(
                height: 50,
                margin: EdgeInsets.only(left: 10),
                alignment: Alignment.centerLeft,
                child: Text(
                  '编辑推荐',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              );
            } else if (index == 3) {
              return _getNetstedScrollViewBody();
            } else {
              return Container();
            }
          }, childCount: 4)),
        ],
      ),
    );
  }
}

/// 项目item布局
class _ProjectListItemWidget extends StatefulWidget {
  Project? _project;
  _ProjectListItemWidget(this._project);

  @override
  _ProjectListItemWidgetState createState() => _ProjectListItemWidgetState();
}

class _ProjectListItemWidgetState extends State<_ProjectListItemWidget> {
  Widget _getProjectLogoWidget(String? logo) {
    if (logo == null || logo == '') {
      return Container();
    }
    return Container(
      margin: EdgeInsets.only(left: 10),
      child: Image.network(
        widget._project?.logo ?? '',
        height: 50,
        width: 50,
      ),
    );
  }

  List<InlineSpan> _getFlagWidget() {
    List<InlineSpan> widgets = [];
    if (widget._project?.recommend == true) {
      widgets.add(WidgetSpan(child: const FlagText('荐')));
      widgets.add(WidgetSpan(child: const SizedBox(width: 4)));
    }

    if (widget._project?.cn == true) {
      widgets.add(WidgetSpan(
          child: const FlagText('国', backGroundColor: Colors.redAccent)));
      widgets.add(WidgetSpan(child: const SizedBox(width: 4)));
    }
    widgets.add(TextSpan(
        text: widget._project?.name,
        style: TextStyle(
            color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold)));
    widgets.add(TextSpan(text: '  '));
    widgets.add(TextSpan(
        text: widget._project?.title,
        style: TextStyle(color: Colors.black54, fontSize: 14)));
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  text: TextSpan(children: _getFlagWidget()),
                ),
                Text(widget._project?.desc ?? '',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 10,
                    )),
                SizedBox(height: 5),
                Row(
                  children: [
                    Image.asset('assets/ic_fav_normal.png',
                        width: 12, height: 12),
                    SizedBox(width: 2),
                    Text(
                      '${widget._project?.collectNumber}',
                      style: TextStyle(color: Colors.black54, fontSize: 12),
                    ),
                    SizedBox(width: 5),
                    Image.asset('assets/ic_comment.png', width: 12, height: 12),
                    SizedBox(width: 2),
                    Text(
                      '${widget._project?.replyCount}',
                      style: TextStyle(color: Colors.black54, fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          ),
          _getProjectLogoWidget(widget._project?.logo),
        ],
      ),
    );
  }
}

/// 作者列表
class _AuthorList extends StatefulWidget {
  List<Author>? _authors;
  _AuthorList(this._authors);

  @override
  _AuthorListState createState() => _AuthorListState();
}

/// 作者列表
class _AuthorListState extends State<_AuthorList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          physics: AlwaysScrollableScrollPhysics(),
          itemCount: widget._authors?.length,
          itemBuilder: (BuildContext context, int index) {
            var author = widget._authors?[index];
            return Container(
              width: MediaQuery.of(context).size.width * 4 / 5,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black26,
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(5), // 也可控件一边圆角大小
              ),
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(left: 10, right: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(author?.portrait ?? ''),
                      ),
                      SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            author?.name ?? '',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 3),
                          Text(
                            '${author?.project} 作者',
                            style: TextStyle(color: Colors.black, fontSize: 10),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${author?.projectCount} 软件  ${author?.followers} 粉丝',
                        style: TextStyle(color: Colors.black, fontSize: 10),
                      ),
                      InkWell(
                        onTap: () {},
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
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            );
          }),
    );
  }
}
