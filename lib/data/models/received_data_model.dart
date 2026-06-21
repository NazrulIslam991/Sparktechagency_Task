class ReceivedDataModel {
  final String ip;
  final Map<String, dynamic> data;
  DateTime lastSeen;

  ReceivedDataModel({
    required this.ip,
    required this.data,
    required this.lastSeen,
  });
}
