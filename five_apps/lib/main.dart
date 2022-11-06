import 'package:flutter/material.dart';

var list = List<int>.generate(50, (i) => i + 1);

void main() {
  runApp(const MyApp());
}

class DropdownButtonApp extends StatelessWidget {
  const DropdownButtonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('DropdownButton Sample')),
        body: const Center(
          child: DropdownButtonExample(),
        ),
      ),
    );
  }
}

class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample({super.key});

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  int dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<int>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (int? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      items: list.map<DropdownMenuItem<int>>((int value) {
        return DropdownMenuItem<int>(
          value: value,
          child: Text(value.toString()),
        );
      }).toList(),
    );
  }
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.deepPurple,
      ),
      home: const MyHomePage(title: 'sweetdeals'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        title: const Text('sweetdeals'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add_alert),
            tooltip: 'Show Snackbar',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(
                      'TRICK OR TREAT! Josh Allen requested 3 Hershey Kisses for 1 Airhead. Accept Offer?'),
                  action: SnackBarAction(label: 'Yes', onPressed: () {})));
            },
          ),
          IconButton(
              icon: const Icon(Icons.sentiment_very_satisfied),
              tooltip: 'Go to profile',
              onPressed: () => showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text("John Doe's Candy"),
                      content: const Text(
                          '\n\nAirheads: 2\n\nSmarties: 3\n\nBazooka: 1\n\nKisses: 3\n\nTootsie Roll: 1\n\nJolly Ranchers: 0\n\nLaffy Taffy: 0'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'Go Back'),
                          child: const Text('Back to Trade'),
                        ),
                        TextButton(
                            child: const Text('Add/Remove'),
                            onPressed: () =>
                                Navigator.push(context, MaterialPageRoute<void>(
                                  builder: (BuildContext context) {
                                    return Scaffold(
                                      appBar: AppBar(
                                        title: const Text("John Doe's Profile"),
                                      ),
                                      body: const Center(
                                        child: DropdownButtonExample(),
                                      ),
                                    );
                                  },
                                ))),
                      ],
                    ),
                  )),
        ],
      ),

      body: CustomScrollView(
        primary: false,
        slivers: <Widget>[
          SliverPadding(
            padding: const EdgeInsets.all(20),
            sliver: SliverGrid.count(
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              children: <Widget>[
                Container(
                  child: const Text(
                    '@nick',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                  height: 120.0,
                  width: 120.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTy9HhtTrCeWEu6IUPmYCmv0s5aTOgy0PS9pQByZSgempX_koOAdHtrlIPS_YPk9DFmkO0&usqp=CAU'),
                      fit: BoxFit.fill,
                    ),
                    shape: BoxShape.rectangle,
                  ),
                ),
                Container(
                  child: const Text('@steven'),
                  height: 120.0,
                  width: 120.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://pbs.twimg.com/profile_images/1298446861783556096/KjBCrY3L_400x400.jpg'),
                      fit: BoxFit.fill,
                    ),
                    shape: BoxShape.rectangle,
                  ),
                ),
                Container(
                  child: const Text('@joseph'),
                  height: 120.0,
                  width: 120.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://pbs.twimg.com/profile_images/1298446861783556096/KjBCrY3L_400x400.jpg'),
                      fit: BoxFit.fill,
                    ),
                    shape: BoxShape.rectangle,
                  ),
                ),
                Container(
                  child: const Text('@polina'),
                  height: 120.0,
                  width: 120.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://pbs.twimg.com/profile_images/1298446861783556096/KjBCrY3L_400x400.jpg'),
                      fit: BoxFit.fill,
                    ),
                    shape: BoxShape.rectangle,
                  ),
                ),
                Container(
                  child: const Text('@lazar'),
                  height: 120.0,
                  width: 120.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://pbs.twimg.com/profile_images/1298446861783556096/KjBCrY3L_400x400.jpg'),
                      fit: BoxFit.fill,
                    ),
                    shape: BoxShape.rectangle,
                  ),
                ),
                Container(
                  child: const Text('@hannah'),
                  height: 120.0,
                  width: 120.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://pbs.twimg.com/profile_images/1298446861783556096/KjBCrY3L_400x400.jpg'),
                      fit: BoxFit.fill,
                    ),
                    shape: BoxShape.rectangle,
                  ),
                ),
                Container(
                  child: const Text('@lukas'),
                  height: 120.0,
                  width: 120.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://pbs.twimg.com/profile_images/1298446861783556096/KjBCrY3L_400x400.jpg'),
                      fit: BoxFit.fill,
                    ),
                    shape: BoxShape.rectangle,
                  ),
                ),
                Container(
                  child: const Text('@marlie'),
                  height: 120.0,
                  width: 120.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://pbs.twimg.com/profile_images/1298446861783556096/KjBCrY3L_400x400.jpg'),
                      fit: BoxFit.fill,
                    ),
                    shape: BoxShape.rectangle,
                  ),
                ),
                Container(
                  child: const Text('@padriac'),
                  height: 120.0,
                  width: 120.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://pbs.twimg.com/profile_images/1298446861783556096/KjBCrY3L_400x400.jpg'),
                      fit: BoxFit.fill,
                    ),
                    shape: BoxShape.rectangle,
                  ),
                ),
                Container(
                  child: const Text('@jim'),
                  height: 120.0,
                  width: 120.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://pbs.twimg.com/profile_images/1298446861783556096/KjBCrY3L_400x400.jpg'),
                      fit: BoxFit.fill,
                    ),
                    shape: BoxShape.rectangle,
                  ),
                ),
                Container(
                  child: const Text('@aman'),
                  height: 120.0,
                  width: 120.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://pbs.twimg.com/profile_images/1298446861783556096/KjBCrY3L_400x400.jpg'),
                      fit: BoxFit.fill,
                    ),
                    shape: BoxShape.rectangle,
                  ),
                ),
                Container(
                  child: const Text('@eric'),
                  height: 120.0,
                  width: 120.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://pbs.twimg.com/profile_images/1298446861783556096/KjBCrY3L_400x400.jpg'),
                      fit: BoxFit.fill,
                    ),
                    shape: BoxShape.rectangle,
                  ),
                ),
                Container(
                  child: const Text('@chao'),
                  height: 120.0,
                  width: 120.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://pbs.twimg.com/profile_images/1298446861783556096/KjBCrY3L_400x400.jpg'),
                      fit: BoxFit.fill,
                    ),
                    shape: BoxShape.rectangle,
                  ),
                ),
                Container(
                  child: const Text('@michael'),
                  height: 120.0,
                  width: 120.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://pbs.twimg.com/profile_images/1298446861783556096/KjBCrY3L_400x400.jpg'),
                      fit: BoxFit.fill,
                    ),
                    shape: BoxShape.rectangle,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
