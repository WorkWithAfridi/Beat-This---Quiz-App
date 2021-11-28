import 'package:flutter/material.dart';
import 'package:quiz_app/splash_screen.dart';


class NoInternetConnection extends StatefulWidget {
  const NoInternetConnection({Key? key}) : super(key: key);

  @override
  _NoInternetConnectionState createState() => _NoInternetConnectionState();
}

class _NoInternetConnectionState extends State<NoInternetConnection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.red,
        child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Error:',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                    fontFamily: 'Arial',
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const Text(
                  'No Internet Connection. :(',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                    fontFamily: 'RockSalt',
                    fontStyle: FontStyle.italic,
                  ),
                ),
                Container(
                  width: 230,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => splashScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      'Retry',
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
            )),
      ),
    );
  }
}
