import 'dart:async';

import 'package:flutter/material.dart';

import '../../res/constant/app_images.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFFE50000),
            Color(0xFFD9090A),
            Color(0xFF1593AF),
          ],
          //stops: [0.3, 0.9, 1.0],
          begin: Alignment.topCenter,
          end: Alignment.center,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Align(
          alignment: Alignment.topCenter,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.7,
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: const BoxDecoration(
              color: Color(0x99000000),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
            ),
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                Image.asset(AppImages.appLogo),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                const Text(
                  "Make successful\nyour day",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 32,
                      fontFamily: "Creepster"),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.08),
                const Text(
                  "Make small somethings to get\n big gift in your life",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFC1CC41),
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.09),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(AppImages.design),
                    const Text(
                      "Let's Start",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF1AB8DB),
                        fontWeight: FontWeight.w500,
                        fontSize: 34,
                      ),
                    ),
                    Image.asset(AppImages.design),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
