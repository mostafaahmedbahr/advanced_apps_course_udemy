import 'package:flutter/material.dart';
import '../note_widgets/note_start_button.dart';
import '../note_widgets/on_boarding_note_image.dart';
import '../note_widgets/title_sub_title_texts.dart';
import '../note_widgets/wave_clipper.dart';

class OnBoardingNoteScreen extends StatelessWidget {
  const OnBoardingNoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: [
              ClipPath(
                clipper: WaveClipper(),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  color: Colors.pink.withOpacity(.4),

                ),
              ),
              const SizedBox(height: 20,),
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    TitleSubTitleTexts(),
                    SizedBox(height: 60,),
                    NoteStartButton(),
                  ],
                ),
              ),

            ],

          ),
          const OnboardingNoteImage(),

        ],
      ),
    );
  }
}
