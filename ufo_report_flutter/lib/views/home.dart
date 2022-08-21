import 'package:flutter/material.dart';
import 'package:ufo_report_flutter/components/view_report.dart';
import '../components/map.dart';

class MyHomeView extends StatefulWidget {
  const MyHomeView({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomeView> createState() => _MyHomeViewState();
}

class _MyHomeViewState extends State<MyHomeView> {
  final pages = <Widget>[const Map(), const ViewReport()];
  final titles = <String>["出現予測", "発見報告"];
  int selectIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titles[selectIndex]),
      ),
      body: pages[selectIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.place,
              ),
              label: '出現予測'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.speaker_notes,
              ),
              label: '報告'),
        ],
        currentIndex: selectIndex,
        onTap: _onTapItem,
      ),
    );
  }

  void _onTapItem(int index) {
    setState(() {
      selectIndex = index;
    });
  }
}
