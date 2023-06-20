import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trendwave/utils/app_theme.dart';

import 'screens/main.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MyHomePage();
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  bool isLoading = true;
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _animation =
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut);

    _animationController.forward();

    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: customTheme,
      home: isLoading
          ? Scaffold(
              body: Center(
                child: AnimatedBuilder(
                  animation: _animation,
                  builder: (BuildContext context, Widget? child) {
                    const text = "Trend Wave";
                    const textLength = text.length;
                    final visibleLength =
                        (_animation.value * textLength).floor();

                    return ShaderMask(
                      shaderCallback: (Rect bounds) {
                        return const LinearGradient(
                          colors: [
                            Colors.pink,
                            Colors.purple,
                            Colors.red,
                            Colors.cyan
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ).createShader(bounds);
                      },
                      child: Text(
                        text.substring(0, visibleLength),
                        style: GoogleFonts.caveat(
                          fontSize: 34,
                          color: Colors.white,
                        ),
                      ),
                    );
                  },
                ),
              ),
            )
          : const MainPage(),
    );
  }
}
