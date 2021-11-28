import 'dart:io';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:quiz_app/question.dart';
import 'package:quiz_app/questions_page.dart';
import 'package:quiz_app/real_challenge.dart';
import 'package:quiz_app/select_category_scene_two.dart';
import 'package:quiz_app/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.amber,
        // primaryColor: Colors.red,
      ),
      home: splashScreen(),
    );
  }
}

class myQuizApp extends StatefulWidget {
  const myQuizApp({Key? key}) : super(key: key);

  @override
  _myQuizAppState createState() => _myQuizAppState();
}

class _myQuizAppState extends State<myQuizApp> {
  late QuestionAndAnswers QuestionsAndAnswers = QuestionAndAnswers('', '', []);

  Future<void> getData() async {
    var dio = Dio();
    Response response = await dio.get(
        'https://opentdb.com/api.php?amount=1&category=18&difficulty=medium&type=multiple');
    //
    // print(response.data);
    // print('getData called');
    // //
    List dataDecoded = response.data['results'];
    // String QuestionOne = dataDecoded[0]['question'];
    // print(QuestionOne);

    QuestionsAndAnswers = QuestionAndAnswers(
      dataDecoded[0]['question'],
      dataDecoded[0]['correct_answer'],
      dataDecoded[0]['incorrect_answers'],
    );
  }

  Color TextColor = Colors.black;

