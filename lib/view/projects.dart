import 'package:dev_icons/dev_icons.dart';
import 'package:dev_ikram/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utils/constant_text.dart';

class Projects extends StatelessWidget {
  final List<Map<String, dynamic>> projects = [
    {'name': 'a.png', 'color': Colors.blue, 'icon': DevIcons.flutterPlain},
    {'name': 'b.jpeg', 'color': Colors.blueAccent, 'icon': DevIcons.dartPlain},
    {'name': 'c.png', 'color': Colors.orange, 'icon': DevIcons.firebasePlain},
    {'name': 'd.png', 'color': Colors.white, 'icon': DevIcons.githubOriginal},
    {'name': 'e.png', 'color': Color(0xff01738E), 'icon': DevIcons.javaPlain},
    {'name': 'f.png', 'color': Color(0xff01738E), 'icon': DevIcons.javaPlain},
  ];

  Projects({super.key});

  int getCrossAxisCount(double width) {
    if (width < 700) return 3; // Use 2 columns for very small screens
    if (width < 1100) return 4; // Use 3 columns for small to medium screens
    if (width < 1400) return 5; // Use 4 columns for medium to large screens
    return 6; // Use 5 columns for larger screens
  }



  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    int crossAxisCount = getCrossAxisCount(size.width);
    int rowCount = (projects.length / crossAxisCount).ceil();

    return SizedBox(
      width: size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: size.height * 0.05),
          Text(
            "Projects",
            style: TextStyle(
              fontSize: size.width < 500 ? 35 : 50,
              color: Colors.white.withOpacity(0.7),
              fontWeight: FontWeight.w900,
            ),
          ),
          SizedBox(height: size.height * 0.05),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.045),
            child: StaggeredGrid.count(
              crossAxisCount: crossAxisCount, // Number of columns in the grid
              mainAxisSpacing: size.width * 0.015,
              crossAxisSpacing: size.width * 0.015,
              children: const [
                StaggeredGridTile.count(
                  crossAxisCellCount: 3,
                  mainAxisCellCount: 2,
                  child: ProjectItemHover(
                    name: 'WB.png',
                    color: Colors.orange,
                    url: 'https://klio.digital/products/',
                  ),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 1,
                  mainAxisCellCount: 2,
                  child: ProjectItemHover(
                    name: 'a.png',
                    color: Colors.green,
                    url: 'https://github.com/Sajid-ikram/Assessment-3',
                  ),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 1,
                  mainAxisCellCount: 2,
                  child: ProjectItemHover(
                    name: 'b.png',
                    color: Colors.yellowAccent,
                    url: 'https://github.com/Sajid-ikram/LU-Bus-Tracker',
                  ),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 1,
                  mainAxisCellCount: 2,
                  child: ProjectItemHover(
                    name: 'c.png',
                    color: Colors.blue,
                    url: 'https://github.com/Sajid-ikram/LU-CSE-Community-',
                  ),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 1,
                  mainAxisCellCount: 2,
                  child: ProjectItemHover(
                    name: 'f.png',
                    color: Colors.purple,
                    url: 'https://apps.apple.com/lu/app/ai-photo-editor-storygram/id6444662230',
                  ),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 1,
                  mainAxisCellCount: 2,
                  child: ProjectItemHover(
                    name: 'd.png',
                    color: Colors.black,
                    url: '  ',
                  ),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 1,
                  mainAxisCellCount: 2,
                  child: ProjectItemHover(
                    name: 'e.png',
                    color: Colors.yellow,
                    url: 'https://github.com/Sajid-ikram/Assessment_2',
                  ),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 3,
                  mainAxisCellCount: 2,
                  child: ProjectItemHover(
                    name: 'WA.png',
                    color: Colors.blueAccent,
                    url: 'https://github.com/Sajid-ikram/Assessment-3',
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: size.height * 0.05),
          /*SizedBox(
            height: boxHeight * (rowCount + 1) +
                (crossAxisCount == 2
                    ? -size.width * 0.4
                    : crossAxisCount == 3
                        ? -size.width * 0.1
                        : (size.width * 0.02 * (crossAxisCount - 1))),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.045),
              child: ScrollConfiguration(
                behavior:
                    ScrollConfiguration.of(context).copyWith(scrollbars: false),
                child: GridView.builder(
                  padding: EdgeInsets.all(20),
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: skills.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: getCrossAxisCount(size.width),
                    mainAxisSpacing: size.width * 0.02,
                    crossAxisSpacing: size.width * 0.03,
                    childAspectRatio: 0.5,
                  ),
                  itemBuilder: (context, index) {
                    var skill = skills[index];

                    return SkillItem(
                      name: skill['name'],
                      color: skill['color'],
                      icon: skill['icon'],
                    );
                  },
                ),
              ),
            ),
          ),*/
        ],
      ),
    );
  }
}

class ProjectItemHover extends StatefulWidget {
  final String name;
  final String url;
  final Color color;

  const ProjectItemHover({
    Key? key,
    required this.name,
    required this.color,
    required this.url,
  }) : super(key: key);

  @override
  _ProjectItemHoverState createState() => _ProjectItemHoverState();
}

class _ProjectItemHoverState extends State<ProjectItemHover> {
  bool _isHovered = false;

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    // Define the transformation scale based on hover state
    final Matrix4 transformScale = Matrix4.identity()
      ..scale(_isHovered ? 1.01 : 1.0);

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: () => _launchUrl(widget.url),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          transform: transformScale,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Padding(
              padding: widget.name == "WA.png" || widget.name == "WB.png"
                  ? const EdgeInsets.symmetric(vertical: 9)
                  : const EdgeInsets.all(0.0),
              child: Image.network("${releasePath}assets/${widget.name}",
                  fit: BoxFit.contain),
            ),
          ),
        ),
      ),
    );
  }
}
