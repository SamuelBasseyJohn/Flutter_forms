import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Welcome!, Sign up.",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: false,
        toolbarHeight: 150,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                // autovalidateMode: AutovalidateMode.always,
                controller: _nameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "This field cannot be empty";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: "Name:",
                  hintText: "Enter your name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _emailController,
                validator: (value) {
                  String pattern = r"\w+@\w+\..";

                  RegExp expression = RegExp(pattern);
                  if (value == null || value.isEmpty) {
                    return "This field cannot be empty";
                  } else if (!expression.hasMatch(value)) {
                    return "Enter a valid email";
                  }
                  return null;
                },
                // autovalidateMode: AutovalidateMode.always,
                decoration: InputDecoration(
                  labelText: "Email:",
                  hintText: "Enter your email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: 317,
                height: 56,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 1),
                ),
                child: TextFormField(
                  // autovalidateMode: AutovalidateMode.always,
                  obscureText: true,
                  controller: _passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "This field cannot be empty";
                    } else if (value.length < 8) {
                      return "Password cannot be less than 8 digits";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                      labelText: "Password:",
                      hintText: "Enter your password",
                      border: InputBorder.none),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 10,
            minimumSize: const Size(200, 50),
            backgroundColor: Colors.grey[200],
            foregroundColor: Colors.white,
          ),
          onPressed: () {
            print(_emailController.text);
            print(_nameController.text);
            print(_passwordController.text);
            if (_formKey.currentState!.validate()) {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("User validation successful")));
            }
          },
          child: const Text("Sign Up")),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
