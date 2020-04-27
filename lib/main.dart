import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(
    SleepTracker(),
  );
}

class SleepTracker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirstScreen(),
    );
  }
}

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sleep Tracker'),
        backgroundColor: Colors.amber[600],
      ),
      body: Column(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                height: 70.0,
                width: 70.0,
                // TODO maybe find some better icon
                child: Icon(Icons.brightness_3),
              ),
              Text(
                'Get to know your baby\'s sleep patterns and keep\n'
                ' track of how much sleep they are getting here.',
                style: TextStyle(color: Colors.grey.shade700),
              ),
              SizedBox(
                height: 25.0,
                width: double.infinity,
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new SecondScreen()),
                  );
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80.0)),
                padding: EdgeInsets.all(0.0),
                child: Ink(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xff374ABE), Color(0xff64B6FF)],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.circular(30.0)),
                  child: Container(
                    constraints:
                        BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
                    alignment: Alignment.center,
                    child: Text(
                      "Add new sleeping record",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50.0,
                width: double.infinity,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 25.0),
                child: Text(
                  '${DateFormat.yMMMd().format(new DateTime.now())}',
                  //'${DateTime.now().day} ${DateTime.now().month} ${DateTime.now().year}',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //should add back button
        automaticallyImplyLeading: true,
        title: Text('Sleep Tracker'),
        backgroundColor: Colors.amber[600],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(
            height: 10.0,
          ),
          Container(height: 130, child: Image.asset('images/cloud.png')),
          SizedBox(
            height: 10.0,
          ),
          Card(
            margin: EdgeInsets.all(5.0),
            child: ListTile(
              leading: Icon(
                Icons.calendar_today,
                color: Colors.indigo[900],
              ),
              title: Text(
                'Date and time',
                style: TextStyle(
                  color: Colors.indigo[900],
                  fontSize: 15.0,
                ),
              ),
              subtitle: Text(
                // TODO to modify
                '${DateTime.now().day} ${DateTime.now().month} ${DateTime.now().year}, ${DateTime.now().hour}:${DateTime.now().minute}',
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.all(5.0),
            child: ListTile(
              leading: Icon(
                Icons.brightness_3,
                color: Colors.indigo[900],
              ),
              title: Text(
                'Sleep type',
                style: TextStyle(
                  color: Colors.indigo[900],
                  fontSize: 15.0,
                ),
              ),
              subtitle: DropdownButton(
                items: [],
//                  onChanged: (){
//
//                  } ,
                // TODO
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.all(5.0),
            child: ListTile(
              leading: Icon(
                Icons.access_time,
                color: Colors.indigo[900],
              ),
              title: Text(
                'Sleep duration',
                style: TextStyle(
                  color: Colors.indigo[900],
                  fontSize: 15.0,
                ),
              ),
              onTap: () {
                NumberPicker.integer(
                  initialValue: 50,
                  minValue: 0,
                  maxValue: 100,
                  onChanged: null, //TODO
                );
              },
            ),
          ),
          SizedBox(
            height: 60,
          ),
          RaisedButton(
            onPressed: () {
//              Navigator.push(
//                context,
//                new MaterialPageRoute(builder: (context) => new SecondScreen()),
//              );
            },
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(80.0)),
            padding: EdgeInsets.all(0.0),
            child: Ink(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xff374ABE), Color(0xff64B6FF)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(30.0)),
              child: Container(
                constraints: BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
                alignment: Alignment.center,
                child: Text(
                  "Save",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//
//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      title: 'Sleep Tracker',
//      theme: ThemeData(
//        primarySwatch: Colors.amber,
//      ),
//      home: MyHomePage(title: 'Sleep Tracker'),
//    );
//  }
//}
//
//class MyHomePage extends StatefulWidget {
//  MyHomePage({Key key, this.title}) : super(key: key);
//
//  // This widget is the home page of your application. It is stateful, meaning
//  // that it has a State object (defined below) that contains fields that affect
//  // how it looks.
//
//  // This class is the configuration for the state. It holds the values (in this
//  // case the title) provided by the parent (in this case the App widget) and
//  // used by the build method of the State. Fields in a Widget subclass are
//  // always marked "final".
//
//  final String title;
//
//  @override
//  _MyHomePageState createState() => _MyHomePageState();
//}
//
//class _MyHomePageState extends State<MyHomePage> {
//  int _counter = 0;
//
//  void _incrementCounter() {
//    setState(() {
//      // This call to setState tells the Flutter framework that something has
//      // changed in this State, which causes it to rerun the build method below
//      // so that the display can reflect the updated values. If we changed
//      // _counter without calling setState(), then the build method would not be
//      // called again, and so nothing would appear to happen.
//      _counter++;
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text(widget.title),
//      ),
//      body: Center(
//        child: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            Icon(Icons.),
//            Text(
//              'You have pushed the button this many times:',
//            ),
//            Text(
//              '$_counter',
//              style: Theme.of(context).textTheme.display1,
//            ),
//          ],
//        ),
//      ),
//      floatingActionButton: FloatingActionButton(
//        onPressed: _incrementCounter,
//        tooltip: 'Increment',
//        child: Icon(Icons.add),
//      ), // This trailing comma makes auto-formatting nicer for build methods.
//    );
//  }
//}
