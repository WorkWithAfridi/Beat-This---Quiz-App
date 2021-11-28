import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/instruction_screen.dart';
import 'package:quiz_app/main.dart';

import 'category.dart';

class SelectCategoryTwo extends StatefulWidget {
  const SelectCategoryTwo({Key? key}) : super(key: key);

  @override
  _SelectCategoryTwoState createState() => _SelectCategoryTwoState();
}

class _SelectCategoryTwoState extends State<SelectCategoryTwo> {
  List<Category> categories = [
    Category(name: 'General Knowledge', callingNumber: 9),
    Category(name: 'Books', callingNumber: 10),
    Category(name: 'Film', callingNumber: 11),
    Category(name: 'Music', callingNumber: 12),
    Category(name: 'Musical & Theatres', callingNumber: 13),
    Category(name: 'Television', callingNumber: 14),
    Category(name: 'Video Games', callingNumber: 15),
    Category(name: 'Board Games', callingNumber: 16),
    Category(name: 'Science & Nature', callingNumber: 17),
    Category(name: 'Computer Science', callingNumber: 18),
    Category(name: 'Mathematics', callingNumber: 19),
    Category(name: 'Mythology', callingNumber: 20),
    Category(name: 'Sports', callingNumber: 21),
    Category(name: 'Geography', callingNumber: 22),
    Category(name: 'History', callingNumber: 23),
    Category(name: 'Politics', callingNumber: 24),
    Category(name: 'Art', callingNumber: 25),
    Category(name: 'Celebrities', callingNumber: 26),
    Category(name: 'Animals', callingNumber: 27),
    Category(name: 'Vehicles', callingNumber: 28),
    Category(name: 'Comics', callingNumber: 29),
    Category(name: 'Gadgets', callingNumber: 30),
    Category(name: 'Anime & Manga', callingNumber: 31),
    Category(name: 'Cartoon & Animation', callingNumber: 32),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(
          backgroundColor: Colors.amber,
          automaticallyImplyLeading: false,
          title: Text(
            'Selection Menu',
            style: TextStyle(fontFamily: 'RockSalt', fontSize: 10),
          ),
          centerTitle: false,
          leadingWidth: 0,
          elevation: 0,
        ),
      ),
      body: Container(
        color: Colors.black,
        child: Column(
          children: [
            Flexible(
              flex: 1,
              child: Container(
                width: double.infinity,
                color: Colors.amber,
                child: Container(
                  child: Center(
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 30),
                          child: Text(
                            'Please choose a',
                            style: TextStyle(fontFamily: 'Comfortaa'),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Text(
                            //   'Please choose a',
                            //   style: TextStyle(fontFamily: 'Comfortaa'),
                            // ),
                            // AnimatedTextKit(animatedTexts: [
                            //   ColorizeAnimatedText('Category',speed: Duration(seconds: 1),
                            //       textStyle: TextStyle(
                            //           fontFamily: 'Monoton', fontSize: 45),
                            //       colors: [Colors.black, Colors.yellow]),
                            // ]),

                            // SizedBox(height: 30,),
                            AnimatedTextKit(
                              animatedTexts: [
                                RotateAnimatedText(
                                  'Category',
                                  textStyle: TextStyle(
                                    fontFamily: 'Monoton',
                                    fontSize: 40,
                                  ),
                                ),
                                RotateAnimatedText(
                                  'Class',
                                  textStyle: TextStyle(
                                    fontFamily: 'Monoton',
                                    fontSize: 40,
                                  ),
                                ),
                                RotateAnimatedText(
                                  'Division',
                                  textStyle: TextStyle(
                                    fontFamily: 'Monoton',
                                    fontSize: 40,
                                  ),
                                ),
                                RotateAnimatedText(
                                  'Section',
                                  textStyle: TextStyle(
                                    fontFamily: 'Monoton',
                                    fontSize: 40,
                                  ),
                                ),
                                RotateAnimatedText(
                                  'Genre',
                                  textStyle: TextStyle(
                                    fontFamily: 'Monoton',
                                    fontSize: 40,
                                  ),
                                ),
                              ],
                              repeatForever: true,
                              isRepeatingAnimation: true,
                            ),

                            // Text(
                            //   'Category:',
                            //   style: TextStyle(fontFamily: 'Monoton', fontSize: 45),
                            // ),
                            // SizedBox(
                            //   height: 10,
                            // ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 4,
              child: Container(
                color: Colors.black,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(40))),
                  child: ListView.builder(
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.all(0),
                        child: Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(40),
                            ),
                            color: Colors.black,
                          ),
                          // color: Colors.red,
                          child: ListTile(
                            tileColor: Colors.red,
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => Instruction_Screen(
                                      categoryId:
                                          categories[index].callingNumber),
                                ),
                              );
                            },
                            title: Center(
                              child: Text(
                                categories[index].name,
                                style: const TextStyle(
                                    color: Colors.yellow,
                                    fontSize: 15,
                                    fontFamily: 'Comfortaa',
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 1.0),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              //
              // child: Container(
              //   width: double.infinity,
              //   child: ListView.builder(
              //     scrollDirection: Axis.horizontal,
              //       itemCount: categories.length,
              //       itemBuilder: (context, index) {
              //         return ListTile( onTap: (){}, title: Text(categories[index].name, style: TextStyle(color: Colors.white),),);
              //       }),
              // ),

              // child: Expanded(
              //   child: ListView.builder(
              //     itemCount: categories.length,
              //     physics: BouncingScrollPhysics(),
              //     itemBuilder: (context, index) {
              //       return Container(
              //         color: Colors.yellow,
              //         child: ListTile(
              //           onTap: (){},
              //           title: Center(
              //             child: Text(categories[index].name),
              //           ),
              //         )
              //       );
              //     },
              //   ),
              // ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // elevation: 10.0,
        onPressed: () {
          // Navigator.pushReplacement(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => myQuizApp(),
          //   ),
          // );
          Navigator.pop(context);
        },
        child:Text(
          'Back',
          style: TextStyle(fontFamily: 'Arial'),
        ),
      ),
    );
  }
}
