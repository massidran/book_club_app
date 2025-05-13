import 'package:flutter/material.dart';

class RouterDemoBookDetail extends StatelessWidget {
  const RouterDemoBookDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Book")),
      body: Text("Detail of the Book"),
    );
  }
}
