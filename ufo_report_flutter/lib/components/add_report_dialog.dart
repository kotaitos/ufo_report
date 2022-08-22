import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ufo_report_flutter/models/report.dart';

class AddReportDialog extends StatefulWidget {
  const AddReportDialog({Key? key}) : super(key: key);

  @override
  State<AddReportDialog> createState() => _AddReportDialogState();
}

class _AddReportDialogState extends State<AddReportDialog> {
  String _content = "";

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: const Text("新たな目撃情報を追加"),
        content: SingleChildScrollView(
          child: TextField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: "目撃情報を入力",
            ),
            minLines: 10,
            maxLines: null,
            onChanged: _handleText,
          ),
        ),
        actions: <Widget>[
          TextButton(
              onPressed: () => {Navigator.pop(context, false)},
              child: const Text("キャンセル")),
          TextButton(
              onPressed: () => onPressedAddRRport(context),
              child: const Text("追加")),
        ]);
  }

  void _handleText(String e) {
    setState(() {
      _content = e;
    });
  }

  void onPressedAddRRport(BuildContext context) {
    var report = Report(_content, DateTime.now());
    var res =
        FirebaseFirestore.instance.collection('Report').add(report.toJson());
    Navigator.pop(context, true);
  }
}
