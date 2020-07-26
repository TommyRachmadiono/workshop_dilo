import 'package:flutter/material.dart';
import 'package:workshop_dilo/account_detail.dart';
import 'package:workshop_dilo/helper/size_helper.dart';
import 'package:workshop_dilo/models/item_model.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _greetings() {
    var greeting = DateTime.now().hour;
    if (greeting < 12) {
      return 'Pagi';
    } else if (greeting < 15) {
      return 'Siang';
    } else if (greeting < 19) {
      return 'Sore';
    } else {
      return 'Malam';
    }
  }

  int currentPage = 0;

  List<ItemModel> _itemList = [
    ItemModel(
        name: 'Item 1',
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
        color: Colors.blue[200],
        image: 'http://pngimg.com/uploads/cat/cat_PNG50530.png'),
    ItemModel(
        name: 'Item 2',
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
        color: Colors.red[200],
        image: 'http://pngimg.com/uploads/cat/cat_PNG50491.png'),
    ItemModel(
        name: 'Item 3',
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
        color: Colors.amber[200],
        image: 'http://pngimg.com/uploads/cat/cat_PNG50488.png'),
    ItemModel(
        name: 'Item 4',
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
        color: Colors.orange[200],
        image: 'http://pngimg.com/uploads/cat/cat_PNG50449.png'),
    ItemModel(
        name: 'Item 5',
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
        color: Colors.green[200],
        image: 'http://pngimg.com/uploads/cat/cat_PNG50433.png'),
  ];

  @override
  Widget build(BuildContext context) {
    if (currentPage == 0) {
      return _buildHome();
    } else if (currentPage == 1) {
      return AccountDetail();
    }
  }

  Widget _buildHome() {
    return Scaffold(
      floatingActionButton: Container(
        height: 70,
        child: FittedBox(
          child: FloatingActionButton(
            backgroundColor: Colors.red[300],
            onPressed: () {},
            child: Image.asset(
              'images/cat.png',
              width: 50,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15)),
          color: Colors.red,
        ),
        height: 50,
        child: _buildCustomBottomNavigation(),
      ),
      appBar: AppBar(
        elevation: 0,
        title: Row(
          children: <Widget>[
            Image.asset('images/cat.png', width: 50),
            SizedBox(
              width: 10,
            ),
            Text(
              'Home Page',
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _buildHeaderProfile(),
            SizedBox(height: 25),
            _titlePopularItem(),
            SizedBox(
              height: 10,
            ),
            _listPopularItem(),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomBottomNavigation() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
            child: InkWell(
          onTap: () {
            setState(() {
              currentPage = 0;
            });
          },
          child: Container(
            child: Icon(
              Icons.home,
              color: currentPage == 0 ? Colors.white : Colors.black,
            ),
          ),
        )),
        Expanded(child: Container()),
        Expanded(
            child: InkWell(
          onTap: () {
            setState(() {
              currentPage = 1;
            });
          },
          child: Container(
            child: Icon(
              Icons.settings,
              color: currentPage == 1 ? Colors.white : Colors.black,
            ),
          ),
        )),
      ],
    );
  }

  Widget _titlePopularItem() {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            'Popular Item',
            style: TextStyle(fontSize: 16),
          ),
          Text(
            'Lihat Semua',
            style: TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _listPopularItem() {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      height: sizeWidth(context) <= 320
          ? 150
          : sizeWidth(context) <= 360
              ? 170
              : sizeWidth(context) <= 480 ? 210 : 250,
      child: ListView.builder(
        itemCount: _itemList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int i) {
          return InkWell(
            onTap: () {},
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              elevation: 0,
              color: _itemList[i].color,
              child: Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(15)),
                width: sizeWidth(context) <= 320
                    ? 180
                    : sizeWidth(context) <= 360
                        ? 200
                        : sizeWidth(context) <= 480 ? 240 : 300,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              '${_itemList[i].name}',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              _itemList[i].description,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: TextStyle(fontSize: 12),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: Image.network(_itemList[i].image),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildHeaderProfile() {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 3,
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 30, left: 30),
                  child: Text(
                    'Selamat ${_greetings()}',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 10, left: 30),
                  child: Text(
                    'User',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(right: 20),
            width: 70,
            height: 70,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                        'https://www.arcgis.com/sharing/rest/content/items/cb9f709bdb42425cb4ced02e977ea6ee/resources/1572535070485.jpeg?w=2400'))),
          ),
        )
      ],
    );
  }
}
