import 'package:flutter/material.dart';

import 'home.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool obscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                const Spacer(
                  flex: 2,
                ),
                const Text(
                  "Flutter Forms",
                  style: TextStyle(fontSize: 55, fontWeight: FontWeight.w800),
                ),
                const Spacer(
                  flex: 5,
                ),
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: "Name:",
                    hintText: "Enter your name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                const Spacer(
                  flex: 1,
                ),
                TextField(
                  controller: _passwordController,
                  obscureText: obscure,
                  decoration: InputDecoration(
                      labelText: "Password:",
                      hintText: "12345678",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              obscure = !obscure;
                            });
                          },
                          icon: Icon(obscure
                              ? Icons.visibility
                              : Icons.visibility_off))),
                ),
                const Spacer(
                  flex: 8,
                )
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            String username = _nameController.value.text;
            List<String> names = username.split(" ");
            print(names);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Home(
                  username: names[0],
                ),
              ),
            );
          },
          label: const Text("Next Page"),
        ));
  }
}
