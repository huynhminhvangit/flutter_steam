import 'package:flutter/material.dart';
import 'package:flutter_steam/src/blocs/my_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stream',
      theme: ThemeData(
        primaryColor: Colors.blue.shade100
      ),
      home: Home(),
    );
  }

}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}


class _HomeState extends State<Home> {

  MyBloc myBloc = MyBloc();


  @override
  void dispose() {
    myBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    myBloc.counterStream.listen((data) => {
      print(data.toString())
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('Stream Demo'),
        centerTitle: true,
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        child: Center(
          child: StreamBuilder(
            stream: myBloc.counterStream,
            builder: (context, snapshot) => Text(
              snapshot.hasData ? snapshot.data.toString() : "0",
              style: TextStyle(fontSize: 40,color: Colors.amber),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => myBloc.increment(),
        child: Icon(Icons.add),
      ),
    );
  }

}