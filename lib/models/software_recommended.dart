// 软件推荐列表实体

class SoftwareList {
  int? currentSize;
  List<Item>? items;

  SoftwareList.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      var data = json['data'];
      currentSize = data['currentSize'];
      List<Item> list = [];
      if (data['items'] != null) {
        data['items'].forEach((v) {
          list.add(Item.fromJson(v));
        });
      }
      items = list;
    }
  }
}

class Item {
  String? id;
  String? type; // 类型
  Project? project;
  List<Author>? authors;

  Item.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    if ('author' == type) {
      if(json['authors'] != null) {
        List<Author>? authorList = [];
        json['authors'].forEach((v){
          authorList.add(Author.fromJson(v));
        });
        authors = authorList;
      }
    } else if ('project' == type) {
      project = Project.fromJson(json['project']);
    }
  }
}

class Project {
  bool? cn;
  int? collectNumber; // 收藏人数
  String? desc; // 描述
  int? id; // 项目id
  String? ident; //
  String? logo; // 项目logo
  String? name; // 项目名称
  bool? recommend; //
  int? replyCount; // 回复人数
  String? title; // 标题

  Project(
      {this.cn,
      this.collectNumber,
      this.desc,
      this.id,
      this.ident,
      this.logo,
      this.name,
      this.recommend,
      this.replyCount,
      this.title});

  Project.fromJson(Map<String, dynamic> json) {
    cn = json['cn'];
    collectNumber = json['collectNumber'];
    desc = json['desc'];
    id = json['id'];
    ident = json['ident'];
    logo = json['logo'];
    name = json['name'];
    recommend = json['recommend'];
    replyCount = json['replyCount'];
    title = json['title'];
  }
}

class Author {
  int? followStatus; // 关注状态
  int? followers; // 关注人数
  String? name; // 呢称
  String? portrait; //头像
  String? project; //项目名称
  int? projectCount; //项目数量
  int? userID; //用户id

  Author.fromJson(Map<String, dynamic> json) {
    followStatus = json['followStatus'];
    followers = json['followers'];
    name = json['name'];
    portrait = json['portrait'];
    project = json['project'];
    projectCount = json['projectCount'];
    userID = json['userID'];
  }
}
