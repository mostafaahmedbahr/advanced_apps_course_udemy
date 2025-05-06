import 'package:flutter/material.dart';

import '../../core/sh.dart';

class NotesAppBar extends StatelessWidget {
  const NotesAppBar({super.key});
  String _getGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning';
    } else if (hour < 17) {
      return 'Good Afternoon';
    } else {
      return 'Good Evening';
    }
  }
  @override
  Widget build(BuildContext context) {
    return   Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
         Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Hey ${SharedPreferencesHelper.getData(key: "UserName")} !",style: const TextStyle(
                fontSize: 18,fontWeight: FontWeight.bold,
                color: Colors.black
            ),),
             Text(_getGreeting(),style:const TextStyle(
                fontSize: 16,
                color: Colors.black
            ),),
          ],
        ),
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: Colors.pink.withOpacity(.4),
            shape: BoxShape.circle,
          ),
          child: Image.asset("assets/images/3d-cartoon-woman-sitting-thinking-solve-tasks.png",
            fit: BoxFit.cover,),
        ),
      ],
    );
  }
}