  Widget getText() {
    return Column(
      children: [
        Text(
          'Do YOU',
          style: TextStyle(
            color: TextColor,
            fontWeight: FontWeight.w700,
            fontSize: 15,
            fontFamily: 'Arial',
            fontStyle: FontStyle.italic,
          ),
        ),
        Text(
          'have',
          style: TextStyle(
            color: TextColor,
            fontWeight: FontWeight.w700,
            fontSize: 15,
            fontFamily: 'Arial',
            fontStyle: FontStyle.italic,
          ),
        ),
        Text(
          'what it TAKEs',
          style: TextStyle(
            color: TextColor,
            fontWeight: FontWeight.w700,
            fontSize: 25,
            fontFamily: 'RockSalt',
            fontStyle: FontStyle.italic,
          ),
        ),
        Text(
          'to GET',
          style: TextStyle(
            color: TextColor,
            fontWeight: FontWeight.w700,
            fontSize: 15,
            fontFamily: 'Arial',
            fontStyle: FontStyle.italic,
          ),
        ),
        Text(
          'a',
          style: TextStyle(
            color: TextColor,
            fontWeight: FontWeight.w700,
            fontSize: 15,
            fontFamily: 'Arial',
            fontStyle: FontStyle.italic,
          ),
        ),
        Text(
          '10/10?!',
          style: TextStyle(
            color: TextColor,
            fontWeight: FontWeight.w700,
            fontSize: 20,
            fontFamily: 'Arial',
            fontStyle: FontStyle.italic,
          ),
        ),
        // AnimatedTextKit(
        //   animatedTexts: [
        //     // ColorizeAnimatedText(
        //     //   'Do you \nhave \nWHAT IT TAKES \nto get a \n10/10!?',
        //     //   textStyle: TextStyle(fontFamily: 'Comfortaa', fontSize: 25),
        //     //   colors: [Colors.black, Colors.yellow],
        //     // ),
        //     ColorizeAnimatedText(
        //       'Do you',
        //       textStyle: TextStyle(fontFamily: 'Comfortaa', fontSize: 25),
        //       colors: [Colors.yellow, Colors.black, Colors.yellow],
        //     ),
        //     ColorizeAnimatedText(
        //       'have',
        //       textStyle: TextStyle(fontFamily: 'Comfortaa', fontSize: 25),
        //       colors: [Colors.yellow, Colors.black, Colors.yellow],
        //     ),
        //     ColorizeAnimatedText(
        //       'WHAT IT TAKES',
        //       textStyle: TextStyle(fontFamily: 'Comfortaa', fontSize: 25),
        //       colors: [Colors.yellow, Colors.black, Colors.yellow],
        //     ),
        //     ColorizeAnimatedText(
        //       'to get a',
        //       textStyle: TextStyle(fontFamily: 'Comfortaa', fontSize: 25),
        //       colors: [Colors.yellow, Colors.black, Colors.yellow],
        //     ),
        //     ColorizeAnimatedText(
        //       '10/10!?',
        //       textStyle: TextStyle(fontFamily: 'Comfortaa', fontSize: 25),
        //       colors: [Colors.yellow, Colors.black, Colors.yellow],
        //     ),
        //   ],
        //   // totalRepeatCount: 10,
        //   repeatForever: true, isRepeatingAnimation: true,
        // ),
        // AnimatedTextKit(
        //   animatedTexts: [
        //     // ColorizeAnimatedText(
        //     //   'Do you \nhave \nWHAT IT TAKES \nto get a \n10/10!?',
        //     //   textStyle: TextStyle(fontFamily: 'Comfortaa', fontSize: 25),
        //     //   colors: [Colors.black, Colors.yellow],
        //     // ),
        //     // ColorizeAnimatedText(
        //     //   'Do you',
        //     //   textStyle: TextStyle(fontFamily: 'Comfortaa', fontSize: 25),
        //     //   colors: [Colors.yellow, Colors.black, Colors.yellow],
        //     // ),
        //     ColorizeAnimatedText(
        //       'have',
        //       textStyle: TextStyle(fontFamily: 'Comfortaa', fontSize: 25),
        //       colors: [Colors.yellow, Colors.black, Colors.yellow],
        //     ),
        //     // ColorizeAnimatedText(
        //     //   'WHAT IT TAKES',
        //     //   textStyle: TextStyle(fontFamily: 'Comfortaa', fontSize: 25),
        //     //   colors: [Colors.yellow, Colors.black, Colors.yellow],
        //     // ),
        //     // ColorizeAnimatedText(
        //     //   'to get a',
        //     //   textStyle: TextStyle(fontFamily: 'Comfortaa', fontSize: 25),
        //     //   colors: [Colors.yellow, Colors.black, Colors.yellow],
        //     // ),
        //     // ColorizeAnimatedText(
        //     //   '10/10!?',
        //     //   textStyle: TextStyle(fontFamily: 'Comfortaa', fontSize: 25),
        //     //   colors: [Colors.yellow, Colors.black, Colors.yellow],
        //     // ),
        //   ],
        //   // totalRepeatCount: 10,
        //   repeatForever: true, isRepeatingAnimation: true,
        // ),
        // AnimatedTextKit(
        //     repeatForever: true,
        //     animatedTexts: [
        //       FlickerAnimatedText('Do you \n have \n WHAT IT TAKEs \nto get a\n 10/10!? '),
        //     ])
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(
          backgroundColor: Colors.amber,
          shadowColor: Colors.transparent,

          title: const Text(
            'Beat this',
            style: TextStyle(
              fontSize: 15,
              fontFamily: 'RockSalt',
            ),
          ),
          // centerTitle: true,
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Flexible(
              flex: 18,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.amber,
                  // borderRadius: BorderRadius.only(
                  //   bottomLeft: Radius.circular(40.0),
                  //   bottomRight: Radius.circular(40.0),
                  // ),
                ),
                // height: 600,
                width: double.infinity,
                child: Center(
                  child: Stack(
                    children: [
                      // Image.asset(
                      //   "assets/background_images/material wallpaper.jpg",
                      //
                      //   fit: BoxFit.cover,
                      //   height: double.infinity,
                      //   width: double.infinity,
                      //   alignment: Alignment.center,
                      // ),
                      Container(
                        width: double.infinity,
                        height: double.infinity,
                        color: Colors.amber,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          getText(),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 170, right: 170, bottom: 10),
                            child: Divider(
                              color: Colors.black,
                              thickness: 1,
                            ),
                          ),
                          Container(
                            width: 230,
                            child: ElevatedButton(
                              onPressed: () {
                                getData();

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SelectCategoryTwo(),
                                  ),
                                );
                              },
                              child: const Text(
                                'Get Started',
                                style: TextStyle(
                                  fontFamily: 'Arial',
                                  fontStyle: FontStyle.italic,
                                  fontSize: 15.0,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                elevation: 10,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40.0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Flexible(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedTextKit(
                      animatedTexts: [
                        FadeAnimatedText(
                          'By Khondakar Afridi',
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontFamily: 'RockSalt',
                              fontSize: 11),
                          // colors: [Colors.black, Colors.white, Colors.black],
                        ),
                        FadeAnimatedText(
                          'Powered By OpenTDB.',
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontFamily: 'RockSalt',
                              fontSize: 11),
                          // colors: [Colors.black, Colors.white, Colors.black],
                        ),
                      ],
                      repeatForever: true,
                      isRepeatingAnimation: true,
                    ),

                    // Text(
                    //   'By Khondakar Afridi.',
                    //   style: TextStyle(
                    //       color: Colors.white,
                    //       fontFamily: 'RockSalt',
                    //       fontSize: 11),
                    // ),
                    // Text(
                    //   'Powered By OpenTDB.',
                    //   style: TextStyle(
                    //       color: Colors.white,
                    //       fontFamily: 'RockSalt',
                    //       fontSize: 10),
                    // ),
                  ],
                ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // elevation: 10.0,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RealChallenge(),
            ),
          );
        },
        child:Text(
          '>.<',
          style: TextStyle(fontFamily: 'RockSalt'),
        ),
      ),
    );
  }
}
