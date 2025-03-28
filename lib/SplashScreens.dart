import 'package:flutter/material.dart';
import 'main.dart';

void main() {
  runApp(SplashScreen());
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
setState(() {

});
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) { // context এর রেফারেন্স ঠিক রাখতে এটি ব্যবহার করা হয়েছে
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Main_HomeScreens()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,  // স্প্ল্যাশ স্ক্রিনের ব্যাকগ্রাউন্ড
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo.png', // আপনার লোগো অ্যাড করুন
                height: 300,
                width: 400,
              ),
              const SizedBox(height: 20),
              const CircularProgressIndicator(
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
