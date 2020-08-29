import 'dart:ui';
import 'package:firstflutter/ui/widget_banner.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> _imgData = [
    'http://pic.7working.com/Fhan-yhWY7SreenjralhXUWKwvHz',
    'http://pic.7working.com/FoAs7Ot182AAx0BH7FMRkBSmjuQR',
    'http://youji.7working.com/FnRF-4003awVjlcChfY1YUP_vR-k',
  ];

  final List<int> _headList = [1, 2, 3];
  final List<int> _taskList = [1, 2, 3, 4,5,6,7,8];

  Widget TopDistrict() {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              margin: const EdgeInsets.only(right: 5),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                child: Image.network(
                  'http://pic.7working.com/Fhan-yhWY7SreenjralhXUWKwvHz',
                  height: 65,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
                margin: const EdgeInsets.only(left: 5),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  child: Image.network(
                    'http://pic.7working.com/FoAs7Ot182AAx0BH7FMRkBSmjuQR',
                    height: 65,
                    fit: BoxFit.cover,
                  ),
                )),
          )
        ],
      ),
    );
  }

  Widget TaskList() {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "任务列表",
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
          //head列表
          Container(
            child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: _headList.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(width: 0.5, color: Color(0xFFe5e5e5)),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  margin: const EdgeInsets.only(top: 10),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          children: <Widget>[
                            Container(
                              child: Text(
                                "推荐你身边的牛人",
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold),
                              ),
                              alignment: Alignment.topLeft,
                              padding: const EdgeInsets.only(top: 10, left: 10),
                            ),
                            Container(
                              child: Text(
                                "认证成功享 +20 积分",
                                style: TextStyle(
                                    color: Colors.black45, fontSize: 10),
                              ),
                              alignment: Alignment.bottomLeft,
                              padding: const EdgeInsets.only(
                                  top: 10, bottom: 10, left: 10),
                            )
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        width: 50,
                        height: 20,
                        margin: const EdgeInsets.only(right: 10),
                        alignment: Alignment.centerRight,
                        child: Text(
                          '立即参与',
                          style: TextStyle(color: Colors.white, fontSize: 11),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          //任务列表
          Container(
            child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: _taskList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(width: 0.5, color: Color(0xFFe5e5e5)),
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    margin: const EdgeInsets.only(top: 10),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            children: <Widget>[
                              Container(
                                child: Text(
                                  "商城小程序UI设计",
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold),
                                ),
                                alignment: Alignment.topLeft,
                                padding:
                                    const EdgeInsets.only(top: 10, left: 10),
                              ),
                              Container(
                                child: Text(
                                  "软件开发 · 小程序开发 · 全行业",
                                  style: TextStyle(
                                      color: Colors.black45, fontSize: 10),
                                ),
                                alignment: Alignment.bottomLeft,
                                padding: const EdgeInsets.only(
                                    top: 10, bottom: 10, left: 10),
                              ),
                              Container(
                                child: Text(
                                  "发布时间 ：2019-10-02",
                                  style: TextStyle(
                                      color: Colors.black45, fontSize: 10),
                                ),
                                alignment: Alignment.bottomLeft,
                                padding:
                                    const EdgeInsets.only(bottom: 10, left: 10),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 10),
                          alignment: Alignment.centerRight,
                          child: Text(
                            '报名开始',
                            style: TextStyle(color: Colors.green, fontSize: 13),
                          ),
                        )
                      ],
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xf1f4f7),
        appBar: PreferredSize(
          child: AppBar(
            title: Text(
              "个人版",
              style: TextStyle(color: Colors.black87),
            ),
            backgroundColor: Colors.white,
            centerTitle: true,
            actions: <Widget>[
              Icon(
                Icons.crop_free,
                color: Colors.black87,
              )
            ],
          ),
          preferredSize: Size.fromHeight(50),
        ),
        body: Container(
          child: RefreshIndicator(
              onRefresh: _refresh,
              backgroundColor: Colors.white,
              color: Colors.green,
              child: SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.all(10),
                  child: Column(
                    children: <Widget>[
                      CustomBanner(
                        _imgData,
                        height: 108,
                        onTap: null,
                        curve: Curves.linear,
                      ),
                      TopDistrict(),
                      TaskList(),
                    ],
                  ),
                ),
              )),
        ));
  }

  Future<Null> _refresh() async {
    _taskList.clear();
    await _taskList.add(1);
    return;
  }
}
