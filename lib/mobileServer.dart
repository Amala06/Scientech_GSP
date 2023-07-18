import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'dart:convert';
import 'dart:async';
import 'dart:typed_data';
import 'dart:io';
// import 'dart:async';
// import 'dart:typed_data';
// import 'package:flutter/material.dart';
import 'package:get/get.dart';

typedef Uint8ListCallback = Function(Uint8List data);
typedef DynamicCallback = Function(dynamic data);
class Server {
   Uint8ListCallback? onData;
  DynamicCallback? onError;
  WebSocketChannel? channel;
  bool running = false;

  Server({this.channel});

  Future<void> start() async {
    channel = await WebSocketChannel.connect(Uri.parse('ws://192.168.0.1:81'));
    running = true;

    channel!.stream.listen(
      (dynamic message) {
        print(message);
        if (message is String) {
          final data = Uint8List.fromList(utf8.encode(message));
          onData!(data);
        }
      },
      onError: (error) {
        onError!(error);
      },
    );
  }

  void send(String data) {
    if (channel != null && channel!.sink != null) {
      final message = data; // Convert string to UTF-8 encoded bytes
      channel!.sink.add(message);
    }
  }

  Future<void> stop() async {
    await channel?.sink.close();
    channel = null;
    running = false;
  }
}
