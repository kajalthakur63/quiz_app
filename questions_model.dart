import '../alt_text.dart';

class Questions{
  dynamic question;
  List<dynamic> answers=[];

  Questions(this.question, this.answers);

  List<dynamic>getShuffleAnswers(){
    final shuffledList=List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }

}

List<Questions> quiz = [
  Questions(Qus1, [Option1, Option2, Option3, Option4]),
  Questions(Qus2, [Qus2Option1, Qus2Option2, Qus2Option3, Qus2Option4]),
  Questions(Qus3, [Qus3Option1, Qus3Option2, Qus3Option3, Qus3Option4]),
  Questions(Qus4, ['2', '4', '6', '8+']),
  Questions(Qus5, [Qus5Option1, Qus5Option2, Qus5Option3, Qus5Option4]),
  Questions(Qus6, [Qus6Option1, Qus6Option2, Qus6Option3, Qus6Option4]),
  Questions(Qus7, [Qus7Option1, Qus7Option2, Qus7Option3, Qus7Option4]),
  Questions(Qus8, [Qus8Option1, Qus8Option2, Qus8Option3, Qus8Option4]),
  Questions(Qus9, [Qus9Option1, Qus9Option2, Qus9Option3, Qus9Option4]),
  Questions(Qus10, [Qus10Option1, Qus10Option2, Qus10Option3, Qus10Option4]),
];





