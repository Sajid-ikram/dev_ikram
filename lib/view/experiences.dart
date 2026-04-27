import 'package:dev_icons/dev_icons.dart';
import 'package:dev_ikram/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:readmore/readmore.dart';

import '../utils/colors.dart';

class Experiences extends StatelessWidget {
  final List<Map<String, dynamic>> projects = [
    {
      'title': 'Junior Mobile App Developer',
      'year': '2025',
      'office': 'Perinatal Institute, Birmingham, UK',
      'description':
          '(October 2025 - Present) Build and maintain Flutter clinical forms (medical history and screening widgets) with complex validation and conditional visibility. Work with QA on test-fail tickets by reproducing issues, fixing widgets, and updating tests to prevent regressions. Align UI, validation rules, and info texts with clinical documentation using Git/Bitbucket and a PR-based workflow.',
    },
    {
      'title': 'Flutter Developer (Part-Time)',
      'year': '2025',
      'office': 'Finz',
      'description':
          '(April 2025 - July 2025) Developed a secure fintech app in Flutter integrating Weavr API for account, card, and transaction flows. Contributed to automated testing and CI/CD, and helped prepare builds for the App Store and Google Play.',
    },
    {
      'title': 'Software Engineer',
      'year': '2022',
      'office': 'Deepgreen Studio',
      'description':
          '(May 2022 - August 2023) Built POS and NFC-based systems with real-time processing and secure attendance tracking. Implemented database-driven features (SQLite/MongoDB) to support offline use and reliable syncing.',
    },
    {
      'title': 'Software Developer Intern',
      'year': '2021',
      'office': 'AlgoMatrix Limited',
      'description':
          '(October 2021 - February 2022) Developed a Flutter-based photo editor and e-commerce app, including performance-focused Protobuf API integration.',
    },
  ];

  Experiences({super.key});

  int getCrossAxisCount(double width) {
    if (width < 700) return 2; // Use 2 columns for very small screens
    if (width < 1100) return 3; // Use 3 columns for small to medium screens
    if (width < 1400) return 4; // Use 4 columns for medium to large screens
    return 5; // Use 5 columns for larger screens
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    int crossAxisCount = getCrossAxisCount(size.width);

    return Container(
      color: const Color(0xff3D3E42),
      width: size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: size.height * 0.05),
          Text(
            "Experience",
            style: TextStyle(
              fontSize: size.width < 500 ? 35 : 50,
              color: Colors.white.withOpacity(0.7),
              fontWeight: FontWeight.w900,
            ),
          ),
          SizedBox(height: size.height * 0.05),
          Container(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.045),
            child: Column(
              children: [
                const SizedBox(height: 20),
                ...projects.asMap().entries.map((entry) {
                  final index = entry.key;
                  final project = entry.value;

                  return Column(
                    children: [
                      ExperienceItem(projects: project),
                      if (index != projects.length - 1)
                        SizedBox(height: size.height * 0.05),
                    ],
                  );
                }),
              ],
            ),
          ),
          const SizedBox(height: 30)
        ],
      ),
    );
  }
}

class ExperienceItem extends StatefulWidget {
  final Map<String, dynamic> projects;

  const ExperienceItem({
    Key? key,
    required this.projects,
  }) : super(key: key);

  @override
  _ExperienceItemState createState() => _ExperienceItemState();
}

class _ExperienceItemState extends State<ExperienceItem> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Center(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomPaint(
            size: const Size(400, 200), // Width and height of the shape
            painter: RightArrowShapePainter(),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Text(widget.projects["year"]),
            ),
          ),
          const SizedBox(width: 20),
          Column(
            children: [
              const SizedBox(height: 8),
              Container(
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: BorderRadius.circular(100),
                  boxShadow: [
                    BoxShadow(
                      color: secondaryColor.withOpacity(0.5),
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Container(
                width: 3,
                height: 120,
                color: Colors.white,
              ),
            ],
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.projects["title"],
                  style: TextStyle(
                    fontSize: size.width < 500 ? 24 : 30,
                    color: Colors.white.withOpacity(0.7),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  widget.projects["office"],
                  style: TextStyle(
                    fontSize: size.width < 500 ? 18 : 20,
                    color: Colors.white.withOpacity(0.7),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 10),
                /* Text(
                  widget.projects["description"],
                  maxLines: 50,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white.withOpacity(0.7),
                  ),
                ),*/
                ReadMoreText(
                  widget.projects["description"],
                  trimMode: TrimMode.Line,
                  trimLines:2,
                  textAlign: TextAlign.justify,
                  colorClickableText: primaryColor,
                  trimCollapsedText: ' Show more',
                  trimExpandedText: ' Show less',
                  lessStyle: TextStyle(
                    fontSize: size.width < 500 ? 16 : 18,
                    color: secondaryColor.withOpacity(0.7),
                  ),
                  delimiterStyle: TextStyle(
                    fontSize: size.width < 500 ? 16 : 18,
                    color: Colors.white.withOpacity(0.7),
                  ),
                  style: TextStyle(
                    fontSize: size.width < 500 ? 16 : 18,
                    color: Colors.white.withOpacity(0.7),
                  ),
                  moreStyle: TextStyle(
                    fontSize: size.width < 500 ? 16 : 18,
                    color: secondaryColor.withOpacity(0.7),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class RightArrowShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.grey[700]!
      ..style = PaintingStyle.fill;

    // Draw the arrow pointing right
    final Path path = Path()
      ..moveTo(0, 0) // Start at the top-left
      ..lineTo(size.width - size.height / 2,
          0) // Move to the top-right (before the tip)
      ..lineTo(size.width, size.height / 2) // Arrow tip (right-center)
      ..lineTo(size.width - size.height / 2, size.height) // Bottom-right
      ..lineTo(0, size.height) // Bottom-left
      ..close(); // Close the path

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
