import 'package:expence_project/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../logic/auth/authentication_bloc.dart';
import '../../../router.dart';

class HomeScreens extends StatefulWidget {
  const HomeScreens({super.key});

  @override
  State<HomeScreens> createState() => _HomeScreensState();
}

class _HomeScreensState extends State<HomeScreens> {
  @override
  void initState() {
    BlocProvider.of<AuthenticationBloc>(context)
        .add(AuthenticationEvent.getSignIn(repo.firebaseAuth));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: ElevatedButton(
        onPressed: () {
          context.read<AuthenticationBloc>().add(AuthenticationEvent.signOut());
        },
        child: Text("test"),
      ),
    ));
  }
}
