import 'package:html_unescape/html_unescape.dart';

class QuestionAndAnswers {
  String questionAsked = '';
  String correctAnsweer = '';
  List incorrectAnwer = [];
  QuestionAndAnswers(questionAsked, correctAnswer, incorrectAnswer) {
    this.questionAsked = questionAsked;
    this.correctAnsweer = correctAnswer;
    this.incorrectAnwer = incorrectAnswer;
    formatEverything();
    incorrectAnwer.add(correctAnswer);
  }

  void formatEverything(){
    var unescape=HtmlUnescape();
    questionAsked=unescape.convert(questionAsked);
    correctAnsweer=unescape.convert(correctAnsweer);
    incorrectAnwer[0]=unescape.convert(incorrectAnwer[0]);
    incorrectAnwer[1]=unescape.convert(incorrectAnwer[1]);
    incorrectAnwer[2]=unescape.convert(incorrectAnwer[2]);
  }


  String getQuestion() {
    return questionAsked;
  }

  String getCorrectAnswer() {
    return correctAnsweer;
  }

  List getAnswers() {
    return incorrectAnwer;
  }
}
