import 'package:app_shoe_store/views/home/tabbar/account_tab.dart';
import 'package:app_shoe_store/views/home/tabbar/heart_tab.dart';
import 'package:app_shoe_store/views/home/tabbar/home_tab.dart';
import 'package:app_shoe_store/views/home/tabbar/notyfi_tab.dart';
import 'package:bottom_bar/bottom_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentPage = 0;
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children:  [HomeTab(), HeartTab(), NotifyTab(), AccountTab()],
        onPageChanged: (index) {
          setState(() => _currentPage = index);
        },
      ),
      bottomNavigationBar: BottomBar(
        selectedIndex: _currentPage,
        onTap: (int index) {
          _pageController.jumpToPage(index);
          setState(() => _currentPage = index);
        },
        items: const <BottomBarItem>[
          BottomBarItem(
            icon: Icon(Icons.home),
            title: Text('Trang chủ'),
            activeColor: Colors.blue,
          ),
          BottomBarItem(
            icon: Icon(Icons.favorite),
            title: Text('Yêu thích'),
            activeColor: Colors.red,
          ),
          BottomBarItem(
            icon: Icon(Icons.notifications),
            title: Text('Thông báo'),
            activeColor: Colors.orange,
          ),
          BottomBarItem(
            icon: Icon(Icons.person),
            title: Text('Tài khoản'),
            activeColor: Colors.greenAccent,
          ),
        ],
      ),
    );
  }
}
