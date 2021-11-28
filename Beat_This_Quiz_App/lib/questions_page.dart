import 'dart:async';
import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/main.dart';
import 'package:quiz_app/question.dart';
import 'package:http/http.dart' as http;

import 'api_data_two.dart';

class questions_page extends StatefulWidget {
  QuestionAndAnswers questionAndAnswers;
  int point;
  int categoryID;
  questions_page(
      {Key? key,
      required this.questionAndAnswers,
      required this.point,
      required this.categoryID})
      : super(key: key);

  @override
  _questions_pageState createState() => _questions_pageState(
      questionAndAnswers: questionAndAnswers,
      point: point,
      categoryId: categoryID);
}

class _questions_pageState extends State<questions_page> {
  QuestionAndAnswers questionAndAnswers;
  int point;
  int categoryId;
  late String question;
  late String OptionOne;
  late String OptionTwo;
  late String OptionThree;
  late String OptionFour;

  final Color correct = Colors.green;
  final Color wrong = Colors.red;
  late Color defaultTextColor = Colors.black;

  late String nextOrSkip;

  final String tick = ' ✔';
  final String cross = ' ❌';

  late Color ColorOne;
  late Color ColorTwo;
  late Color ColorThree;
  late Color ColorFour;

  bool loadNextQuestion=true;

  _questions_pageState(
      {required this.questionAndAnswers,
      required this.point,
      required this.categoryId});

  Future<void> getData() async {
    var response = await http.get(Uri.parse(
        "https://opentdb.com/api.php?amount=1&category=$categoryId&difficulty=medium&type=multiple"));
    var body = response.body;
    Api_data_two data = Api_data_two.fromJson(jsonDecode(body));
    List<Results> results = data.results;
    Map dataFromResults = results[0].toJson();
    questionAndAnswers = QuestionAndAnswers(
        dataFromResults['question'].toString(),
        dataFromResults['correct_answer'].toString(),
        dataFromResults['incorrect_answers']);
  }

  @override
  void initState() {
    attemptedQuestions++;
    nextOrSkip = 'Skip';
    // TODO: implement initState
    super.initState();
    // counter = 20;
    // print(questionAndAnswers.getQuestion());

    defaultTextColor = Colors.black;
    ColorOne = defaultTextColor;
    ColorTwo = defaultTextColor;
    ColorThree = defaultTextColor;
    ColorFour = defaultTextColor;

    updateState();
    // print(question);
  }

  late int i = 0;
  late int counter = 20;
  late int skipsLeft = 5;
  late int attemptedQuestions = 0;
  void startTimer() async {
    for (i = 0; i < 20; i++) {
      await Future.delayed(Duration(seconds: 1));
      counter--;
      setState(() {});
      if(counter==0){
        i=20;
        if(loadNextQuestion){
          skip();
        }
        else{

        }
      }
      print(counter);
    }
  }

  void skip() async {
    nextOrSkip = 'Skip';
    await getData();
    updateState();
    i = 0;
    counter = 20;
  }

  void updateState() {
    defaultTextColor = Colors.black;
    ColorOne = defaultTextColor;
    ColorTwo = defaultTextColor;
    ColorThree = defaultTextColor;
    ColorFour = defaultTextColor;


    underlineOptionOne=false;
    underlineOptionTwo=false;
    underlineOptionThree=false;
    underlineOptionFour=false;

    setState(() {
      List answerChoices = questionAndAnswers.getAnswers();
      question = questionAndAnswers.getQuestion();
      // print(question);
      // print(answerChoices);
      answerChoices.shuffle();
      OptionOne = answerChoices[0];
      OptionTwo = answerChoices[1];
      OptionThree = answerChoices[2];
      OptionFour = answerChoices[3];
      // print(questionAndAnswers.getQuestion());
    });

    startTimer();
  }

  bool underlineOptionOne=false;
  bool underlineOptionTwo=false;
  bool underlineOptionThree=false;
  bool underlineOptionFour=false;

  void results(String answer) async {
    counter=5;
    i=5;
    nextOrSkip = 'Next';
    ColorOne = wrong;
    ColorTwo = wrong;
    ColorThree = wrong;
    ColorFour = wrong;
    if (answer == questionAndAnswers.correctAnsweer && answer == OptionOne) {
      ColorOne = correct;
      point++;
    } else if (answer == questionAndAnswers.correctAnsweer &&
        answer == OptionTwo) {
      ColorTwo = correct;
      point++;
    } else if (answer == questionAndAnswers.correctAnsweer &&
        answer == OptionThree) {
      ColorThree = correct;
      point++;
    } else if (answer == questionAndAnswers.correctAnsweer &&
        answer == OptionFour) {
      ColorFour = correct;
      point++;
    }

    if(answer==OptionOne){
      underlineOptionOne=true;
    }else if(answer==OptionTwo){
      underlineOptionTwo=true;
    }else if(answer==OptionThree){
      underlineOptionThree=true;
    }else if(answer==OptionFour){
      underlineOptionFour=true;
    }

    if (questionAndAnswers.correctAnsweer == OptionOne) {
      ColorOne = correct;
      OptionOne += ' $tick';
      OptionTwo += ' $cross';
      OptionThree += ' $cross';
      OptionFour += ' $cross';
    } else if (questionAndAnswers.correctAnsweer == OptionTwo) {
      ColorTwo = correct;
      OptionOne += ' $cross';
      OptionTwo += ' $tick';
      OptionThree += ' $cross';
      OptionFour += ' $cross';
    } else if (questionAndAnswers.correctAnsweer == OptionThree) {
      ColorThree = correct;
      OptionOne += ' $cross';
      OptionTwo += ' $cross';
      OptionThree += ' $tick';
      OptionFour += ' $cross';
    } else if (questionAndAnswers.correctAnsweer == OptionFour) {
      ColorFour = correct;
      OptionOne += ' $cross';
      OptionTwo += ' $cross';
      OptionThree += ' $cross';
      OptionFour += ' $tick';
    }

    if (point == 10) {
      showDialog<void>(
        context: context,
        // false = user must tap button, true = tap outside dialog
        builder: (BuildContext dialogContext) {
          return AlertDialog(
            title: Text('Awesome!!'),
            content: const Text(
                'You managed to score 10/10 with in the given timeframe. Well done.'),
            actions: <Widget>[
              TextButton(
                child: Text(
                  'Home',
                  style:
                      TextStyle(color: Colors.black, fontFamily: 'Comfortaa'),
                ),
                onPressed: () {
                  Navigator.of(dialogContext).pop(); // Dismiss alert dialog
                },
              ),
              TextButton(
                child: Text(
                  'Keep on playing',
                  style:
                      TextStyle(color: Colors.black, fontFamily: 'Comfortaa'),
                ),
                onPressed: () {
                  Navigator.of(dialogContext).pop(); // Dismiss alert dialog
                },
              ),
            ],
          );
        },
      );
    }

    updateStateAfterSelection();
  }

