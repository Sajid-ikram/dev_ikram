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
      'title': 'Software Engineer',
      'year': "2023",
      'office': "Deepgreen Studio",
      'description':
          "At Deepgreen Studio (January 2023 – August 2023), I excelled in developing and enhancing POS payment systems, integrating real-time updates to optimize functionality. I also implemented a robust POS receipt printing mechanism, reducing errors by 50%. A significant achievement was designing an NFC-based attendance system from scratch, demonstrating my problem-solving skills and technical expertise. Additionally, I mentored a colleague in Flutter development, which resulted in a great improvement in their performance."
    },
    {
      'title': 'Software Engineer Intern',
      'year': "2022",
      'office': "AlgoMatrix Limited",
      'description':
          "During my time as a Software Developer Intern at AlgoMatrix Limited (October 2021 – February 2022), I focused on creating innovative mobile applications and integrating backend services. I developed a feature-rich photo editor app, which now boasts over 10,000 active users, enhancing the user experience with cutting-edge editing tools. My role also involved developing an e-commerce app and integrating RESTful APIs, solidifying my proficiency in cross-platform development and backend integration."
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
              fontSize: 50,
              color: Colors.white.withOpacity(0.7),
              fontWeight: FontWeight.w900,
            ),
          ),
          SizedBox(height: size.height * 0.05),
          Container(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.045),
            height: size.height * 0.65,
            child: ScrollConfiguration(
              behavior: const ScrollBehavior().copyWith(overscroll: false, scrollbars: false),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ExperienceItem(
                      projects: projects[0],
                    ),
                    SizedBox(height: size.height * 0.05),
                    ExperienceItem(
                      projects: projects[1],
                    ),
                  ],
                ),
              ),
            ),
          ),


          /* Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.045),
            child: StaggeredGrid.count(
              crossAxisCount: crossAxisCount , // Number of columns in the grid
              mainAxisSpacing: size.width * 0.015,
              crossAxisSpacing: size.width * 0.015,

              children: [
                StaggeredGridTile.count(
                  crossAxisCellCount: 5,
                  mainAxisCellCount: 1,
                  child: ExperienceItem(
                    projects: projects[0],
                  ),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 5,
                  mainAxisCellCount: 1,
                  child: ExperienceItem(
                    projects: projects[1],
                  ),
                ),
              ],
            ),
          ),*/
          SizedBox(height: size.height * 0.05),
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
                height: 180,
                color: Colors.white,
              ),
            ],
          ),
          SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.projects["title"],
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white.withOpacity(0.7),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  widget.projects["office"],
                  style: TextStyle(
                    fontSize: 20,
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
                  trimLines: 4,
                  textAlign: TextAlign.justify,
                  colorClickableText: primaryColor,
                  trimCollapsedText: ' Show more',
                  trimExpandedText: ' Show less',
                  lessStyle: TextStyle(
                    fontSize: 18,
                    color: secondaryColor.withOpacity(0.7),
                  ),
                  delimiterStyle: TextStyle(
                    fontSize: 18,
                    color: Colors.white.withOpacity(0.7),
                  ),
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white.withOpacity(0.7),
                  ),
                  moreStyle:
                  TextStyle(
                    fontSize: 18,
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
