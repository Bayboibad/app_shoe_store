import 'package:app_shoe_store/views/loading/screen_love.dart';
import 'package:flutter/material.dart';

class NotifyTab extends StatefulWidget {
  const NotifyTab({super.key});

  @override
  State<NotifyTab> createState() => _NotifyTabState();
}

class _NotifyTabState extends State<NotifyTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Thông báo"),
        automaticallyImplyLeading: false,
      ),
    );
  }
}