import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:scr/sports%20bike/home_page/home%20page.dart';

class Register extends StatefulWidget {
  static String routeName = "register";

  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String email = '';

  String password = "";

  String userName = "";

  GlobalKey<FormState> formkey = GlobalKey();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Sign Up",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),


          ),
          backgroundColor: Colors.transparent,
          centerTitle: true,
        ),
        body: Form(
          key: formkey,
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/ww.jpeg"), fit: BoxFit.cover),
            ),
            child: ListView(children: [
              Column(
                children: [
                  const SizedBox(
                    height: 100,
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
                      userName = data;
                    },
                    decoration: const InputDecoration(
                        label: Text(
                      "User Name",
                    )),
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
                      label: Text(
                        "Email",
                      ),
                    ),
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
                    decoration: const InputDecoration(
                        label: Text(
                      "Password",
                    )),
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      creataAccount();
                    },
                    child: const Row(
                      children: [
                        Text(
                          "Create Account",
                          style: TextStyle(fontSize: 16),
                        ),
                        Spacer(),
                        Icon(
                          Icons.arrow_right_alt,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  )
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }

  void creataAccount() async {
    if (formkey.currentState!.validate()) {
      isLoading = true;
      setState(() {});
      try {
        final credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("success"),
          ),
        );
        Navigator.pushNamed(context, HomePage.routName);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("weak password"),
            ),
          );
        } else if (e.code == 'email-already-in-use') {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("email already in use"),
            ),
          );
        }
      }
      isLoading = false;
      setState(() {});
    }
  }
}
