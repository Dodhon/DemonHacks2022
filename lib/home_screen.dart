import 'package:flutter/material.dart';
import 'package:flutter_hero_animation/details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Image.asset("assets/Sweetdealslogo.png"),
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
                            '\n\nAirheads: 2\n\nSmarties: 3\n\nBazooka: 1\n\nKisses: 3\n\nTootsie Roll: 1'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'Go Back'),
                            child: const Text('Back to Trade'),
                          ),
                          TextButton(
                              child: const Text('Add/Remove'),
                              onPressed: () => Navigator.push(context,
                                      MaterialPageRoute<void>(
                                    builder: (BuildContext context) {
                                      return Scaffold(
                                        appBar: AppBar(
                                          title:
                                              const Text("John Doe's Profile"),
                                        ),
                                        body: const Center(
                                          child: Text(
                                            'This is your profile',
                                            style: TextStyle(fontSize: 24),
                                          ),
                                        ),
                                      );
                                    },
                                  ))),
                        ],
                      ),
                    )),
          ],
        ),
        body: GridView.builder(
            itemCount: 10,
            padding: const EdgeInsets.all(20),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 20, mainAxisSpacing: 20),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsScreen(
                        index: index,
                      ),
                    ),
                  );
                },
                child: Hero(
                  tag: index,
                  child: Image.network(
                      "https://raw.githubusercontent.com/markknguyen/pictures/master/pic/${index + 1}.png"),
                ),
              );
            }));
  }
}
