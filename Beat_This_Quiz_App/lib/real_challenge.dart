import 'package:flutter/material.dart';

class RealChallenge extends StatefulWidget {
  const RealChallenge({Key? key}) : super(key: key);

  @override
  _RealChallengeState createState() => _RealChallengeState();
}

class _RealChallengeState extends State<RealChallenge> {
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
        width: double.infinity,
        height: double.infinity,
        color: Colors.amber,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Want a real CHALLENGE?',
              style: TextStyle(fontFamily: 'Comfortaa', fontSize: 20),
            ),
            Text('Then look no further,',
                style: TextStyle(fontFamily: 'Comfortaa', fontSize: 20)),
            Text('Enter the hall of random fired QUESTIONS!!',
                style: TextStyle(fontFamily: 'Comfortaa', fontSize: 15)),
            Text('NO SKIPS',
                style: TextStyle(fontFamily: 'Comfortaa', fontSize: 20)),
            Text('10s for EVERY QUESTION',
                style: TextStyle(fontFamily: 'Comfortaa', fontSize: 20)),
            Text('ATTEMPT AS MANY AS YOU LIKE.',
                style: TextStyle(fontFamily: 'Comfortaa', fontSize: 20)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text(
          'Back',
          style: TextStyle(
            fontFamily: 'Arial',
          ),
        ),
      ),
    );
  }
}
