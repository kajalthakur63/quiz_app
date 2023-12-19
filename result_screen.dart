import 'package:flutter/material.dart';
import 'package:quiz/main.dart';
import '../alt_text.dart';
import 'starting_screen.dart';
import 'question_summary.dart';
import '../models/questions_model.dart';

class ResultScreen extends StatelessWidget {
  final List<String> chosenAnswer;

  ResultScreen({
    Key? key,
    required this.chosenAnswer,
  }) : super(key: key);

  int calculateCorrectAnswers() {
    int correctCount = 0;
    for (int i = 0; i < chosenAnswer.length; i++) {
      if (chosenAnswer[i] == quiz[i].answers[0].toString()) {
        correctCount++;
      }
    }
    return correctCount;
  }


  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < chosenAnswer.length; i++) {
      summary.add({
        'question_index': (i + 1).toString(),
        'question': quiz[i].question,
        'correct_answer': quiz[i].answers[0],
        'user_answer': chosenAnswer[i]
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    int correctedCount = calculateCorrectAnswers();

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.purple.shade300,
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'You answered $correctedCount out of ${quiz.length} questions correctly',
                  style:const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 30,),
                QuestionsSummary(summaryData: getSummaryData()),
                const SizedBox(height: 30,),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StartingScreen(),
                      ),
                    );
                  },
                  child: customTextWidget.regularText(
                    text: RESTART,color: Colors.white
                  )
                  //Text('Restart Quiz!',style: TextStyle(color: Colors.white),),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
