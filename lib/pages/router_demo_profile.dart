import 'package:book_club_app/authentication_bloc/authentication_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RouterDemoProfile extends StatelessWidget {
  const RouterDemoProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile")),
      body: Center(
        child: Column(
          children: [
            FilledButton(
              child: Text("Logout"),
              onPressed: () {
                BlocProvider.of<AuthenticationBloc>(
                  context,
                ).add(AuthenticationLogoutEvent());
              },
            ),
          ],
        ),
      ),
    );
  }
}
