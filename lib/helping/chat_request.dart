// import 'package:socket_io_client/socket_io_client.dart' as IO;
// import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:socket_io_client_flutter/v3/socket_io_client_flutter.dart'
    as IO;
import 'package:vetner360/globalclass/color.dart';
import 'package:vetner360/helping/help.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';

class ChatRequest {
  static late IO.Socket socket;
  static bool isConnection = false;

  static void createConnection() async {
    socket = IO.io('http://vetner360.koyeb.app/',
        IO.OptionBuilder().setTransports(['websocket']).build());
    socket.onConnect(_connectionWithServer);
    socket.onDisconnect(_disconnectWithServer);
    socket.on('joined-room', _joinedRoomEvent);
  }

  static void _connectionWithServer(_) {
    print("Connected with device for real time messages");
    isConnection = true;
  }

  static void _disconnectWithServer(_) {
    isConnection = false;
    print('disconnect');
  }

  static void _joinedRoomEvent(data) {
    print("Join Room");
  }

  static Future<List?> loadChatMessage(
      BuildContext context, String roomId) async {
    try {
      var isInternet = await Helping.checkConnection();
      if (!isInternet) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("No Internet is connected"),
          backgroundColor: DoctorColor.red,
        ));
        return [];
      }

      final token = await Helping.getToken("token");
      Map<String, String> headers = {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      };
      final url = Uri.parse(
          "http://vetner360.koyeb.app/mobile/api/chat/messages/${roomId}");
      final response = await http.get(url, headers: headers);
      final data = jsonDecode(response.body);
      return data['records'];
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }

  static Future<dynamic?> getLatestMessage(
      String roomId, BuildContext context) async {
    try {
      var isInternet = await Helping.checkConnection();
      if (!isInternet) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("No Internet is connected"),
          backgroundColor: DoctorColor.red,
        ));
        return null;
      }

      final token = await Helping.getToken("token");
      Map<String, String> headers = {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      };
      final url = Uri.parse(
          "http://vetner360.koyeb.app/mobile/api/chat/messages/latest/${roomId}");
      final response = await http.get(url, headers: headers);
      final data = jsonDecode(response.body);
      return data['data'];
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }

  static Future<List> loadChatParticipant(String userId, int page,
      String search, int limit, BuildContext context) async {
    try {
      var isInternet = await Helping.checkConnection();
      if (!isInternet) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("No Internet is connected"),
          backgroundColor: DoctorColor.red,
        ));
        return [];
      }

      final token = await Helping.getToken("token");
      final formData = {
        "page": page + 1,
        "limit": limit,
        "search": search.length == 0 ? null : search,
      };
      Map<String, String> headers = {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      };
      final url = Uri.parse(
          "http://vetner360.koyeb.app/mobile/api/chat/participant/${userId}");
      final response =
          await http.post(url, headers: headers, body: jsonEncode(formData));
      final data = jsonDecode(response.body);
      return data['records'];
    } catch (e) {
      print("Error: $e");
      return [];
    }
  }

  static Future<void> setParticipant(BuildContext context, String? userId,
      String receiverId, String roomId) async {
    try {
      var isInternet = await Helping.checkConnection();
      if (!isInternet) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("No Internet is connected"),
          backgroundColor: DoctorColor.red,
        ));
        return;
      }

      final token = await Helping.getToken("token");
      final formData = {
        "userId": userId,
        "receiverId": receiverId,
        "roomId": roomId,
      };
      Map<String, String> headers = {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      };
      final url = Uri.parse(
          "http://vetner360.koyeb.app/mobile/api/chat/chat-participant/add");
      await http.post(url, headers: headers, body: jsonEncode(formData));
    } catch (e) {
      print("Error: $e");
    }
  }
}
