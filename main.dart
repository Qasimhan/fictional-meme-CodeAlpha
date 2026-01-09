import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FlashCardApp(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class FlashCardApp extends StatefulWidget {
  @override
  State<FlashCardApp> createState() => _FlashCardAppState();
}

class _FlashCardAppState extends State<FlashCardApp> {
  List<String> questions = [
    "What is Flutter?",
    "Flutter language?"
  ];

  List<String> answers = [
    "Flutter is a framework",
    "Dart"
  ];

  int index = 0;
  bool showAnswer = false;

  TextEditingController q = TextEditingController();
  TextEditingController a = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flashcard App"),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: Text("Add Flashcard"),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(controller: q, decoration: InputDecoration(hintText: "Question")),
                      TextField(controller: a, decoration: InputDecoration(hintText: "Answer")),
                    ],
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        setState(() {
                          questions.add(q.text);
                          answers.add(a.text);
                          q.clear();
                          a.clear();
                        });
                        Navigator.pop(context);
                      },
                      child: Text("Add"),
                    )
                  ],
                ),
              );
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              margin: EdgeInsets.all(20),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  showAnswer ? answers[index] : questions[index],
                  style: TextStyle(fontSize: 22),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  showAnswer = !showAnswer;
                });
              },
              child: Text("Show Answer"),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: index > 0
                      ? () {
                          setState(() {
                            index--;
                            showAnswer = false;
                          });
                        }
                      : null,
                  child: Text("Previous"),
                ),
                ElevatedButton(
                  onPressed: index < questions.length - 1
                      ? () {
                          setState(() {
                            index++;
                            showAnswer = false;
                          });
                        }
                      : null,
                  child: Text("Next"),
                ),
              ],
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  questions.removeAt(index);
                  answers.removeAt(index);
                  if (index > 0) index--;
                });
              },
              child: Text("Delete"),
            )
          ],
        ),
      ),
    );
  }
}
