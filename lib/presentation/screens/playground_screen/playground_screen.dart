import 'package:ascension_mobile_app/logger.dart';
import 'package:ascension_mobile_app/routes/router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class PlaygroundScreen extends StatelessWidget {
  static const String route = 'playground';

  const PlaygroundScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Playground Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 12,
            ),
            TextButton(
              onPressed: () {
                context.router.push(const ViewBidingRoute());
              },
              child: const Text('Go to View Biding Screen'),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('Create Listing Flow Screens....'),
            ),
            TextButton(
              onPressed: () {
                final channel = WebSocketChannel.connect(
                  Uri.parse('ws://192.168.18.58:3000/v1/connection/?receiver_id=f577fa50-8ac3-11ed-894e-8d97469d78b0&sender_id=0894dc70-8ac4-11ed-894e-8d97469d78b0'),
                );
                // Future.delayed(const Duration(seconds: 10), () {
                //   channel.sink.close();
                // });
              },
              child: const Text('test websocket'),
            ),
          ],
        ),
      ),
    );
  }
}