  void updateStateAfterSelection() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(),
      ),
      body: Container(
        color: Colors.amber,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              flex: 2,
              child: Container(
                width: double.infinity,
                color: Colors.amber,
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 60, right: 60),
                            child: AutoSizeText(
                              question,
                              overflow: TextOverflow.visible,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Comfortaa',
                                  fontSize: 25),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            '$point/10',
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontFamily: 'Arial'),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                        ],
                      ),

                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Divider(
                          thickness: 1,
                          color: Colors.black,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                'Skips Left:',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Comfortaa'),
                              ),
                              // SizedBox(width: 15,),
                              Text(
                                skipsLeft.toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'RockSalt',
                                    fontSize: 20),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                'Timer:',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Comfortaa'),
                              ),
                              // SizedBox(width: 15,),
                              Text(
                                counter.toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'RockSalt',
                                    fontSize: 20),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                'Attempted\nQuestions:',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Comfortaa'),
                              ),
                              // SizedBox(width: 15,),
                              Text(
                                attemptedQuestions.toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'RockSalt',
                                    fontSize: 20),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Divider(
                          thickness: 1,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(
                width: double.infinity,
                child: Column(
                  children: [
                    Flexible(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () {
                              results(OptionOne);
                            },
                            child: Container(
                              // decoration: const BoxDecoration(
                              //   color: Colors.black,
                              //   borderRadius:
                              //       BorderRadius.all(Radius.circular(40)),
                              // ),
                              // height: 50,
                              width: double.infinity,
                              child: Center(
                                child: AutoSizeText(
                                  OptionOne,
                                  style: TextStyle(
                                    decoration: underlineOptionOne?TextDecoration.underline:null,
                                      fontFamily: 'Comfortaa',
                                      fontSize: 15,
                                      color: ColorOne),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              results(OptionTwo);
                            },
                            child: Container(
                              width: double.infinity,
                              child: Center(
                                child: AutoSizeText(
                                  OptionTwo,
                                  style: TextStyle(
                                      decoration: underlineOptionTwo?TextDecoration.underline:null,
                                      fontFamily: 'Comfortaa',
                                      fontSize: 15,
                                      color: ColorTwo),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              results(OptionThree);
                            },
                            child: Container(
                              width: double.infinity,
                              child: Center(
                                child: AutoSizeText(
                                  OptionThree,
                                  style: TextStyle(
                                      decoration: underlineOptionThree?TextDecoration.underline:null,
                                      fontFamily: 'Comfortaa',
                                      fontSize: 15,
                                      color: ColorThree),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              results(OptionFour);
                            },
                            child: Container(
                              width: double.infinity,
                              child: Center(
                                child: AutoSizeText(
                                  OptionFour,
                                  style: TextStyle(
                                      decoration: underlineOptionFour?TextDecoration.underline:null,
                                      fontFamily: 'Comfortaa',
                                      fontSize: 15,
                                      color: ColorFour),
                                ),
                              ),
                            ),
                          ),
                          // Text('OptionOne'),
                          // Text('OptionTwo'),
                          // Text('OptionThree'),
                          // Text('OptionFour'),
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 130,
                            child: ElevatedButton(
                              onPressed: () {
                                loadNextQuestion=false;
                                i = 18;
                                // Navigator.pushReplacement(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) => myQuizApp(),
                                //   ),
                                // );
                                Navigator.pop(context);
                              },
                              child: const Text(
                                'Cancel',
                                style: TextStyle(
                                  fontFamily: 'RockSalt',
                                  fontStyle: FontStyle.italic,
                                  fontSize: 15.0,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.red,
                                elevation: 10,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40.0),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 130,
                            child: ElevatedButton(
                              onPressed: () {
                                attemptedQuestions++;
                                i = 19;
                                if (nextOrSkip == 'Skip') {
                                  skipsLeft--;
                                }
                                if(nextOrSkip=='Next'){
                                  underlineOptionOne=false;
                                  underlineOptionTwo=false;
                                  underlineOptionThree=false;
                                  underlineOptionFour=false;
                                }
                                counter=1;
                              },
                              child: Text(
                                nextOrSkip,
                                style: const TextStyle(
                                  fontFamily: 'Arial',
                                  fontStyle: FontStyle.italic,
                                  fontSize: 15.0,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                elevation: 10,
                                // primary: Colors.yellowAccent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40.0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
