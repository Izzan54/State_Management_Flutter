import 'package:flutter/material.dart';
import 'package:counter_bloc/counterbloc.dart';

void main() {
  runApp(MyApp());
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter Flutter',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(title: 'Flutter Counter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _counterBloc = CounterBloc();

  @override
  void dispose() {
    _counterBloc.dispose();
    super.dispose();
  }

  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // ignore: prefer_const_constructors
            Text('You have pushed the button this many times:',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 30,),),
            StreamBuilder<int>(
              stream: _counterBloc.counterStream,
              initialData: 0,
              builder: (context,AsyncSnapshot<int> snapshot) {
                return Text(
                  '$_counter',
                  style: TextStyle(fontSize: 40),
                );
              },
            )
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton.large(
        onPressed: _incrementCounter,
        tooltip: 'Tap me',
        // ignore: prefer_const_constructors
        child: Icon(Icons.add,
        size: 40,),
      ), 
    );
  }
}