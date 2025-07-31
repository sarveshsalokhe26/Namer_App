import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//Asking flutter to run the base widget of the application
void main() {
  runApp(MyApp());
}

//Defing the Function MyApp in which we will handle tthe change notifier
class MyApp extends StatelessWidget {
  //constructing letting flutter know that it is an immutable data
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //Returning the change notifier
    return ChangeNotifierProvider(
      create: (context) =>
          MyAppState(), //Change notifier provider provides the changes that happened in the MyAppState
      child: MaterialApp(
        title: 'Namer App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.black12),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

//Writing the function where we keep on getting the random words from the user
class MyAppState extends ChangeNotifier {
  //Creating a variable which stores the random word pairs from the english word packages
  var current = WordPair.random();
}

//writing the home page
class MyHomePage extends StatelessWidget {
  //constructor (for immutable data lts flutter konow the changes that occur in the data so that it can render the changed data)
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    //Writing the function which whatches the chages that occur in MyAppState
    var appState = context.watch<MyAppState>();

    return Scaffold(
      body: Column(
        children: [
          Text('I have a random Fucking wordPair in my mind dawg ;'),
          Text(appState.current.asLowerCase),
        ],
      ),
    );
  }
}
