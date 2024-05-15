import 'package:e_commerce/auth/wrapper.dart';
import 'package:e_commerce/home/landing_page/landing.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class login_show extends StatefulWidget {
  const login_show({Key? key}) : super(key: key);

  @override
  State<login_show> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<login_show> {
  List<String> _imageList = [
    "assets/images/coffee3.png",
  ];

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            itemCount: _imageList.length,
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        margin: EdgeInsets.only(top: 50),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(90),
                            bottomRight: Radius.circular(90),
                          ),
                          image: DecorationImage(
                            image: AssetImage(_imageList[index]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF242424),
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: "Step into Our ",
                                ),
                                TextSpan(
                                  text: "World of ",
                                  style: TextStyle(
                                      color: Color(0xFF007E6E),
                                      fontWeight: FontWeight.bold),
                                ),
                                TextSpan(
                                  text: "Coffee ",
                                  style: TextStyle(
                                      color: Color(0xFF007E6E),
                                      fontWeight: FontWeight.bold),
                                ),
                                TextSpan(text: "Delight!")
                              ],
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 7),
                          Column(
                            children: [
                              Text(
                                "A coffee shop mission statement typically defines the core purpose and values of the coffee shop ",
                                style:
                                    TextStyle(fontSize: 16, color: Colors.grey),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(300, 50),
                              backgroundColor: Color(0xFF007E6E),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Landing(),
                                ),
                              );
                            },
                            child: Text(
                              "Let's Get Started",
                              style: TextStyle(
                                color: Color(0xFFf6f6f6),
                                fontSize: 18,
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Already have an account?"),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => wrapper(),
                                    ),
                                  );
                                },
                                child: Text(
                                  "Sign in",
                                  style: TextStyle(
                                    color: Color(0xFF007E6E),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
