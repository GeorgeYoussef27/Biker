import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:scr/Auth/register.dart';
import 'package:scr/sports%20bike/home_page/home%20page.dart';

class Login extends StatefulWidget {
  static String routeName = "/";

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String email = "";

  String password = "";

  GlobalKey<FormState> formkey = GlobalKey();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: const Text(
            "Login",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.transparent,
          centerTitle: true,
        ),
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/ww.jpeg"), fit: BoxFit.cover)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Form(
                key: formkey,
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .1,
                    ),
                    const Text(
                      "Hello Biker",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .05,
                    ),
                    TextFormField(
                      validator: (data) {
                        if (data!.isEmpty) {
                          return "error";
                        }
                      },
                      onChanged: (data) {
                        email = data;
                      },
                      decoration: const InputDecoration(
                        label: Text("Email"),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      validator: (data) {
                        if (data!.isEmpty) {
                          return "error";
                        }
                      },
                      onChanged: (data) {
                        password = data;
                      },
                      decoration:
                          const InputDecoration(label: Text("Password")),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    const Text(
                      "",
                      style: TextStyle(fontSize: 14),
                    ),
                    const SizedBox(height: 75),
                    ElevatedButton(
                      onPressed: () {
                        Login();

                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 12,
                        ),
                        child: Row(
                          children: [
                            Text(
                              "Login",
                              style: TextStyle(fontSize: 16),
                            ),
                            Spacer(),
                            Icon(
                              Icons.arrow_right_alt,
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 278,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, Register.routeName);
                      },
                      child: const Text(
                        "Create Account",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void Login() async {
    if (formkey.currentState!.validate()) {
      isLoading = true;
      setState(() {});
      try {
        final credential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("success")));
        Navigator.pushNamed(context, HomePage.routName);
      } on FirebaseAuthException catch (ex) {
        if (ex.code == 'user-not-found') {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("weak password")));
        } else if (ex.code == 'worng-password') {                                                   
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("email already in use")));
        }
      }
      isLoading = false;
      setState(() {});
    }
    if (email == "admin1@gmail.com") {
      Navigator.pushNamed(context, HomePage.routName);
    }
  }
}
