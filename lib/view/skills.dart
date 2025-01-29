import 'package:dev_icons/dev_icons.dart';
import 'package:dev_ikram/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SkillsGrid extends StatelessWidget {
  final List<Map<String, dynamic>> skills = [
    {'name': 'Flutter', 'color': Colors.blue, 'icon': DevIcons.flutterPlain},
    {'name': 'Dart', 'color': Colors.blueAccent, 'icon': DevIcons.dartPlain},
    {
      'name': 'Firebase',
      'color': Colors.orange,
      'icon': DevIcons.firebasePlain
    },
    {'name': 'Git', 'color': Color(0xffE74E30), 'icon': DevIcons.gitPlain},
    {'name': 'GitHub', 'color': Colors.white, 'icon': DevIcons.githubOriginal},
    {'name': 'Java', 'color': Color(0xff01738E), 'icon': DevIcons.javaPlain},
    {'name': 'Node.js', 'color': Colors.green, 'icon': DevIcons.nodejsPlain},
    {
      'name': 'Express.js',
      'color': Colors.orange,
      'icon': DevIcons.expressOriginal
    },
    {
      'name': 'JavaScript',
      'color': Color(0xffF7E025),
      'icon': DevIcons.expressOriginal
    },
    {'name': 'C', 'color': Color(0xff5A69B9), 'icon': DevIcons.cPlain},
    {
      'name': 'C++',
      'color': Color(0xff0984CF),
      'icon': DevIcons.cplusplusPlain
    },
    {'name': 'MongoDB', 'color': Colors.green, 'icon': DevIcons.mongodbPlain},
  ];

  SkillsGrid({super.key});

  int getCrossAxisCount(double width) {
    if (width < 500) return 2; // Use 2 columns for very small screens
    if (width < 700) return 3; // Use 2 columns for very small screens
    if (width < 1100) return 4; // Use 3 columns for small to medium screens
    if (width < 1400) return 5; // Use 4 columns for medium to large screens
    return 6; // Use 5 columns for larger screens
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    print(size.width);
    int crossAxisCount = getCrossAxisCount(size.width);
    int rowCount = (skills.length / crossAxisCount).ceil();
    var boxHeight =
        ((size.width - ((size.width * 0.045) / 2)) / ( (crossAxisCount == 6 || crossAxisCount == 5)  ? (crossAxisCount - 1) : crossAxisCount ) ) -
            (size.width * 0.02 * crossAxisCount - 1); // i don't even know what i did here

    print(rowCount);
    print(crossAxisCount);
    return SizedBox(
      width: size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "My Skills",
            style: TextStyle(
              fontSize: size.width < 500 ? 35 : 50,
              color: Colors.white.withOpacity(0.7),
              fontWeight: FontWeight.w900,
            ),
          ),
          SizedBox(height: size.height * 0.05),
          SizedBox(
            height: boxHeight * (rowCount + 1) +
                (crossAxisCount == 2
                    ? -size.width * 0.4
                    : crossAxisCount == 3
                        ? -size.width * 0.1
                        : (size.width * 0.02 * (crossAxisCount - 1))),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.035),
              child: ScrollConfiguration(
                behavior:
                    ScrollConfiguration.of(context).copyWith(scrollbars: false),
                child: GridView.builder(
                  padding: const EdgeInsets.all(20),
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: skills.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: getCrossAxisCount(size.width),
                    mainAxisSpacing: size.width * 0.02,
                    crossAxisSpacing: size.width * 0.02,
                    childAspectRatio: 1,
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
          ),
        ],
      ),
    );
  }
}

class SkillItem extends StatefulWidget {
  final String name;
  final Color color;
  final IconData icon;

  const SkillItem({
    Key? key,
    required this.name,
    required this.color,
    required this.icon,
  }) : super(key: key);

  @override
  _SkillItemState createState() => _SkillItemState();
}

class _SkillItemState extends State<SkillItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    // Define the transformation scale based on hover state
    final Matrix4 transformScale = Matrix4.identity()
      ..scale(_isHovered ? 1.01 : 1.0);

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: transformScale,
        decoration: BoxDecoration(
          color: _isHovered ? primaryColor : Color(0xff3D3E42),
          borderRadius: BorderRadius.circular(8),
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                      color: widget.color.withOpacity(0.5),
                      blurRadius: 10,
                      spreadRadius: 2)
                ]
              : [],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              widget.icon,
              color: widget.color,
              size: _isHovered ? 80 : 70,
            ),
            const SizedBox(height: 20),
            Text(
              widget.name,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white.withOpacity(_isHovered ? 0.9 : 0.7),
                fontSize: _isHovered ? 22 : 20,
                fontWeight: _isHovered ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
