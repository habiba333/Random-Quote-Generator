import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';

void main() {
  runApp(RandomQuoteGeneratorApp());
}

class RandomQuoteGeneratorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Random Quote Generator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RandomQuoteScreen(),
    );
  }
}

class RandomQuoteScreen extends StatefulWidget {
  @override
  _RandomQuoteScreenState createState() => _RandomQuoteScreenState();
}

class _RandomQuoteScreenState extends State<RandomQuoteScreen> {
  List<String> quotes = [
    "The greatest glory in living lies not in never falling, but in rising every time we fall. - Nelson Mandela",
    "The way to get started is to quit talking and begin doing. - Walt Disney",
    "Your time is limited, so don't waste it living someone else's life. - Steve Jobs",
    "If life were predictable it would cease to be life, and be without flavor. - Eleanor Roosevelt",
    "Life is what happens when you're busy making other plans. - John Lennon",
    "Spread love everywhere you go. Let no one ever come to you without leaving happier. - Mother Teresa",
    "The best time to plant a tree was 20 years ago. The second best time is now. - Chinese Proverb",
    "Don't judge each day by the harvest you reap but by the seeds that you plant. - Robert Louis Stevenson",
    "The only way to do great work is to love what you do. - Steve Jobs",
    "Tell me and I forget. Teach me and I remember. Involve me and I learn. - Benjamin Franklin",

  ];
  String currentQuote = "";

  @override
  void initState() {
    super.initState();
    generateRandomQuote();
  }

  void generateRandomQuote() {
    final random = Random();
    final index = random.nextInt(quotes.length);
    setState(() {
      currentQuote = quotes[index];
    });
  }

  void shareQuote() {
    Clipboard.setData(ClipboardData(text: currentQuote));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Quote copied to clipboard')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[200],
        title: Text('Random Quote Generator'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.pink[300]),
                height: 70,
                width: 500,

                child: Center(
                  child: Text(
                    currentQuote,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.pink[300], // Background color
                ),
                onPressed: generateRandomQuote,
                child: Text('Generate Quote'),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.pink[300], // Background color
                ),
                onPressed: shareQuote,
                child: Text('Share Quote',),

              ),
            ],
          ),
        ),
      ),
    );
  }
}
