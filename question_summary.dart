import 'package:flutter/material.dart';
import 'package:quiz/main.dart';

class QuestionsSummary extends StatelessWidget {
  final List<Map<String, Object>> summaryData;
  const QuestionsSummary({required this.summaryData, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 360,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return Row(
              children: [
                customTextWidget.regularText(
                    text: 'Q${data['question_index']}', color: Colors.black),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      customTextWidget.semiBoldText(
                          text: '${data['question']}', color: Colors.black),
                      const SizedBox(
                        height: 5,
                      ),
                      customTextWidget.semiBoldText(
                          text:
                              'Your Answer: ${data['user_answer'].toString()}',
                          color: Colors.black),
                      customTextWidget.regularText(
                          color: data['user_answer'] ==
                                  data['correct_answer'].toString()
                              ? Colors.green.shade900
                              : Colors.red,
                          text: 'Correct Answer: ${data['correct_answer']}'),
                    ],
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
