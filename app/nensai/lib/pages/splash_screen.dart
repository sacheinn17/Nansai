import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {

  int duration = 5;
  Widget nextPage;
  SplashScreen({super.key,required this.duration, required this.nextPage});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: duration), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => nextPage),
      );
    });

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black12,
        body: Stack(
          children: [
            Positioned.fill(
              child: Opacity(
                opacity: 0.5,
                child:
                    Image.asset('assets/images/image1.jpg', fit: BoxFit.cover),
              ),
            ),
            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    "நன்செய்",
                    style: TextStyle(
                        color: Color.fromARGB(255, 74, 218, 79),
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Center(
                  child: Text(
                    "Nansei",
                    style: TextStyle(
                        color: Colors.orange,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
