 import 'package:flutter/material.dart';

class TitleSubTitleTexts extends StatelessWidget {
  const TitleSubTitleTexts({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text("Create free notes & collaborate\nwith your team",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          textAlign: TextAlign.center,),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 50,vertical: 10),
          child: Text("Real-time editing • Unlimited notes • Free forever",
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
            textAlign: TextAlign.center,),
        ),
      ],
    );
  }
}
