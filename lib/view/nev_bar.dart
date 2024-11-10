import 'package:dev_ikram/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomNevBar extends StatelessWidget {
  const CustomNevBar({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SizedBox(
      height: 100,
      width: size.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: size.width * 0.05),
          Icon(FontAwesomeIcons.house),
          Spacer(),
          HoverText(text: "About"),
          SizedBox(width: 40),
          HoverText(text: "Portfolio"),
          SizedBox(width: 40),
          HoverText(text: "Contact"),
          Spacer(),
          Icon(FontAwesomeIcons.magnifyingGlass),
          SizedBox(width: size.width * 0.05),
        ],
      ),
    );
  }
}

class HoverText extends StatefulWidget {
  final String text;

  HoverText({required this.text});

  @override
  _HoverTextState createState() => _HoverTextState();
}

class _HoverTextState extends State<HoverText> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MouseRegion(
        onEnter: (_) => setState(() => isHovering = true),
        onExit: (_) => setState(() => isHovering = false),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          child: Text(
            widget.text,
            style: TextStyle(
              color: isHovering ? Colors.white : Colors.grey,
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
