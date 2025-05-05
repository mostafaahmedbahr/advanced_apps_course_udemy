import 'package:flutter/material.dart';

class NotesAppBar extends StatelessWidget {
  const NotesAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return   Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Hey Mostafa !",style: TextStyle(
                fontSize: 18,fontWeight: FontWeight.bold,
                color: Colors.black
            ),),
            Text("Good Morning",style: TextStyle(
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
