import 'package:flutter/material.dart';

import 'screen1.dart';
import 'screen2.dart';

class Screen0 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Screen0'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                // Navigator.pop(context);
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) {
                //       return Screen1();
                //     },
                //   ),
                // );
                Navigator.pushNamed(context, '/first');
              },
              child: Container(
                color: Colors.blue,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text('Go Forwards To Screen 1',
                      style: TextStyle(color: Colors.white)),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) {
                //       return Screen2();
                //     },
                //   ),
                // );
                Navigator.pushNamed(context, '/second');
              },
              child: Container(
                color: Colors.green,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text('Go Forwards To Screen 2',
                      style: TextStyle(color: Colors.white)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
