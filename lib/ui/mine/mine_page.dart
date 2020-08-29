import 'package:firstflutter/http/api.dart';
import 'package:firstflutter/http/http_util.dart';
import 'package:flutter/material.dart';

import '../widget_banner.dart';

class MinePage extends StatefulWidget {
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  final List<String> _imgData = [
    'http://pic.7working.com/Fhan-yhWY7SreenjralhXUWKwvHz',
    'http://pic.7working.com/FoAs7Ot182AAx0BH7FMRkBSmjuQR',
    'http://youji.7working.com/FnRF-4003awVjlcChfY1YUP_vR-k',
  ];
  final DateTime _dateTime = DateTime.now();
  final _weekData = ['一', '二', '三', '四', '五', '六', '日'];
  int _dayIndex = 0;

  // 用于同 TabBar 进行联动
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    getCourseList();
    _pageController = PageController(
      initialPage: 0,
      viewportFraction: 1,
      keepPage: true,
    );

  }

  Widget SearchFrame() {
    return Container(
      height: 30,
      margin: const EdgeInsets.only(top: 35, bottom: 10,left: 10,right: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(2)),
          color: Color(0xff231C3A)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: Icon(Icons.search),
            margin: const EdgeInsets.only(left: 10),
            alignment: Alignment.centerLeft,
          ),
          Text(
            '输入要搜索的内容',
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
          Container(
            alignment: Alignment.centerRight,
            margin: const EdgeInsets.only(right: 10),
            child: Icon(Icons.crop_free),
          )
        ],
      ),
    );
  }

  Widget CalendarDataBar() {
    return Container(
      margin: const EdgeInsets.only(left: 5,right: 5),
      height: 50,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          physics: NeverScrollableScrollPhysics(),
          itemCount: 7,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              child: Container(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      child: Expanded(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(
                                _dayIndex == index ? 0xFF20EAEC : 0xff231C3A),
                            border: Border.all(
                              width: 0.5,
                              color: Color(
                                  _dayIndex == index ? 0xFF20EAEC : 0xff231C3A),
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                          margin: const EdgeInsets.only(left: 5,right: 5),
                          height: 38,
                          width: 38,
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Container(
                                child: Text(
                                    index == 0
                                        ? "今日"
                                        : _weekData[(_dateTime.weekday +
                                                    index -
                                                    1) %
                                                7]
                                            .toString(),
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: _dayIndex == index
                                            ? Colors.black87
                                            : Colors.white)),
                              ),
                              Container(
                                child: Text((_dateTime.day + index).toString(),
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: _dayIndex == index
                                            ? Colors.black87
                                            : Colors.white)),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              onTap: () {
                setState(() {
                  _dayIndex = index;
                });
              },
            );
          }),
    );
  }

  /**
   * 课程
   */
  Widget CoursePageView(BuildContext context, int index) {
    return Container(
      margin: const EdgeInsets.only(left: 10,right: 10),
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          physics: NeverScrollableScrollPhysics(),
          itemCount: 7,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
                child: Container(
                  margin: const EdgeInsets.only(bottom: 10),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Color(0xff231C3A),
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    child: Column(
                      children: <Widget>[
                        Container(
                          alignment: Alignment.topLeft,
                          margin: const EdgeInsets.only(
                              left: 10, top: 5, bottom: 5),
                          child: Text('时间',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 13)),
                        ),
                        Divider(
                          height: 1,
                          color: Colors.black,
                        ),
                        Row(
                          children: <Widget>[
                            Container(
                              margin: const EdgeInsets.only(
                                  left: 10, top: 10, bottom: 10),
                              child: Image.network(
                                'http://pic.7working.com/Fhan-yhWY7SreenjralhXUWKwvHz',
                                width: 50,
                                height: 50,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: <Widget>[
                                  Container(
                                      alignment: Alignment.topLeft,
                                      margin: const EdgeInsets.only(left: 10),
                                      child: Text('名字·舞种',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold))),
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    margin: const EdgeInsets.only(left: 10,top: 5,bottom: 5),
                                    child: Text('难度',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 10)),
                                  ),
                                  Container(
                                    alignment: Alignment.bottomLeft,
                                    child: Row(
                                      children: <Widget>[
                                        Icon(
                                          Icons.attach_money,
                                          color: Colors.yellow,
                                          size: 15,
                                        ),
                                        Text('120',
                                            style: TextStyle(
                                                color: Color(0xFF20EAEC),
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold))
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border:
                                    Border.all(width: 0.5, color: Colors.grey),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                              ),
                              width: 50,
                              height: 20,
                              margin: const EdgeInsets.only(right: 10),
                              alignment: Alignment.centerRight,
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  '已结束',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 11),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    )));
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF161227),
        body: Container(
          child: RefreshIndicator(
            backgroundColor: Colors.white,
            color: Colors.black,
            onRefresh: _refresh,
            child: SingleChildScrollView(
              child: Container(
                child: Column(
                  children: <Widget>[
                    SearchFrame(),
                    CustomBanner(
                      _imgData,
                      height: 120,
                      onTap: null,
                      curve: Curves.linear,
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10,left: 10,right: 10),
                      child: Row(
                        children: <Widget>[
                          Text(
                            '北京门店',
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                          Icon(
                            Icons.arrow_drop_down,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                    CalendarDataBar(),
                    Container(
                      height: 500,
                      child: PageView.builder(
                        controller: _pageController,
                        itemCount: _weekData.length,
                        itemBuilder: (BuildContext context, int index) =>
                            CoursePageView(context, index),
                        onPageChanged: (position) {
                          // PageView 切换的监听，这边切换 PageView 的页面后，TabBar 也需要随之改变
                          // 通过 tabController 来改变 TabBar 的显示位置
                          setState(() {
                            _dayIndex = position;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  Future<Null> _refresh() async {
    return;
  }

  Future<void> getCourseList() async{
    Map<String ,dynamic> mData = {
      'user_id':1,
      'shop_id':1,
      'date':1,
    };
    try{
      var response = await HttpUtil().post(Api.COURSE_LIST_URL,queryData: mData);
      print(response.toString());
    }catch(e){
      print(e);
    }
  }
}
