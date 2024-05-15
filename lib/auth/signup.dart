import 'package:e_commerce/auth/Auth_Services.dart';
import 'package:e_commerce/auth/signin.dart';
import 'package:e_commerce/home/landing_page/landing.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:awesome_icons/awesome_icons.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignInState();
}

class _SignInState extends State<SignUp> {
  bool _isObscure = true; // To toggle password visibility
  bool _agreedToTerms = false; // To track if user agreed to terms
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final _auth = AuthServices();

  @override
  @override
  void dispose() {
    // Clean up controllers
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Create Account",
                style: TextStyle(
                  color: Color(0xFF242424),
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Fill your information below or register",
                style: TextStyle(
                  color: Color(0xFF767676),
                  fontSize: 15,
                  letterSpacing: 0.3,
                ),
              ),
              Text(
                "with social account",
                style: TextStyle(
                  color: Color(0xFF767676),
                  fontSize: 15,
                  letterSpacing: 0.3,
                ),
              ),
              SizedBox(height: 30),
              Form(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Name",
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 7),
                      SizedBox(
                        height: 50,
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: "surname",
                            labelStyle: TextStyle(
                              color: Color(0xFF797979),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFF007E6E),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Email",
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 7),
                      SizedBox(
                        height: 50,
                        child: TextFormField(
                          controller: _email,
                          decoration: InputDecoration(
                            labelText: "Email Address",
                            labelStyle: TextStyle(
                              color: Color(0xFF797979),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFF007E6E),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Password",
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 7),
                      SizedBox(
                        height: 50,
                        child: TextFormField(
                          controller: _password,
                          obscureText: _isObscure,
                          decoration: InputDecoration(
                            labelStyle: TextStyle(
                              color: Color(0xFF797979),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFF007E6E),
                              ),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isObscure
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isObscure = !_isObscure;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Theme(
                            data: ThemeData(
                              unselectedWidgetColor: Color(0xFF007E6E),
                            ),
                            child: Checkbox(
                              value: _agreedToTerms,
                              onChanged: (value) {
                                setState(() {
                                  _agreedToTerms = value!;
                                });
                              },
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                "Agree with",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                ),
                              ),
                              TextButton(
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text("Terms & conditions"),
                                            content: SingleChildScrollView(
                                                child: Text("Terms & Conditions"
                                                    "These terms and conditions govern your use of [Coffee Shop Name]'s mobile application and website. By accessing"
                                                    " this application/website, you agree to abide by these terms and conditions. If you disagree with any part of"
                                                    "these terms and conditions, you must not use our application/website"
                                                    "2. Intellectual Property Rights"
                                                    "Unless otherwise stated, we own the intellectual property rights for all material on [Coffee Shop Name]"
                                                    "All intellectual property rights are reserved. You may view and/or print pages from our application/website for"
                                                    "your own personal use, subject to restrictions set in these terms and conditions")),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Text(
                                                  "ok",
                                                  style: TextStyle(
                                                    color: Color(0xFF007E6E),
                                                  ),
                                                ),
                                              )
                                            ],
                                          );
                                        });
                                  },
                                  child: Text(
                                    "Terms & Conditions",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Color(0xFF007E6E),
                                    ),
                                  ))
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 10.0),
                      SizedBox(
                        height: 50,
                        width: 400,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: _agreedToTerms
                                ? Color(0xFFf6f6f6)
                                : Colors.grey,
                            backgroundColor: Color(0xFF007E6E),
                          ),
                          // onPressed:  _agreedToTerms
                          //     ? (){}
                          //     : null,
                          onPressed: _agreedToTerms
                              ? () {
                                  _singup();
                                }
                              : null,

                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                              color: Color(0xFFf6f6f6),
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 1,
                            color: Colors.grey.shade400,
                            width: 100,
                          ),
                          Text(
                            "  Or sign in with  ",
                            style: TextStyle(
                                color: Color(0xFF797979), fontSize: 17.0),
                          ),
                          Container(
                            height: 1,
                            color: Colors.grey.shade400,
                            width: 100,
                          ),
                        ],
                      ),
                      SizedBox(height: 30.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          icons(FontAwesomeIcons.apple, Colors.black),
                          SizedBox(width: 12),
                          icons(FontAwesomeIcons.google, Colors.red),
                          SizedBox(width: 12),
                          icons(FontAwesomeIcons.facebook, Colors.indigo),
                        ],
                      ),
                      SizedBox(height: 20.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account?",
                            style: TextStyle(
                                color: Color(0xFF797979), fontSize: 16.0),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SignIn(),
                                    ));
                              },
                              child: Text(
                                "Sign In",
                                style: TextStyle(color: Color(0xFF007E6E)),
                              ))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container icons(IconData icon, Color color) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.grey.shade300, // Border color
          width: 2, // Border width
        ),
      ),
      child: IconButton(
        // onPressed: () async {
        //   await _auth.loginWithFacebook();
        // },
        onPressed: () {},
        icon: Icon(
          icon,
          color: color,
        ),
      ),
    );
  }

  gotoHome(BuildContext context) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Landing(),
      ));
  _singup() async {
    // final user =
    await _auth.createUserwithEmaiAndPassword(_email.text, _password.text);
    Navigator.pop(context);
    // if (user != null) {
    //   print("User Created Successfully");
    //   gotoHome(context);
    // }
  }
}
