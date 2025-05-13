import 'package:book_club_app/authentication_bloc/authentication_bloc.dart';
import 'package:book_club_app/navigation/routerdemo.dart';
import 'package:book_club_app/authentication_repo/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final authenticationBloc = AuthenticationBloc();
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) {
        return (OktaAuthenticationRepository() as AuthenticationRepository);
      },
      child: BlocProvider(
        create:
            (context) => authenticationBloc..add(AuthenticationLogoutEvent()),
        child: MaterialApp.router(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          routerConfig: routerDemo(authenticationBloc),
        ),
      ),
    );
  }
}
