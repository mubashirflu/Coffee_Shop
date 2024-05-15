import 'package:e_commerce/auth/loginshow.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  late PageController _pageController;
  int _currentPage = 0;

  List<String> _imageList = [
    "assets/images/coffee2.jpg",
    "assets/images/coffee1.jpg",
    "assets/images/coffee4.jpg",
  ];

  List<String> _imageRichTexts = [
    "Discover Coffee and Nearby Cafes",
    "Wishlist Your Coffee and Cafe Favorites",
    "Stay in the Know with Your Coffee Orders",
  ];

  List<String> _imageDescriptions = [
    "This is the way to discover the coffees",
    "Make the list of your Favorites",
    "Wait for the new taste of coffee",
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: _imageList.length,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      decoration: BoxDecoration(
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
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RichText(
                          text: TextSpan(
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: _imageRichTexts[index],
                                style: TextStyle(
                                  color: Color(0xFF007E6E),
                                ),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 10),
                        Text(
                          _imageDescriptions[index],
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
          Positioned(
            top: 30.0,
            right: 20,
            child: TextButton(
              onPressed: () {
                // Handle skip action here
              },
              child: Text(
                "Skip",
                style: TextStyle(
                  color: Color(0xFFf6f6f6),
                  fontSize: 19,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 60.0,
            left: 0,
            child: GestureDetector(
              onTap: () {
                if (_currentPage > 0) {
                  _pageController.previousPage(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.ease,
                  );
                }
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: _currentPage == _imageList.length - 1
                        ? Colors.white // Set to white for the last screen
                        : Color(0xFF007E6E),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.arrow_back,
                    color: _currentPage == _imageList.length - 1
                        ? Color(0xFF007E6E) // Green for the last screen
                        : Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 60.0,
            right: 0,
            child: GestureDetector(
              onTap: () {
                if (_currentPage == _imageList.length - 1) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => login_show()),
                  );

                  // Navigator.pop(context);
                } else {
                  _pageController.nextPage(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.ease,
                  );
                }
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Color(0xFF007E6E),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 30.0,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildPageIndicator(),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _imageList.length; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? 24.0 : 16.0,
      decoration: BoxDecoration(
        color: isActive ? Color(0xFF007E6E) : Colors.white.withOpacity(0.5),
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
