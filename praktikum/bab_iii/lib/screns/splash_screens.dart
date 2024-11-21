import 'package:flutter/material.dart';
import 'package:praktikum/main.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Menambahkan delay selama 4 detik sebelum berpindah ke HomeScreen
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    });

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center content vertically
          children: [
            // Add the M.tiX logo here
            Image.asset(
              'assets/logo-mtix.png', // Adjust the path according to your assets
              width: 300,  // Set the width of the logo
              height: 300, // Set the height of the logo
              fit: BoxFit.contain,  // Ensure the logo fits within the given width and height
            ),
            const SizedBox(height: 20), // Add some space between the logo and the text
            // const Text(
            //   'M.tiX',
            //   style: TextStyle(
            //     fontSize: 40,
            //     fontWeight: FontWeight.bold,
            //     color: Colors.white,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}