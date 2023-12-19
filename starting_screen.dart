import 'package:flutter/material.dart';
import 'package:quiz/alt_text.dart';
import 'package:quiz/screens/question_screen.dart';

import '../main.dart';

class StartingScreen extends StatefulWidget {
  const StartingScreen({Key? key}) : super(key: key);

  @override
  State<StartingScreen> createState() => _StartingScreenState();
}

class _StartingScreenState extends State<StartingScreen> {
  List<String> selectedAnswer = [];


  void chooseAnswer(String answer) {
      selectedAnswer.add(answer);

  }

  void changeLanguage(String newLanguage) {
    setState(() {
      LANGUAGE_TYPE = newLanguage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.purple.shade300,
        body: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child:
              PopupMenuButton(
                onSelected: (String newLanguage) {
                  changeLanguage(newLanguage);
                },
                itemBuilder: (BuildContext context) => [
                  PopupMenuItem(
                    value: 'hindi',
                    child: Text('Hindi'),
                  ),
                 PopupMenuItem(
                    value: 'eng',
                    child: Text('English'),
                  ),
                ],
              ),
            ),
            Image.asset(
              'assets/depositphotos_124611694-stock-photo-books-with-question-mark-symbol.jpeg',
              height: 500,
              width: double.infinity,
              color: Colors.purple.shade300,
              colorBlendMode: BlendMode.multiply,
            ),
            customTextWidget.boldText(
                fontSize: 24, text: WELCOME, color: Colors.white),
          const  SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => QuestionScreen(
                                onSelectAnswer: chooseAnswer,
                              )));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    customTextWidget.regularText(
                      text: START,
                      color: Colors.purple,
                    ),
                   const Icon(Icons.arrow_forward),
                  ],
                )),

          ],
        ),
      ),
    );
  }
}
