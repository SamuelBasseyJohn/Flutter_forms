import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key, required this.username});
  final String username;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size(double.maxFinite, 300),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: const CircleAvatar(),
                title:
                    Text("Hello ${username == "" ? "Unknown User" : username}"),
                trailing: IconButton(
                    onPressed: () {}, icon: const Icon(Icons.notifications)),
              ),
            ),
          )),
    );
  }
}
