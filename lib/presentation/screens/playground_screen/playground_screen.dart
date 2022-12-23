import 'package:ascension_mobile_app/presentation/screens/home_screen/home_screen.dart';
import 'package:ascension_mobile_app/presentation/screens/login_screen/login_screen.dart';
import 'package:ascension_mobile_app/presentation/screens/messages_screen/chat_screen.dart';
import 'package:ascension_mobile_app/presentation/screens/messages_screen/messages_screen.dart';
import 'package:ascension_mobile_app/presentation/screens/single_listing_screen/single_listing_screen.dart';
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
              onPressed: () {
                //Navigate to Messages Screen

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => const HomeScreen()),
                  ),
                );
              },
              child: const Text('Go to Home Screen'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => LoginScreen()),
                  ),
                );
              },
              child: const Text('Go to Login Screen'),
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
