import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiz/alt_text.dart';
import 'package:quiz/main.dart';
import 'package:quiz/models/questions_model.dart';
import 'package:quiz/screens/result_screen.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({Key? key, required this.onSelectAnswer})
      : super(key: key);
  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  List<String> selectedAnswers = [];

  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    selectedAnswers.add(selectedAnswer);
    widget.onSelectAnswer(selectedAnswer);
    if (currentQuestionIndex < quiz.length - 1) {
      setState(() {
        currentQuestionIndex++;
      });
    } else {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ResultScreen(
                    chosenAnswer: selectedAnswers,
                  )));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.purple.shade300,
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  customTextWidget.boldText(
                      text: quiz[currentQuestionIndex].question,
                      color: Colors.white,
                      alignment: TextAlign.center,
                      fontSize: 20),
                  SizedBox(
                    height: 20,
                  ),
                  ...quiz[currentQuestionIndex]
                      .getShuffleAnswers()
                      .map((answer) {
                    return ElevatedButton(
                      onPressed: () {
                        answerQuestion(answer.toString());
                      },
                      child: customTextWidget.regularText(
                          text: answer,
                          color: Colors.white,
                          alignment: TextAlign.center),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black12,
                        fixedSize: Size(
                          MediaQuery.of(context).size.width * 0.8,
                          40.0, // Set the desired height
                        ),
                      ),
                    );
                  })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
