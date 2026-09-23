import 'package:flutter/material.dart';
import 'package:spotify_clone/core/app_assets.dart';
import 'package:spotify_clone/home_main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  @override
  void initState() {
    super.initState();
    
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(Duration(seconds: 2));

      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (route) {
            return const HomeMain();
          })
        );
      }
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color(0xEE4202F5).withValues(alpha: 74),
              const Color(0xEECA9AF0).withValues(alpha: 50),
              const Color(0xEEC0EAC9).withValues(alpha: 74),
            ]
          )
        ),
        child: Center(
          child: ImageIcon(
            AssetImage(AppAssets.appIcon),
            size: 150.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
