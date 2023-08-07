import 'package:flutter/material.dart';

import 'home.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                const Spacer(
                  flex: 1,
                ),
                const Text(
                  "Flutter Forms",
                  style: TextStyle(fontSize: 55, fontWeight: FontWeight.w800),
                ),
                const Spacer(
                  flex: 3,
                ),
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                      labelText: "Name:",
                      hintText: "Enter your name",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                ),
                const Spacer(
                  flex: 5,
                )
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            String username = _nameController.value.text;
            print(username);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Home(
                  username: username,
                ),
              ),
            );
          },
          label: const Text("Next Page"),
        ));
  }
}
