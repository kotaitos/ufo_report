import 'package:flutter/material.dart';
import 'package:platform_maps_flutter/platform_maps_flutter.dart';
import 'package:ufo_report_flutter/models/prediction.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class Map extends StatefulWidget {
  const Map({Key? key}) : super(key: key);

  @override
  State<Map> createState() => _MapState();
}

class _MapState extends State<Map> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      child: FutureBuilder(
          future: loadTodayPrediction(),
          builder: (BuildContext context, AsyncSnapshot<Prediction> snapshot) {
            var prediction = Prediction(33.65358843408784, 130.6727014674373,
                DateFormat('yyyy/MM/dd').format(DateTime.now()));
            if (snapshot.hasData) {
              prediction = Prediction(snapshot.data!.latitude,
                  snapshot.data!.longitude, snapshot.data!.predictionDate);
            }
            var _latLng = LatLng(prediction.latitude, prediction.longitude);
            return PlatformMap(
              // マップのカメラの初期値
              initialCameraPosition: CameraPosition(
                // 地理情報
                target: _latLng,
                zoom: 2,
              ),

              markers: <Marker>{
                Marker(
                  // マーカーID リストの中で一意であればいい
                  markerId: MarkerId('marker_1'),
                  // 地理情報
                  position: _latLng,
                  // タップイベント
                  // デフォルトのタップ処理では、マップをマーカーの中央に配置し、マーカーを表示します。情報ウィンドウを表示します。
                  consumeTapEvents: true,
                ),
              },
              // 現在地のレイヤーを表示
              myLocationEnabled: true,
              // [GoogleMap] がタップされる度に呼び出されます。
              onTap: (location) => print('onTap: $location'),
              // カメラが移動し続けるたびに呼び出される
              onCameraMove: (cameraUpdate) =>
                  print('onCameraMove: $cameraUpdate'),
              // 地図が回転したときにコンパスを表示
              compassEnabled: true,
            );
          }),
    ));
  }

  Future<Prediction> loadTodayPrediction() async {
    String today = DateFormat('yyyy/MM/dd').format(DateTime.now());
    var res = await FirebaseFirestore.instance
        .collection('Prediction')
        .where('prediction_date', isEqualTo: today)
        .get();
    var prediction = res.docs[0].data();
    return Prediction(prediction["latitude"], prediction["longitude"],
        prediction["prediction_date"]);
  }
}
