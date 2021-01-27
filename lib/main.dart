import 'dart:io';

import 'package:co_kitchen_flutter_test/data/dummy.dart';
import 'package:co_kitchen_flutter_test/models/food_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // \u{20A6}otice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
          // This makes the visual density adapt to the platform that you run
          // the app on. For desktop platforms, the controls will be smaller and
          // closer together (more dense) than on mobile platforms.
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: TextTheme(
              headline5: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  fontFamily: Platform.isIOS ? "Helvetica" : "Google Sans"),
              subtitle1: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                  fontFamily: Platform.isIOS ? "Helvetica" : "Google Sans"))),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  BuildContext _context;

  var billInfo;
  ScrollController _scrollController;
  TextEditingController controller;
  var dashboardComplaints;

  var messageInfo;

  var expectedVisitor;

  dynamic imageURLs;

  dynamic estateInfo;

  String filter;

  var isLoading = false;
  bool endReached = false;
  bool startReached = true;
  var walletBalance;

  _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      setState(() {
        endReached = true;
      });
    } else {
      setState(() {
        endReached = false;
      });
    }

    if (_scrollController.offset <=
            _scrollController.position.minScrollExtent &&
        !_scrollController.position.outOfRange) {
      setState(() {
        startReached = true;
      });
    } else {
      setState(() {
        startReached = false;
      });
    }
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    controller = TextEditingController();
    controller.addListener(() {
      setState(() {
        filter = controller.text;
      });
    });
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _context = context;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          ListView(children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 8.0, top: 8.0, bottom: 8.0),
                  child: Icon(Icons.access_time),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 4.0),
                  child: Text(
                    "Deliver now, to:",
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "53, Awolowo Road, Ikoyi",
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8.0, top: 8.0, bottom: 8.0),
                  child: Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.red,
                  ),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SvgPicture.asset("assets/svg/person.svg"),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 80,
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  child: TextField(
                    decoration: InputDecoration(
                        prefixIcon: SvgPicture.asset(
                          "assets/svg/search.svg",
                          width: 10,
                          height: 10,
                          fit: BoxFit.scaleDown,
                        ),
                        filled: true,
                        fillColor: Color(0xffeeeeee),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffeeeeee)),
                          borderRadius: BorderRadius.circular(25.7),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(25.7),
                        ),
                        labelText: "What are you craving?"),
                    controller: controller,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SvgPicture.asset("assets/svg/menu.svg"),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 8.0),
                  child: Text(
                    "Est. delivery time: 35 mins",
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 8.0),
                  child: Text(
                    "You first delivery is FREE!",
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ),
              ],
            ),
            Container(
              height: 161,
              child: ListView(
                controller: _scrollController,
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Container(
                    child: Image.asset(
                      "assets/images/water.png",
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Container(
                    child: Image.asset(
                      "assets/images/christmas.png",
                      width: MediaQuery.of(context).size.width * 0.8,
                    ),
                  ),
                  Container(
                    child: Image.asset(
                      "assets/images/wall.png",
                    ),
                  ),
                ],
              ),
            ),
            filter == null || filter == ""
                ? getFoodItems()
                : getFilteredFoodItemItems(filter),
          ]),
          Align(
            alignment: Alignment.center,
            child: Container(
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: 50,
                    margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 2,
                    ),
                    child: MaterialButton(
                      onPressed: () => null,
                      shape: CircleBorder(),
                      child: new Text(
                        "Track Order",
                        style: new TextStyle(color: Colors.white),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xff47AF30),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    margin: EdgeInsets.only(top: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: SvgPicture.asset(
                                "assets/svg/food.svg",
                                width: 30,
                                height: 30,
                              ),
                            ),
                            Text(
                              "FOOD",
                              style: Theme.of(context).textTheme.subtitle1,
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: SvgPicture.asset(
                                "assets/svg/search.svg",
                                width: 30,
                                height: 30,
                              ),
                            ),
                            Text("EXPLORE")
                          ],
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: SvgPicture.asset(
                                "assets/svg/order.svg",
                                width: 30,
                                height: 30,
                              ),
                            ),
                            Text("ORDERS")
                          ],
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "%",
                                style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey),
                              ),
                            ),
                            Text("DEALS")
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget getFoodItems() {
    return Column(
        children: Dummy.FOOD_ITEMS
            .map<Widget>((FoodItem foodItem) => Stack(
                  children: [
                    Card(
                      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                      shape: RoundedRectangleBorder(
                          side:
                              BorderSide(color: Theme.of(context).buttonColor),
                          borderRadius: BorderRadius.circular(5)),
                      child: Container(
                        child: Column(children: [
                          Image.asset(
                            foodItem.banner,
                            width: MediaQuery.of(context).size.width,
                          ),
                          ListTile(
                            leading: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 8.0),
                              child: Image.asset(
                                foodItem.icon,
                              ),
                            ),
                            title: Text(
                              foodItem.title,
                              style: Theme.of(context).textTheme.headline5,
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(foodItem.description),
                                Text("As low as \u{20A6}${foodItem.price}")
                              ],
                            ),
                            trailing: Padding(
                              padding: EdgeInsets.only(
                                  left: 8.0, top: 8.0, bottom: 8.0),
                              child: Icon(
                                Icons.keyboard_arrow_right,
                                color: Colors.red,
                              ),
                            ),
                          )
                        ]),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 20, horizontal: 12.0),
                        child: SvgPicture.asset("assets/svg/heart.svg"),
                      ),
                    )
                  ],
                ))
            .toList());
  }

  getFilteredFoodItemItems(String filter) {
    return Column(
        children: Dummy.FOOD_ITEMS
            .where((FoodItem foodItem) =>
                foodItem.title.toLowerCase().contains(filter.toLowerCase()))
            .map<Widget>((FoodItem foodItem) => Stack(
                  children: [
                    Card(
                      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                      shape: RoundedRectangleBorder(
                          side:
                              BorderSide(color: Theme.of(context).buttonColor),
                          borderRadius: BorderRadius.circular(5)),
                      child: Container(
                        child: Column(children: [
                          Image.asset(
                            foodItem.banner,
                            width: MediaQuery.of(context).size.width,
                          ),
                          ListTile(
                            leading: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 8.0),
                              child: Image.asset(
                                foodItem.icon,
                              ),
                            ),
                            title: Text(
                              foodItem.title,
                              style: Theme.of(context).textTheme.headline5,
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(foodItem.description),
                                Text("As low as \u{20A6}${foodItem.price}")
                              ],
                            ),
                            trailing: Padding(
                              padding: EdgeInsets.only(
                                  left: 8.0, top: 8.0, bottom: 8.0),
                              child: Icon(
                                Icons.keyboard_arrow_right,
                                color: Colors.red,
                              ),
                            ),
                          )
                        ]),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 20, horizontal: 12.0),
                        child: SvgPicture.asset("assets/svg/heart.svg"),
                      ),
                    )
                  ],
                ))
            .toList());
  }
}
