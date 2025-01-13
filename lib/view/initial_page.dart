import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dev_ikram/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'custom_buttons.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height - 100,
      width: size.width,
      child: Stack(
        children: [
          /*Container(
              width: size.width,
              padding:
                  EdgeInsets.fromLTRB(size.width * 0.3, 0, size.width * 0.1, 0),
              child: Image(
                  image: Image.asset('assets/face.png').image,
                  fit: BoxFit.cover)),*/
          size.width < 1400
              ? SizedBox()
              : Positioned(
                  right: size.width * 0.2,
                  bottom: size.height * 0.1,
                  child: CustomImages(),
                ),
          Positioned(
            left: size.width * 0.15,
            top: (size.height - 100) / 2 - 100,
            child: Row(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text.rich(
                      TextSpan(
                        text: "I'M  ", // Base style for the first part
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white.withOpacity(0.7),
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2.0,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: "Sajid Ikram",
                            style: TextStyle(
                              fontSize: 55,
                              color: secondaryColor, // Gold color
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Software Engineer",
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white.withOpacity(0.7),
                      ),
                    ),
                    Text(
                      "Mobile Application Developer & Backend Developer",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white.withOpacity(0.7),
                      ),
                    ),
                    SizedBox(height: 20),
                    HoverButton(text: "Contact Me"),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            right: size.width * 0.05,
            bottom: 100,
            child: Column(
              children: [
                Container(
                  height: 80,
                  width: 3,
                  color: secondaryColor,
                ),
                SizedBox(height: 10),
                Icon(FontAwesomeIcons.linkedin),
                SizedBox(height: 10),
                Icon(FontAwesomeIcons.github),
                SizedBox(height: 10),
                Icon(FontAwesomeIcons.stackOverflow),
                SizedBox(height: 10),
                Icon(FontAwesomeIcons.facebook),
              ],
            ),
          )
        ],
      ),
    );
  }
}

/*class CustomImages extends StatefulWidget {
  const CustomImages({super.key});

  @override
  State<CustomImages> createState() => _CustomImagesState();
}

class _CustomImagesState extends State<CustomImages> {


  int index = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    // Start a timer that fires every second
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      setState(() {
        // Update the index and reset if it reaches the end of the list
        index = (index + 1) % images.length;
      });
    });
  }

  @override
  void dispose() {
    // Cancel the timer when the widget is disposed
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 650,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: AnimatedSwitcher(
        duration: Duration(seconds: 3), // Smooth transition duration
        transitionBuilder: (Widget child, Animation<double> animation) {
          // Use FadeTransition for a smooth fade effect
          return FadeTransition(opacity: animation, child: child);
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image(
            // Key is needed to tell AnimatedSwitcher when the widget changes
            key: ValueKey<String>(images[index]),
            image: AssetImage(images[index]),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}*/

class CustomImages extends StatelessWidget {
  List<String> images = [
    "assets/a.png",
    "assets/b.png",
    "assets/c.png",
    "assets/d.png",
    "assets/e.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 650,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20),

      ),
      child: Builder(
        builder: (context) {
          final double height = MediaQuery.of(context).size.height;
          return CarouselSlider(
            options: CarouselOptions(
              height: height,
              autoPlay: true,
              viewportFraction: 1.0,
              enlargeCenterPage: false,
            ),
            items: images
                .map((item) => ClipRRect(
                      borderRadius:
                          BorderRadius.circular(20), // Rounded corners
                      child: Center(
                          child: Image.network(
                        item,
                        fit: BoxFit.contain,
                        // Changed from BoxFit.fill to BoxFit.cover
                        height: height,
                        width: 300, // Set a fixed width to match the container
                      )),
                    ))
                .toList(),
          );
        },
      ),
    );
  }
}
