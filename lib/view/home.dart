import 'package:dev_ikram/view/nev_bar.dart';
import 'package:dev_ikram/view/projects.dart';
import 'package:dev_ikram/view/skills.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'about.dart';
import 'initial_page.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff34353A),
      body: ListView(
        children: [
          CustomNevBar(),
          InitialPage(),
          About(),
          SizedBox(height: 50),
          SkillsGrid(),
          Projects()
        ],
      ),
    );
  }
}
