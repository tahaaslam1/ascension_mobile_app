import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          //   crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 175,
              width: 408,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/image.png"),
                  fit: BoxFit.fill,
                  // alignment: Alignment.topCenter,
                ),
              ),
            ),
            const SizedBox(
              height: 31,
            ),
            const Text(
              "Let's Sign In: ",
              style: TextStyle(
                color: Color(0xFF1F4C6B),
                fontSize: 25.0,
                fontFamily: 'Lato',
                fontWeight: FontWeight.w500,
                letterSpacing: 0.75,
                height: 1.00,
              ),
            ),
            const SizedBox(
              height: 52,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Email',
                  prefixIcon: const Icon(Icons.email),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide:
                        const BorderSide(color: Colors.grey, width: 327),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Password',
                  prefixIcon: const Icon(Icons.lock),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide:
                        const BorderSide(color: Colors.grey, width: 327),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Forgot password?",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Color(0xFF1F4C6B),
                      fontSize: 12,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.36,
                      height: 1.00,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Show Password",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Color(0xFF1F4C6B),
                      fontSize: 12,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.36,
                      height: 1.00,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 42),
            SizedBox(
              height: 63,
              width: 278,
              child: ElevatedButton(
                  onPressed: (() {}),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF8BC83F),
                      elevation: 3,
                      padding: const EdgeInsets.all(20)),
                  child: const Text('Login')),
            ),
            const SizedBox(
              height: 112,
            ),
            const Text(
              'OR',
              style: TextStyle(
                color: Color(0xffA1A5C1),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 25,
                    width: 25,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/google.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    //   print("hello");
                  },
                  child: Container(
                    height: 25,
                    width: 25,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/facebook.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 92),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Don’t have an account?",
                  style: TextStyle(
                    color: Color(0xFF1F4C6B),
                    fontSize: 20,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.36,
                    height: 1.00,
                  ),
                ),
                Text(
                  " Register",
                  style: TextStyle(
                    color: Color(0xFF1F4C6B),
                    fontSize: 20,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.36,
                    height: 1.00,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
