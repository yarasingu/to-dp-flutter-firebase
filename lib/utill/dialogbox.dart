// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:myapp/utill/my_button.dart';

class DialogBoxs extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

   DialogBoxs({super.key, required this.controller  , required this.onSave, required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow,
      content: SizedBox(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Add a new task',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [ 
              MyButton(text: "save", onPressed: onSave),
              const SizedBox(width: 8,),
              MyButton(text: "cancel", onPressed: onCancel),
            ],),
            ],
        ),
      ),
    );
  }
}