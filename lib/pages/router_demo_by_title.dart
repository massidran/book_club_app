import 'package:book_club_app/navigation/routerdemo.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RouterDemoByTitle extends StatelessWidget {
  const RouterDemoByTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Books")),
      body: Center(
        child: Column(
          children: [
            Text("Sorted by Title"),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    title: Text('Da Vinci Code'),
                    subtitle: Text('Dan Brown'),
                    onTap: () {
                      context.goNamed(RouteName.byTitleDetail);
                    },
                  ),
                  ListTile(
                    title: Text('Da Vinci Code'),
                    subtitle: Text('Dan Brown'),
                    onTap: () {
                      context.goNamed(RouteName.byTitleDetail);
                    },
                  ),
                  ListTile(
                    title: Text('Da Vinci Code'),
                    subtitle: Text('Dan Brown'),
                    onTap: () {
                      context.goNamed(RouteName.byTitleDetail);
                    },
                  ),
                  ListTile(
                    title: Text('Da Vinci Code'),
                    subtitle: Text('Dan Brown'),
                    onTap: () {
                      context.goNamed(RouteName.byTitleDetail);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
