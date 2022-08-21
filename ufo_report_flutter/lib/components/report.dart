import 'package:flutter/material.dart';

class Report extends StatefulWidget {
  Report({Key? key}) : super(key: key);

  @override
  State<Report> createState() => _ReportState();
}

class _ReportState extends State<Report> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Image.network(
                    'https://images-na.ssl-images-amazon.com/images/I/51HRqCnj7SL._SX344_BO1,204,203,200_.jpg'),
                title: Text('完訳 7つの習慣~人格主義の回復~'),
                subtitle: Text('送料無料'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  TextButton(
                    child: const Text('詳細'),
                    onPressed: () {/* ... */},
                  ),
                  const SizedBox(width: 8),
                  TextButton(
                    child: const Text('今すぐ購入'),
                    onPressed: () {/* ... */},
                  ),
                  const SizedBox(width: 8),
                ],
              ),
              ListTile(
                leading: Image.network(
                    'https://images-na.ssl-images-amazon.com/images/I/51HRqCnj7SL._SX344_BO1,204,203,200_.jpg'),
                title: Text('完訳 7つの習慣~人格主義の回復~'),
                subtitle: Text('送料無料'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  TextButton(
                    child: const Text('詳細'),
                    onPressed: () {/* ... */},
                  ),
                  const SizedBox(width: 8),
                  TextButton(
                    child: const Text('今すぐ購入'),
                    onPressed: () {/* ... */},
                  ),
                  const SizedBox(width: 8),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
