import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  final int index;

  const DetailsScreen({Key? key, required this.index}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  TextEditingController _emailTEC = TextEditingController();
  TextEditingController _passwordTEC = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        backgroundColor: Colors.grey,
        body: Center(
            child: Column(children: [
          Hero(
            tag: widget.index,
            child: Image.network(
              "https://raw.githubusercontent.com/markknguyen/pictures/master/pic/${widget.index + 1}.png",
            ),
          ),
          TextField(
            controller: _emailTEC,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter what you want',
            ),
          ),
          TextField(
            controller: _passwordTEC,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter what you need',
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton(
              // When the user presses the button, show an alert dialog containing
              // the text that the user has entered into the text field.
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      // Retrieve the text the that user has entered by using the
                      // TextEditingController.
                      content: Text("Request Sent. You want: " +
                          _emailTEC.text +
                          " and you've asked " +
                          _passwordTEC.text),
                    );
                  },
                );
              },
            ),
          )
        ])));
  }
}
