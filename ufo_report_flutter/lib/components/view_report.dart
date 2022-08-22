import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ufo_report_flutter/components/add_report_dialog.dart';
import 'package:ufo_report_flutter/models/report.dart';

class ViewReport extends StatefulWidget {
  const ViewReport({Key? key}) : super(key: key);

  @override
  State<ViewReport> createState() => _ViewReportState();
}

class _ViewReportState extends State<ViewReport> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: fetchViewReports(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          var cardList = <Card>[];
          if (snapshot.data != null) {
            cardList = snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> report =
                  document.data()! as Map<String, dynamic>;
              return Card(
                child: ListTile(
                  title: Text(report['content']),
                ),
              );
            }).toList();
          }
          return Scaffold(
            body: ListView(children: cardList),
            floatingActionButton: FloatingActionButton(
              onPressed: pressAddButton,
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
          );
        });
  }

  Stream<QuerySnapshot> fetchViewReports() {
    return FirebaseFirestore.instance
        .collection('Report')
        .orderBy('created_at', descending: true)
        .limit(50)
        .snapshots();
  }

  void pressAddButton() async {
    var result = await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) {
          return const AddReportDialog();
        });
  }
}
