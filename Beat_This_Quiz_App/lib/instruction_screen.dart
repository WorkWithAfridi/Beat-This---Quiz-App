import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/api_data_two.dart';
import 'package:quiz_app/question.dart';
import 'package:quiz_app/questions_page.dart';
import 'package:quiz_app/select_category_scene_two.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

class Instruction_Screen extends StatefulWidget {
  int categoryId;
  Instruction_Screen({Key? key, required this.categoryId}) : super(key: key);

  @override
  _Instruction_ScreenState createState() =>
      _Instruction_ScreenState(categoryId: categoryId);
}

class _Instruction_ScreenState extends State<Instruction_Screen> {
  int categoryId;
  int point = 0;
  late QuestionAndAnswers questionAndAnswers = QuestionAndAnswers('', '', []);
  // late QuestionAndAnswers questionAndAnswers;

  _Instruction_ScreenState({required this.categoryId});

  Future<void> getData() async {
    //call api and store json on response
    var response = await http.get(Uri.parse(
        "https://opentdb.com/api.php?amount=1&category=$categoryId&difficulty=medium&type=multiple"));

    //store body of response in json format
    var body = response.body;
    // print(body);

    //convert json to dart class, returns instance of RESULT
    Api_data_two data = Api_data_two.fromJson(jsonDecode(body));
    // print(data.results.toString());

    //store the values of RESULT in a list
    List<Results> results = data.results;
    // print(results[0].toJson());

    //MAP the list
    Map dataFromResults = results[0].toJson();

    print(dataFromResults['correct_answer'].toString());
    print(dataFromResults['question'].toString());
    print(dataFromResults['type']);
    print(dataFromResults['incorrect_answers']);

    //map the MAP data to questionAndANswer class
    questionAndAnswers = QuestionAndAnswers(
        dataFromResults['question'].toString(),
        dataFromResults['correct_answer'].toString(),
        dataFromResults['incorrect_answers']);

    // DIO Approach
    // var dio = Dio();
    // Response response = await dio.get('https://opentdb.com/api.php?amount=1&category=$categoryId&difficulty=medium&type=multiple');
    // List dataDecoded = response.data['results'];
    // questionAndAnswers = QuestionAndAnswers(
    //   dataDecoded[0]['question'],
    //   dataDecoded[0]['correct_answer'],
    //   dataDecoded[0]['incorrect_answers'],
    // );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
    startTimer();
  }

  late int timer = 10;
  late String time = '10';

  void startTimer() async {
    for (int i = 0; i < 10; i++) {
      await Future.delayed(Duration(seconds: 1));
      if(timer==1){
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => questions_page(
              questionAndAnswers: questionAndAnswers,
              point: point,
              categoryID: categoryId,
            ),
          ),
        );
      }else{
        setState(() {
          timer--;
          time = timer.toString();
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(
          backgroundColor: Colors.amber,
        ),
      ),
      body: Container(
        color: Colors.amber,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'INFO:',
              style: TextStyle(
                  fontFamily: 'Comfortaa',
                  fontWeight: FontWeight.w900,
                  fontSize: 25),
            ),
            const Text(
              'Base on this selection',
              style: TextStyle(fontFamily: 'Comfortaa'),
            ),
            const Text(
              'You will be asked 10 question.',
              style: TextStyle(fontFamily: 'Comfortaa'),
            ),
            const Text(
              'And based on the result, you will get a',
              style: TextStyle(fontFamily: 'Comfortaa'),
            ),
            Row(
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Cookie.',
                  style: TextStyle(fontFamily: 'Monoton', fontSize: 35),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  ':)',
                  style: TextStyle(fontFamily: 'Comfortaa', fontSize: 35),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: 230,
              child: ElevatedButton(
                onPressed: () {

                  timer=1;


                },
                child: Text(
                  'Lets GO!',
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
            ),const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Skipping in: ',
                  style: TextStyle(fontSize: 15, fontFamily: 'Arial'),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  time,
                  style: TextStyle(fontSize: 15, fontFamily: 'Arial'),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text('Back'),
      ),
    );
  }
}
