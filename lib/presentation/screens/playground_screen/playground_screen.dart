import 'package:ascension_mobile_app/presentation/screens/edit_profile_screen/edit_profile_screen.dart';
import 'package:ascension_mobile_app/presentation/screens/messages_screen/messages_screen.dart';
import 'package:ascension_mobile_app/presentation/screens/profile_screen/profile_screen.dart';
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
                        builder: ((context) => const MessagesScreen())));
              },
              child: const Text('Go to Messages Screen'),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('Go to Complete Authentication'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const ProfileScreen())));
              },
              child: const Text('Go to profile screen'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => EditProfileScreen())));
              },
              child: const Text('Go to profile screen'),
            ),
          ],
        ),
      ),
    );
  }
}
