import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  final int index;

  const DetailsScreen({Key? key, required this.index}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Hero(
          tag: widget.index,
          child: Image.network(
            "https://raw.githubusercontent.com/markknguyen/pictures/master/pic/${widget.index + 1}.jpg",
          ),
        ),
      ),
    );
  }
}
