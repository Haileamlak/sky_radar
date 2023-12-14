import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_opendroneid/flutter_opendroneid.dart';
import 'package:flutter_opendroneid/models/message_container.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sky_radar/models/drone.dart';

class DroneModel with ChangeNotifier {
  Stream<MessageContainer> droneMessages = FlutterOpenDroneId.allMessages;
  FirebaseDatabase drones = FirebaseDatabase.instance;

  DroneModel() {
    getPermission();
    FlutterOpenDroneId.startScan(UsedTechnologies.Both);
    droneMessages.listen((event) async{
      final drone =  FirebaseDatabase.instance
          .ref("drones")
          .child(event.basicIdMessage!.uasID.toString());
    });
  }
  Future<void> getPermission() async {
    await Permission.bluetooth.request();
    await Permission.bluetoothScan.request();
    await Permission.location
        .request(); // For Android Bluetooth scan permission
    await Permission.nearbyWifiDevices
        .request(); // For Android Wi-Fi scan permission
  }
}
