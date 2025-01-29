import 'package:dev_ikram/view/projects.dart';
import 'package:dev_ikram/view/skills.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../utils/colors.dart';
import 'about.dart';
import 'contact_me.dart';
import 'experiences.dart';
import 'initial_page.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: ListView(

        controller: _scrollController,
        children: [
          CustomNevBar(scrollController: _scrollController),
          InitialPage(scrollController: _scrollController),
          About(),
          SizedBox(height: 50),
          SkillsGrid(),
          Projects(),
          Experiences(),
          ContactMe(),
        ],
      ),
    );
  }
}

class CustomNevBar extends StatelessWidget {
  final ScrollController scrollController;

  CustomNevBar({super.key, required this.scrollController});

  void scrollToSection(double offset) {
    scrollController.animateTo(
      offset,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

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
          const Icon(FontAwesomeIcons.house),
          Spacer(),
          if(size.width > 450) GestureDetector(
            onTap: () => scrollToSection(size.height),
            // Scroll to the top (About section)
            child: HoverText(text: "About"),
          ),
          const SizedBox(width: 40),
          if(size.width > 450) GestureDetector(
            onTap: () => scrollToSection(size.height *
                (size.width < 700
                    ? 3
                    : size.width < 1100
                        ? 2.7
                        : size.width < 1400
                            ? 2.5
                            : 2.2)),
            // Scroll to Portfolio
            child: HoverText(text: "Projects"),
          ),
          const SizedBox(width: 40),
          if(size.width > 450) GestureDetector(
            onTap: () => scrollToSection(size.height *
                (size.width < 700
                    ? 4.7
                    : size.width < 1100
                        ? 4.3
                        : size.width < 1400
                            ? 4.5
                            : 3.5)), // Scroll to Contact
            child: HoverText(text: "Experience"),
          ),
          const Spacer(),
          const Icon(FontAwesomeIcons.magnifyingGlass),
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
