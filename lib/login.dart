import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool visible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 500.0, // Set the height of the container
          width: 300.0, // Set the width of the container
          padding: const EdgeInsets.all(
              16.0), // Set the padding inside the container
          decoration: BoxDecoration(
            color: Colors.grey[200], // Background color
            borderRadius: BorderRadius.circular(20.0), // Border radius
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.8), // Shadow color
                spreadRadius: 5, // Spread radius
                blurRadius: 10, // Blur radius
                offset: const Offset(
                    0, 3), // Shadow position: (horizontal, vertical)
              ),
            ],
          ),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/logo.png'),
                SizedBox(height: 10),
                Text(
                  "Login",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    fontSize: 34,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  height: 35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const TextField(
                    cursorHeight: 10,
                    cursorColor: Colors.white,
                    style: TextStyle(color: Colors.white, fontSize: 10),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      labelText: 'EMAIL / MOBILE NUMBER',
                      labelStyle: TextStyle(color: Colors.black, fontSize: 10),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                Container(
                  height: 35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextField(
                    obscureText: visible,
                    cursorHeight: 10,
                    cursorColor: Colors.white,
                    style: const TextStyle(color: Colors.white, fontSize: 10),
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      labelText: 'PASSWORD',
                      labelStyle:
                          const TextStyle(color: Colors.black, fontSize: 10),
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            visible = !visible;
                          });
                        },
                        child: Icon(
                          visible ? Icons.visibility : Icons.visibility_off,
                          size: 23,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton(
                    onPressed: () {
                      // Add your forgot password logic here
                    },
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(color: Colors.blue, fontSize: 12),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Add your submit logic here
                  },
                  child: const Text('Submit'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                Text("or continue with"),
                SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Image.asset('assets/google.png'),
                      height: 35,
                      width: 80,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      child: Image.asset('assets/git.png'),
                      height: 35,
                      width: 80,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      child: Image.asset('assets/fb.png'),
                      height: 35,
                      width: 80,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Dont have an account yet?"),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Register",
                      style: TextStyle(color: Colors.blue[600]),
                    )
                  ],
                )
              ],
            ),
          ), // Optional: Add a child widget
        ),
      ),
    );
  }
}
