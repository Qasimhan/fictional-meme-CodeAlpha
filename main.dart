import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Language Learning App")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text("Vocabulary"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => VocabularyScreen()),
                );
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text("Quiz"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => QuizScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class VocabularyScreen extends StatefulWidget {
  @override
  State<VocabularyScreen> createState() => _VocabularyScreenState();
}

class _VocabularyScreenState extends State<VocabularyScreen> {
List<String> words = [
  "Hello",
  "Thank You",
  "Good Morning",
  "Good Night",
  "Please",
  "Sorry",
  "Yes",
  "No",
  "Water",
  "Food",
  "House",
  "Book",
  "Pen",
  "School",
  "Teacher",
  "Student",
  "Friend",
  "Family",
  "Love",
  "Help"
];

List<String> meanings = [
  "Helo",
  "Thank Yoo",
  "Good Morning",
  "Good Night",
  "Pleez",
  "Sory",
  "Yes",
  "No",
  "Watar",
  "Food",
  "Hows",
  "Book",
  "Pen",
  "Skool",
  "Teechər",
  "Stoodent",
  "Frend",
  "Faimly",
  "Luv",
  "Help"
];


  int index = 0;
  bool showMeaning = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Vocabulary")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              margin: EdgeInsets.all(20),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  showMeaning ? meanings[index] : words[index],
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  showMeaning = !showMeaning;
                });
              },
              child: Text("Show Translation"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: index > 0
                      ? () {
                          setState(() {
                            index--;
                            showMeaning = false;
                          });
                        }
                      : null,
                  child: Text("Previous"),
                ),
                ElevatedButton(
                  onPressed: index < words.length - 1
                      ? () {
                          setState(() {
                            index++;
                            showMeaning = false;
                          });
                        }
                      : null,
                  child: Text("Next"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class QuizScreen extends StatefulWidget {
  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
List<String> questions = [
  "Hello sounds like?",
  "Thank You sounds like?",
  "Good Morning sounds like?",
  "Good Night sounds like?",
  "Please sounds like?",
  "Sorry sounds like?",
  "School sounds like?",
  "Teacher sounds like?"
];

List<String> answers = [
  "Helo",
  "Thank Yoo",
  "Good Morning",
  "Good Night",
  "Pleez",
  "Sory",
  "Skool",
  "Teechər"
];


  int index = 0;
  TextEditingController userAnswer = TextEditingController();
  String result = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Quiz")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              questions[index],
              style: TextStyle(fontSize: 22),
            ),
            TextField(
              controller: userAnswer,
              decoration: InputDecoration(hintText: "Your Answer"),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (userAnswer.text == answers[index]) {
                    result = "Correct ";
                  } else {
                    result = "Wrong Answer. Correct is: ${answers[index]}";
                  }
                });
              },
              child: Text("Check"),
            ),
            Text(result),
            ElevatedButton(
              onPressed: index < questions.length - 1
                  ? () {
                      setState(() {
                        index++;
                        userAnswer.clear();
                        result = "";
                      });
                    }
                  : null,
              child: Text("Next"),
            )
          ],
        ),
      ),
    );
  }
}
