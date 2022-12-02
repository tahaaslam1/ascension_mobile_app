import 'package:ascension_mobile_app/presentation/screens/messages_screen/chat_screen.dart';
import 'package:ascension_mobile_app/presentation/screens/messages_screen/messages_screen.dart';
import 'package:flutter/material.dart';

class PlaygroundScreen extends StatelessWidget {
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
                //Navigate to Login Screen..
              },
              child: const Text('Go to Login Screen'),
            ),
            TextButton(
              onPressed: () {
                //Navigate to Register Screen
              },
              child: const Text('Go to Register Screen'),
            ),
            TextButton(
              onPressed: () {
                //Navigate to Messages Screen

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => const MessagesScreen()),
                  ),
                );
              },
              child: const Text('Go to Messages Screen'),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('Go to Complete Authentication'),
            ),
          ],
        ),
      ),
    );
  }
}
