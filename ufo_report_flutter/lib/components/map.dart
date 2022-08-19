import 'dart:async';

import 'package:flutter/material.dart';
import 'package:platform_maps_flutter/platform_maps_flutter.dart';

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
        child: PlatformMap(
          // マップのカメラの初期値
          initialCameraPosition: const CameraPosition(
            // 地理情報
            target: LatLng(47.6, 8.8796),
            zoom: 16,
          ),

          markers: <Marker>{
            Marker(
              // マーカーID リストの中で一意であればいい
              markerId: MarkerId('marker_1'),
              // 地理情報
              position: const LatLng(47.6, 8.8796),
              // タップイベント
              // デフォルトのタップ処理では、マップをマーカーの中央に配置し、マーカーを表示します。情報ウィンドウを表示します。
              consumeTapEvents: true,
              // 情報ウィンドウのエキストラベル
              infoWindow: const InfoWindow(
                title: 'PlatformMarker',
                snippet: "Hi I'm a Platform Marker",
              ),
              onTap: () {
                print("Marker tapped");
              },
            ),
          },
          // 現在地のレイヤーを表示
          myLocationEnabled: true,
          // [GoogleMap] がタップされる度に呼び出されます。
          onTap: (location) => print('onTap: $location'),
          // カメラが移動し続けるたびに呼び出される
          onCameraMove: (cameraUpdate) => print('onCameraMove: $cameraUpdate'),
          // 地図が回転したときにコンパスを表示
          compassEnabled: true,
          // マップが使用可能になったときのコールバック、メソッド
          onMapCreated: (controller) {
            Future<dynamic>.delayed(const Duration(seconds: 2)).then(
              (dynamic _) {
                controller.animateCamera(
                  CameraUpdate.newCameraPosition(
                    const CameraPosition(
                      bearing: 270.0,
                      target: LatLng(51.5160895, -0.1294527),
                      tilt: 30.0,
                      zoom: 2,
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
