import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utils/colors.dart';

class ContactMe extends StatefulWidget {
  const ContactMe({super.key});

  @override
  State<ContactMe> createState() => _ContactMeState();
}

class _ContactMeState extends State<ContactMe> {
  Map<IconData, Color> hoverColors = {
    FontAwesomeIcons.linkedin: Colors.white.withOpacity(0.7),
    FontAwesomeIcons.github: Colors.white.withOpacity(0.7),
    FontAwesomeIcons.stackOverflow: Colors.white.withOpacity(0.7),
  };

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 50,
                  width: size.width,
                  color: const Color(0xff3D3E42),
                ),
                Container(
                  height: 50,
                  width: size.width,
                  color: primaryColor,
                ),
              ],
            ),
            Positioned(
              top: size.width < 600 ? 25 : 18,
              left: 0,
              child: SizedBox(
                width: size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        height: 3,
                        color: secondaryColor,
                      ),
                    ),
                    const SizedBox(width: 15),
                    Text(
                      "Contact Me",
                      style: TextStyle(
                        fontSize: size.width < 500 ? 35 : 45,
                        color: Colors.white.withOpacity(0.7),
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Container(
                        height: 3,
                        color: secondaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 30),
        Column(
          children: [
            if (size.width > 600)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildContactInfo(Icons.email, "sajidmdikram.com"),
                  SizedBox(width: 10),
                  buildContactInfo(Icons.phone, "+44 7541 903239"),
                ],
              ),
            if (size.width < 600)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildContactInfo(Icons.email, "sajidmdikram.com"),
                      SizedBox(width: 10),
                      buildContactInfo(Icons.phone, "+44 7541 903239"),
                    ],
                  ),
                ],
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildContactInfo(Icons.location_on, "Islington, London, UK"),
              ],
            ),
          ],
        ),
        const SizedBox(height: 70),
        Row(
          children: [
            Expanded(
              child: Container(
                height: 3,
                color: secondaryColor,
              ),
            ),
            const SizedBox(width: 20),
            _buildSocialMediaIcon(
              FontAwesomeIcons.linkedin,
              'https://www.linkedin.com/in/sajid-ikram/',
            ),
            const SizedBox(width: 15),
            _buildSocialMediaIcon(
              FontAwesomeIcons.github,
              'https://github.com/Sajid-ikram',
            ),
            const SizedBox(width: 15),
            _buildSocialMediaIcon(
              FontAwesomeIcons.stackOverflow,
              'https://stackoverflow.com/users/14620219/sajid-ikram',
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Container(
                height: 3,
                color: secondaryColor,
              ),
            ),
          ],
        ),
        const SizedBox(height: 50),
        Text(
          "Thanks For Scrolling!",
          style: TextStyle(
            fontSize: size.width < 500 ? 25 : 35,
            color: secondaryColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 30),
      ],
    );
  }

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

  GestureDetector buildContactInfo(IconData icon, String text) {
    bool isHovered = false;
    return GestureDetector(
      onTap: () {
        if (icon == Icons.email) {
          _launchUrl("mailto:$text");
        } else if (icon == Icons.phone) {
          _launchUrl("tel:$text");
        } else if (icon == Icons.location_on) {
          _launchUrl("https://www.google.com/maps/search/?api=1&query=$text");
        }
      },
      child: StatefulBuilder(
        builder: (context, setState) {
          return MouseRegion(
            onEnter: (_) => setState(() => isHovered = true),
            onExit: (_) => setState(() => isHovered = false),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 250,
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              decoration: BoxDecoration(
                color: isHovered ? secondaryColor : const Color(0xff3D3E42),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(icon, color: isHovered ? primaryColor : Colors.white),
                  const SizedBox(width: 10),
                  Text(
                    text,
                    style: TextStyle(
                        color: isHovered ? primaryColor : secondaryColor),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
