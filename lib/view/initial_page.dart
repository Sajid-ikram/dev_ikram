import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dev_ikram/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../utils/constant_text.dart';
import 'custom_buttons.dart';

class InitialPage extends StatefulWidget {
  final ScrollController scrollController;

  const InitialPage({super.key, required this.scrollController});

  @override
  _InitialPageState createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  // State variables for hover effects
  Map<IconData, Color> hoverColors = {
    FontAwesomeIcons.linkedin: Colors.white.withOpacity(0.7),
    FontAwesomeIcons.github: Colors.white.withOpacity(0.7),
    FontAwesomeIcons.stackOverflow: Colors.white.withOpacity(0.7),
  };

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget _buildSocialMediaIcon(IconData icon, String url) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          hoverColors[icon] = secondaryColor;
        });
      },
      onExit: (_) {
        setState(() {
          hoverColors[icon] = Colors.white.withOpacity(0.7); // Reset color
        });
      },
      child: GestureDetector(
        onTap: () => _launchUrl(url),
        child: Icon(
          icon,
          color: hoverColors[icon], // Use the current hover color
          size: 30,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height - 100,
      width: size.width,
      child: Stack(
        children: [
          size.width < 1400
              ? const SizedBox()
              : Positioned(
                  right: size.width * 0.2,
                  bottom: size.height * 0.1,
                  child: CustomImages(),
                ),
          Positioned(
            left: size.width * 0.15,
            top: (size.height - 100) / 2 - 160,
            child: Row(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text.rich(
                      TextSpan(
                        text: "I'M  ",
                        style: TextStyle(
                          fontSize: size.width < 700 ? 20 : 30,
                          color: Colors.white.withOpacity(0.7),
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2.0,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: "Sajid Ikram",
                            style: TextStyle(
                              fontSize: size.width < 700 ? 40 : 55,
                              color: secondaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Software Engineer",
                      style: TextStyle(
                        fontSize: size.width < 700 ? 25 : 30,
                        color: Colors.white.withOpacity(0.7),
                      ),
                    ),
                    ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: size.width * 0.7),
                      child: Text(
                        "Mobile Application Developer & Backend Developer",
                        style: TextStyle(
                          fontSize: size.width < 700 ? 16 : 20,
                          color: Colors.white.withOpacity(0.7),
                        ),
                        softWrap: true,
                      ),
                    ),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () => widget.scrollController.animateTo(
                        size.height * 7,
                        duration: const Duration(seconds: 1),
                        curve: Curves.easeInOut,
                      ),
                      child: HoverButton(text: "Contact Me"),
                    ),
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
                const SizedBox(height: 10),
                _buildSocialMediaIcon(
                  FontAwesomeIcons.linkedin,
                  'https://www.linkedin.com/in/sajid-ikram/',
                ),
                const SizedBox(height: 10),
                _buildSocialMediaIcon(
                  FontAwesomeIcons.github,
                  'https://github.com/Sajid-ikram',
                ),
                const SizedBox(height: 10),
                _buildSocialMediaIcon(
                  FontAwesomeIcons.stackOverflow,
                  'https://stackoverflow.com/users/14620219/sajid-ikram',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomImages extends StatelessWidget {
  List<String> images = [
    "${releasePath}assets/a.png",
    "${releasePath}assets/b.png",
    "${releasePath}assets/c.png",
    "${releasePath}assets/d.png",
    "${releasePath}assets/e.png",
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
                      borderRadius: BorderRadius.circular(20),
                      child: Center(
                          child: Image.network(
                        item,
                        fit: BoxFit.contain,
                        height: height,
                        width: 300,
                      )),
                    ))
                .toList(),
          );
        },
      ),
    );
  }
}
