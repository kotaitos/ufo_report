import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ufo_report_flutter/models/report.dart';

class ViewReport extends StatefulWidget {
  const ViewReport({Key? key}) : super(key: key);

  @override
  State<ViewReport> createState() => _ViewReportState();
}

class _ViewReportState extends State<ViewReport> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: fetchViewReports(),
        builder: (BuildContext context, AsyncSnapshot<List<Card>> snapshot) {
          var cardList = <Card>[];
          if (snapshot.data != null) {
            cardList = snapshot.data!;
          }
          return Scaffold(body: ListView(children: cardList));
        });
  }

  Future<List<Card>> fetchViewReports() async {
    var res = await FirebaseFirestore.instance
        .collection('Report')
        .orderBy('created_at', descending: true)
        .limit(50)
        .get();
    var reports =
        res.docs.map((doc) => Card(child: Text(doc["content"]))).toList();

    return reports;
  }

  addRRport(Report report) {
    var res =
        FirebaseFirestore.instance.collection('Report').add(report.toJson());
  }
}
