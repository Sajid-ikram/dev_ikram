import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';

class HoverButton extends StatefulWidget {
  final String text;

  HoverButton({super.key, required this.text});

  @override
  _HoverButtonState createState() => _HoverButtonState();
}

class _HoverButtonState extends State<HoverButton> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MouseRegion(
        onEnter: (_) => setState(() => isHovering = true),
        onExit: (_) => setState(() => isHovering = false),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          child: Container(
            padding:
            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: isHovering ? secondaryColor : Colors.transparent,
              border: Border.all(color: secondaryColor, width: 2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              "Contact Me",
              style: TextStyle(
                color: isHovering ? Colors.white : secondaryColor,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}