import 'package:flutter/material.dart';
import 'package:workshop_dilo/home_screen.dart';

class AccountDetail extends StatefulWidget {
  @override
  _AccountDetailState createState() => _AccountDetailState();
}

class _AccountDetailState extends State<AccountDetail> {
  int currentPage = 1;

  @override
  Widget build(BuildContext context) {
    if (currentPage == 1) {
      return _buildAccountDetail();
    } else if (currentPage == 0) {
      return HomeScreen();
    }
  }

  Widget _buildAccountDetail() {
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
        body: Center(
          child: Text('DETAIL'),
        ));
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
}
