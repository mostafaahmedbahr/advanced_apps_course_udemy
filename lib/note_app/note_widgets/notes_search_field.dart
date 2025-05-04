import 'package:flutter/material.dart';

class NotesSearchField extends StatelessWidget {
  const NotesSearchField({super.key, this.controller});
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value){},
      onTap: (){},
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      style: const TextStyle(
        color: Colors.black,
      ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 15,horizontal: 15),
        prefixIcon:    Icon(Icons.search,  color:Colors.grey.withOpacity(.4),),
        filled: true,
        fillColor:  Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(  5),
          borderSide:     BorderSide(
            color:Colors.grey.withOpacity(.4),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular( 5),
          borderSide:     BorderSide(
            color:Colors.grey.withOpacity(.4),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(    5),
          borderSide:     BorderSide(
            color:Colors.grey.withOpacity(.4),
          ),
        ),
        hintText: "Search",
        hintStyle:       TextStyle(
          fontSize: 14,
          color:Colors.grey.withOpacity(.4),
        ),
      ),
    );
  }
}
