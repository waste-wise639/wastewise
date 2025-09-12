import 'package:flutter/material.dart';
import 'package:wastewise/Utilities/app_colors.dart';
import 'package:wastewise/Utilities/app_images.dart';
import 'package:wastewise/Utilities/reusables.dart';
import 'package:wastewise/Views/Auth/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _dropController;
  late AnimationController _exitController;
  late Animation<double> _dropAnimation;
  late Animation<Offset> _slideOutAnimation;
  late Animation<double> _fadeOutAnimation;

  bool showLogo = true;

  @override
  void initState() {
    super.initState();

    _dropController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _dropAnimation = Tween<double>(begin: -200, end: 0).animate(
      CurvedAnimation(parent: _dropController, curve: Curves.bounceOut),
    );

    _exitController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _slideOutAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: Offset(0, 2), // Slide down
    ).animate(CurvedAnimation(parent: _exitController, curve: Curves.easeIn));

    _fadeOutAnimation = Tween<double>(
      begin: 1.0,
      end: 0.0,
    ).animate(CurvedAnimation(parent: _exitController, curve: Curves.easeIn));

    // Start drop animation
    _dropController.forward();

    // After 3s, slide out and fade
    Future.delayed(Duration(seconds: 4), () {
      _exitController.forward();
    });

    // After total 4s, navigate
    Future.delayed(Duration(seconds: 5), () {
      goTo(context, const OnBoardingScreen());
    });
  }

  @override
  void dispose() {
    _dropController.dispose();
    _exitController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    SizeConfig.init(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kColors.primaryColor,
        toolbarHeight: 0.001,
      ),
      backgroundColor: kColors.primaryColor,
      body: AnimatedBuilder(
        animation: Listenable.merge([_dropController, _exitController]),
        builder: (context, child) {
          return Stack(
            children: [
              Positioned(
                top: _dropAnimation.value + size.height * 0.43,
                left: size.width * 0.43,
                child: SlideTransition(
                  position: _slideOutAnimation,
                  child: FadeTransition(
                    opacity: _fadeOutAnimation,
                    child: Image.asset(kImages.appLogo, height: hp(8)),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
