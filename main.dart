import 'package:flutter/material.dart';
import 'package:quiz/custom_widgets/custom_text.dart';
import 'package:quiz/screens/question_screen.dart';
import 'package:quiz/screens/starting_screen.dart';

import 'custom_widgets/custom_button.dart';
import 'custom_widgets/custom_text_field.dart';
import 'demo.dart';
String LANGUAGE_TYPE = "eng";
CustomTextWidget customTextWidget=CustomTextWidget();
CustomButton customButton = CustomButton();
CustomTextFieldWidget customTextFieldWidget= CustomTextFieldWidget();
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:StartingScreen(),

      debugShowCheckedModeBanner: false,
    );

  }
}


