import 'package:flutter/material.dart';

class OnboardingNoteImage extends StatelessWidget {
  const OnboardingNoteImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
    top: MediaQuery.of(context).padding.top + 80, // Below status bar
left: 0,
right: 0,
child: Center(
child: Image.asset(
"assets/images/3d-cartoon-woman-sitting-thinking-solve-tasks.png",
height: MediaQuery.of(context).size.height * 0.4, // Adjust as needed
fit: BoxFit.contain,
),
),
);
  }
}
