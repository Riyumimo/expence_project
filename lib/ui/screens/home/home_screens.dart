import 'package:expence_project/commons_libs.dart';
import 'package:expence_project/main.dart';
import 'package:expence_project/ui/screens/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../logic/auth/authentication_bloc.dart';

class HomeScreens extends StatefulWidget {
  const HomeScreens({super.key});

  @override
  State<HomeScreens> createState() => _HomeScreensState();
}

class _HomeScreensState extends State<HomeScreens> {
  // @override
  // void initState() {
  //   BlocProvider.of<AuthenticationBloc>(context)
  //       .add(AuthenticationEvent.getSignIn(repo.firebaseAuth));
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 44,
            color: Colors.grey[300],
            child: SeparatedRow(
                padding: EdgeInsets.symmetric(horizontal: 16),
                separatorBuilder: () => Spacer(),
                children: [
                  const SizedBox(height: 32, width: 32, child: CircleAvatar()),
                  MyTextButton(title: 'Oktober'),
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.notifications))
                ]),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                context
                    .read<AuthenticationBloc>()
                    .add(const AuthenticationEvent.signOut());
              },
              child: const Text("test"),
            ),
          ),
        ],
      ),
    ));
  }
}
