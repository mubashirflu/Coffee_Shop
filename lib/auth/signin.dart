import 'package:e_commerce/auth/Auth_Services.dart';
import 'package:e_commerce/auth/forgot_password.dart';
import 'package:e_commerce/auth/signup.dart';
import 'package:e_commerce/home/landing_page/landing.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:awesome_icons/awesome_icons.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool _isObscure = true; // To toggle password visibility
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final _auth = AuthServices();
  bool isloading = false;

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
                "Sign in",
                style: TextStyle(
                  color: Color(0xFF242424),
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Hi Welcome back, you've been missed",
                style: TextStyle(
                  color: Color(0xFF767676),
                  fontSize: 16,
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
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Forgot(),
                                  ));
                            },
                            child: Text(
                              "Forgot Password?",
                              style: TextStyle(
                                  color: Color(0xFF007E6E),
                                  fontWeight: FontWeight.w500),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 20.0),
                      SizedBox(
                        height: 50,
                        width: 400,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF007E6E),
                          ),
                          onPressed: _signin,
                          child: Text(
                            "Sign In",
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
                          icons(
                            FontAwesomeIcons.apple,
                            Colors.black,
                          ),
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
                                      builder: (context) => SignUp(),
                                    ));
                              },
                              child: Text(
                                "Sign Up",
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

  Container icons(
    IconData icon,
    Color color,
  ) {
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
        //   setState(() {
        //     isloading = true;
        //   });
        //   await _auth.loginwithGoogle();
        //   setState(() {
        //     isloading = true;
        //   });
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

  _signin() async {
    // final user =
    await _auth.loginUserwithEmaiAndPassword(_email.text, _password.text);
    // if (user != null) {
    //   print("User login Successfully");
    //   gotoHome(context);
    // }
  }
}
