import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/core/constants/app_images.dart';

import 'app/navigation/main_shell.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});
  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  // This single true/false controls the FADE.
  // false = hidden (opacity 0). true = shown (opacity 1).
  // We start hidden, then flip it to true so everything fades IN.
  bool _visible = false;

  @override
  void initState() {
    super.initState();

    // A tenth of a second after the screen opens, turn things visible.
    // AnimatedOpacity only animates when its opacity value *changes*, so this
    // flip from false -> true is exactly what triggers the smooth fade-in.
    Future.delayed(const Duration(milliseconds: 200), () {
      if (!mounted) return; // safety: only act if the screen still exists
      setState(() => _visible = true);
    });

    // After the splash has been enjoyed for 3 seconds, go to the main app.
    Future.delayed(const Duration(seconds: 2), () {
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MainShell()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: Column(
          children: [
            Gap(200.h),

            // ---------------- LOGO ----------------
            // AnimatedOpacity = the EASIEST animation in Flutter.
            // You give it an opacity; when that number changes, Flutter smoothly
            // animates to it over "duration". Here: 0 (hidden) -> 1 (visible).
            AnimatedOpacity(
              opacity: _visible ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 1000),
              curve: Curves.easeOut, // start quick, gently slow to a stop
              // TweenAnimationBuilder = animate ANY number from begin -> end,
              // once, automatically, the moment it appears on screen.
              // It hands us that number ("scale") and we use it however we want.
              child: TweenAnimationBuilder<double>(
                tween: Tween(begin: 0.8, end: 1.0), // grow from 80% to 100%
                duration: const Duration(milliseconds: 1000),
                // easeOutBack grows slightly PAST 1.0 then settles back — a
                // tiny, cute "pop" that makes the logo feel alive.
                curve: Curves.easeOutBack,
                builder: (context, scale, child) {
                  // Transform.scale just resizes its child by "scale".
                  return Transform.scale(scale: scale, child: child);
                },
                // "child" is built ONCE and reused every frame (good for speed),
                // instead of rebuilding the logo on every tiny step.
                child: SvgPicture.asset(AppImages.logo, width: 300.w),
              ),
            ),

            const Spacer(),

            // ---------------- BURGER ----------------
            // Same idea: fade in with AnimatedOpacity...
            AnimatedOpacity(
              opacity: _visible ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 1100),
              curve: Curves.easeOut,
              // ...and glide UP with TweenAnimationBuilder.
              child: TweenAnimationBuilder<double>(
                tween: Tween(begin: 40.0, end: 0.0), // start 40px down -> 0
                duration: const Duration(milliseconds: 1000),
                curve: Curves.easeOut,
                builder: (context, moveDown, child) {
                  // Offset(0, moveDown): a positive Y pushes the child DOWN.
                  // moveDown travels 40 -> 0, so the burger slides UP into place.
                  return Transform.translate(
                    offset: Offset(0, moveDown),
                    child: child,
                  );
                },
                child: Image.asset(AppImages.splashImg, height: 300.h),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
