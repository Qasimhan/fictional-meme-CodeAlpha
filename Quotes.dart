import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: QuoteApp(),
    );
  }
}

class QuoteApp extends StatefulWidget {
  @override
  State<QuoteApp> createState() => _QuoteAppState();
}

class _QuoteAppState extends State<QuoteApp> {
  List<String> quotes = [
    "Believe in yourself",
    "Stay positive",
    "Work hard, dream big",
    "If you donot want to follow the rule of someone then you try to your level best and make your own rule",
    "Never give up",
    "Hard work pays off",
    "Dream big"
  ];

  List<String> authors = [
    "Qasim Ali Shah",
    "Motivator",
    "Success Coach",
    "Life Guru",
    "Hustler",
    "Visionary"
  ];

  int index = 0;

  @override
  void initState() {
    super.initState();
    index = Random().nextInt(quotes.length);
  }

  void newQuote() {
    setState(() {
      index = Random().nextInt(quotes.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Random Quote"),
        titleTextStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Text(
                        quotes[index],
                        style: TextStyle(fontSize: 22),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 10),
                      Text(
                        "- ${authors[index]}",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: newQuote,
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                ),
                child: Text("New Quote"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
