import 'package:flutter/material.dart';
import '../components/map.dart';
import '../components/header.dart';
import '../components/footer.dart';

class MyHomeView extends StatefulWidget {
  const MyHomeView({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomeView> createState() => _MyHomeViewState();
}

class _MyHomeViewState extends State<MyHomeView> {
  final _scaffold = const Scaffold(
    appBar: Header(),
    body: Map(),
    bottomNavigationBar: Footer(),
  );
  @override
  Widget build(BuildContext context) {
    return _scaffold;
  }
}
