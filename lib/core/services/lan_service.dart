import 'dart:async';
import 'dart:convert';
import 'dart:io';

class LanService {
  static const int port = 5050;

  RawDatagramSocket? _socket;

  /// TCP server for request/response communication
  ServerSocket? _server;

  /// Timer
  Timer? _timer;

  /// ********************** CALLBACK HANDLERS **********************
  /// Called when a new device is discovered in LAN (UDP)
  Function(Map<String, dynamic> data, String ip)? onDeviceFound;

  /// Called when a request is received from another device (TCP)
  Function(String ip, Map<String, dynamic> data)? onRequestReceived;

  /// ********************** START TCP SERVER **********************
  /// Initializes a TCP server that listens for incoming connections.
  ///
  /// Responsibilities:
  /// - Accepts incoming socket connections
  /// - Decodes JSON messages
  /// - Handles "request" type messages from other devices
  ///
  /// Used for direct device-to-device communication.
  Future<void> startServer() async {
    _server = await ServerSocket.bind(InternetAddress.anyIPv4, port + 1);

    _server!.listen((client) {
      client.listen((data) {
        final message = utf8.decode(data);

        try {
          final decoded = jsonDecode(message);

          /// Handle incoming data sharing request
          if (decoded["type"] == "request") {
            onRequestReceived?.call(
              client.remoteAddress.address,
              decoded["data"],
            );
          }
        } catch (e) {
          print("TCP JSON PARSE ERROR: $e");
        }
      });
    });
  }

  /// ********************** SEND REQUEST (TCP CLIENT) **********************
  /// Sends a request to another device asking for data sharing.
  ///
  /// Flow:
  /// - Connects to target device using TCP socket
  /// - Sends JSON payload with type "request"
  Future<void> sendRequest(String ip, Map<String, dynamic> data) async {
    final socket = await Socket.connect(ip, port + 1);

    final request = {"type": "request", "data": data};

    socket.write(jsonEncode(request));

    /// close connection after sending
    await socket.close();
  }

  /// ********************** SEND RESPONSE (TCP CLIENT) **********************
  /// Sends actual device data back to requester.
  ///
  /// Flow:
  /// - Connects to requesting device
  /// - Sends JSON payload with type "response"
  Future<void> sendResponse(String ip, Map<String, dynamic> data) async {
    final socket = await Socket.connect(ip, port + 1);

    final response = {"type": "response", "data": data};

    socket.write(jsonEncode(response));

    /// Close socket after sending response
    await socket.close();
  }

  /// ********************** START UDP DISCOVERY LISTENER **********************
  /// Listens for broadcast packets from nearby devices in LAN.
  ///
  /// Purpose:
  /// - Detect nearby devices automatically
  /// - Build real-time device list
  ///
  /// Uses UDP broadcast (255.255.255.255)
  Future<void> startListening() async {
    _socket = await RawDatagramSocket.bind(
      InternetAddress.anyIPv4,
      port,
      reuseAddress: true,
    );

    _socket!.listen((event) {
      if (event == RawSocketEvent.read) {
        final dg = _socket!.receive();
        if (dg == null) return;

        final message = utf8.decode(dg.data);

        try {
          final data = jsonDecode(message);

          onDeviceFound?.call(data, dg.address.address);
        } catch (e) {
          print("UDP JSON PARSE ERROR: $e");
        }
      }
    });
  }

  /// ********************** START BROADCASTING **********************
  /// Continuously broadcasts this device information to LAN.
  ///
  /// Purpose:
  /// - Makes device discoverable
  /// - Sends periodic updates every 3 seconds
  void startBroadcast(Map<String, dynamic> deviceData) {
    _timer = Timer.periodic(const Duration(seconds: 3), (_) async {
      final socket = await RawDatagramSocket.bind(InternetAddress.anyIPv4, 0);

      socket.broadcastEnabled = true;

      final jsonData = jsonEncode(deviceData);

      socket.send(
        utf8.encode(jsonData),
        InternetAddress("255.255.255.255"),
        port,
      );

      socket.close();
    });
  }

  /// ********************** STOP SERVICE **********************
  /// Safely stops all network activities:
  /// - Closes UDP socket
  /// - Cancels broadcast timer
  /// - Releases resources
  void stop() {
    _socket?.close();
    _timer?.cancel();
    _server?.close();
  }
}
