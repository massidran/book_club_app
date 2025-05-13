import 'package:book_club_app/navigation/routerdemo.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RouterDemoByAuthor extends StatelessWidget {
  const RouterDemoByAuthor({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Books")),
      body: Center(
        child: Column(
          children: [
            Text("Sorted by Author"),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    title: Text('Da Vinci Code'),
                    subtitle: Text('Dan Brown'),
                    onTap: () {
                      context.goNamed(RouteName.byAuthorDetail);
                    },
                  ),
                  ListTile(
                    title: Text('Da Vinci Code'),
                    subtitle: Text('Dan Brown'),
                    onTap: () {
                      context.goNamed(RouteName.byAuthorDetail);
                    },
                  ),
                  ListTile(
                    title: Text('Da Vinci Code'),
                    subtitle: Text('Dan Brown'),
                    onTap: () {
                      context.goNamed(RouteName.byAuthorDetail);
                    },
                  ),
                  ListTile(
                    title: Text('Da Vinci Code'),
                    subtitle: Text('Dan Brown'),
                    onTap: () {
                      context.goNamed(RouteName.byAuthorDetail);
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
