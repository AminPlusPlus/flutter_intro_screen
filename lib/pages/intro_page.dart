import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scrolling_page_indicator/scrolling_page_indicator.dart';

class IntroPage extends StatefulWidget {
  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  PageController _controller;

  @override
  void initState() {
    _controller = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double defaultScreenWidth = 400.0;
    double defaultScreenHeight = 810.0;

    ScreenUtil.init(context,
        width: defaultScreenWidth,
        height: defaultScreenHeight,
        allowFontScaling: true);

    List<Widget> items = [
      buildPage("0", Colors.red),
      buildPage("1", Colors.blue),
      buildPage("2", Colors.green),
      buildPage("3", Colors.amber),
      buildPage("4", Colors.deepPurple),
      buildPage("5", Colors.teal),
      buildPage("6", Colors.pink),
      buildPage("7", Colors.brown)
    ];

    return Scaffold(
      appBar:AppBar(
        elevation: 0,
        actions: <Widget>[
          FlatButton(
              child: Text("Skip")
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(top: ScreenUtil().setWidth(10.0), bottom: ScreenUtil().setWidth(50.0)),
        child: Column(
          children: <Widget>[
            Expanded(
              child: PageView(
                children: items,
                controller: _controller,
              ),
            ),
            ScrollingPageIndicator(
              dotColor: Colors.grey,
              dotSelectedColor: Colors.deepPurple,
              dotSize: 6,
              dotSelectedSize: 8,
              dotSpacing: 12,
              controller: _controller,
              itemCount: items.length,
              orientation: Axis.horizontal,
            ),
            SizedBox(
              height: ScreenUtil().setWidth(20.0),
            ),
            GestureDetector(
              child: Container(
                width: MediaQuery.of(context).size.width - ScreenUtil().setWidth(20.0),
                height: ScreenUtil().setWidth(50.0),
                decoration: BoxDecoration(
                    color: Colors.deepPurpleAccent,
                    borderRadius: BorderRadius.circular(15)),
                child: Center(
                  child: Text(
                    "Get Started",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white,fontSize: ScreenUtil().setSp(15),fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            )
          ],
        ),
        color: Colors.white,
      ),
    );
  }

  Widget buildPage(String text, Color color) {
    return Padding(
      padding: EdgeInsets.all(ScreenUtil().setWidth(12.0)),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            height: ScreenUtil().setWidth(300.0),
            decoration: BoxDecoration(
                color: color, borderRadius: BorderRadius.circular(15)),
          ),
          Text(
            "CATEGORY",
            textAlign: TextAlign.center,
          ),
          Text(
            "Lorem Ipsum is simply dummy text of the printing ",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: ScreenUtil().setSp(25),fontWeight: FontWeight.bold,color: Colors.black87),
          ),
          Text(
            "All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary,...",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: ScreenUtil().setSp(18),fontWeight: FontWeight.w400,color: Colors.black87),
          )

        ],
      ),
    );

  }
}
