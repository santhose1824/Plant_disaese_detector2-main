import 'dart:io';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final File image;
  final String information;

  ResultPage({required this.image, required this.information});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.green,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Information about the Diseased Plant',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Text(
                  'Image of the Diseased Plant',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 1,
                  width: 400,
                  color: Colors.white,
                ),
                SizedBox(
                  height: 20,
                ),
                 Container(
         color: Colors.greenAccent,
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Center(
                 child: CircleAvatar(
                  foregroundImage: AssetImage(''),
                  radius: 60,
                 ),
                ),
                 ListView(
                    children: [
                     Row(
                      children: [
                        Text(
                          'Disease Name :',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                         Text(
                          '',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                     ),
                     SizedBox(height: 20,),
                     Row(
                      children: [
                        Text(
                          'Possible Causes :',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                         Text(
                          '',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                     ),SizedBox(height: 20,),
                     Row(
                      children: [
                        Text(
                          'Solutions :',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                         Text(
                          '',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                     )
                    ],
                  ),
              ],
            ),
          )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
