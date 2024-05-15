import 'dart:async';

import 'package:awesome_icons/awesome_icons.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Landing extends StatefulWidget {
  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Text('Home Page'),
    Text('Discover Page'),
    Text('Wishlist Page'),
    Text('Messages Page'),
    Text('Profile Page'),
  ];

  late CarouselController _carouselController;
  int _currentPage = 0;
  List<String> _images = [
    'images/coffee1.jpg',
    'images/coffee2.jpg',
    'images/coffee4.jpg',
  ];
  List<bool> _isSelected = [
    false,
    false,
    false,
    false
  ]; // Track if a card is selected

  @override
  void initState() {
    super.initState();
    _carouselController = CarouselController();
    _startTimer();
  }

  void _startTimer() {
    Timer.periodic(Duration(seconds: 5), (timer) {
      if (_currentPage < _images.length - 1) {
        _carouselController.nextPage();
        setState(() {
          _currentPage++;
        });
      } else {
        _carouselController.animateToPage(0); // Go back to the first card
        setState(() {
          _currentPage = 0;
        });
      }
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Color(0xFF007E6E),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              height: 240,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 100),
                              child: Text(
                                "Location",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(150, 246, 246, 246),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.location_on,
                                    color: Color(0xFFF1C67C),
                                  ),
                                ),
                                Text(
                                  "New York, USA",
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Color(0xFFf6f6f6),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.arrow_drop_down,
                                    color: Color(0xFFF1C67C),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        Spacer(),
                        Stack(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(150, 246, 246, 246),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  FontAwesomeIcons.shoppingCart,
                                  size: 20,
                                  color: Color(0xFFf6f6f6),
                                ))
                          ],
                        ),
                        SizedBox(width: 5),
                        Stack(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(150, 246, 246, 246),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.notifications,
                                  color: Color(0xFFf6f6f6),
                                ))
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Container(
                            height: 50,
                            width: 280,
                            decoration: BoxDecoration(
                              color: Color(0xFFf6f6f6),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.search,
                                    color: Color(0xFF007E6E),
                                  ),
                                ),
                                Text(
                                  "Search",
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Color(0xFF797979),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 10),
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: Color(0xFFf6f6f6),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.tune_sharp,
                                color: Color(0xFF007E6E),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Text(
                    "Special Offers",
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFF242424),
                        fontWeight: FontWeight.w500),
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "See All",
                      style: TextStyle(
                        color: Color(0xFF007E6E),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.0),
            Carsoual_Slider(),
            SizedBox(height: 7),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Text(
                    "My Review",
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFF242424),
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 80,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color(0xFFf6f6f6),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    row_cup(Color(0xFF007E6E), Color(0xFFf6f6f6),
                        "assets/icons/coffee-cup.png", "Cup 1"),
                    row_cup(Color(0xFF007E6E), Color(0xFFf6f6f6),
                        "assets/icons/coffee-cup.png", "Cup 2"),
                    row_cup(Color(0xFF007E6E), Color(0xFFf6f6f6),
                        "assets/icons/coffee-cup.png", "Cup 3"),
                    row_cup(Colors.white, Colors.black,
                        "assets/icons/coffee-cup.png", "Cup 4"),
                    row_cup(Colors.white, Colors.black,
                        "assets/icons/coffee-cup.png", "Cup 5"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 70, // Adjust the height as needed
        child: BottomNavigationBar(
          type:
              BottomNavigationBarType.fixed, // Ensure names are always visible
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          selectedItemColor: Color(0xFF007E6E),
          unselectedItemColor: Color(0xFF797979),
          selectedLabelStyle: TextStyle(color: Color(0xFF007E6E)),
          unselectedLabelStyle: TextStyle(color: Color(0xFF797979)),
          items: <BottomNavigationBarItem>[
            _buildNavigationBarItem("assets/icons/home.png", 'Home', 0),
            _buildNavigationBarItem("assets/icons/discover.png", 'Discover', 1),
            _buildNavigationBarItem("assets/icons/wishlist.png", 'Wishlist', 2),
            _buildNavigationBarItem("assets/icons/message.png", 'Messages', 3),
            _buildNavigationBarItem("assets/icons/user.png", 'Profile', 4),
          ],
        ),
      ),
    );
  }

  Widget row_cup(
    Color bgcolor,
    Color color,
    String imagePath,
    String text,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            CircleAvatar(
              backgroundColor: bgcolor,
              child: InkWell(
                child: Image.asset(
                  imagePath,
                  width: 30,
                  height: 40,
                  color: color,
                ),
                onTap: () {},
              ),
              radius: 24,
            ),
            SizedBox(
              height: 8,
            ), // Add spacing between the CircleAvatar and the Text
            Text(
              text,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }

  Stack Carsoual_Slider() {
    return Stack(
      children: [
        Column(
          children: [
            CarouselSlider.builder(
              itemCount: _images.length,
              carouselController: _carouselController,
              itemBuilder: (BuildContext context, int index, int realIndex) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    image: DecorationImage(
                      image: AssetImage('assets/${_images[index]}'),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
              options: CarouselOptions(
                autoPlay: false,
                enableInfiniteScroll: true, // Enable infinite looping
                viewportFraction: 0.8,
                onPageChanged: (index, reason) {
                  setState(
                    () {
                      _currentPage = index;
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  BottomNavigationBarItem _buildNavigationBarItem(
      String iconPath, String label, int index) {
    return BottomNavigationBarItem(
      icon: Stack(
        alignment: Alignment.topCenter,
        children: [
          Image.asset(
            iconPath,
            width: 25, // Adjust the width of the image as needed
            height: 25, // Adjust the height of the image as needed
          ),
          if (_selectedIndex == index)
            Positioned(
              top: -5,
              child: CircleAvatar(
                backgroundColor: Color(0xFF007E6E),
                radius: 5,
              ),
            ),
        ],
      ),
      label: label,
    );
  }
}
