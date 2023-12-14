import 'package:flutter_opendroneid/models/message_container.dart';

class DroneModel {
  final String id;
  final double latitude;
  final double longitude;

  DroneModel({
    required this.id,
    required this.latitude,
    required this.longitude,
  });
  DroneModel parseDroneMessage(MessageContainer message) {
    // Extract relevant data from the Open Drone ID message and create a DroneModel
    // Example: (Replace with actual data extraction logic)
    return DroneModel(
      id: message.macAddress,
      latitude: message.locationMessage?.location?.latitude ?? 0.0,
      longitude: message.locationMessage?.location?.longitude ?? 0.0,
    );
  }
}
