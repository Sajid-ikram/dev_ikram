import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:readmore/readmore.dart';

import '../utils/colors.dart';
import '../utils/constant_text.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 100),
          Text(
            "About",
            style: TextStyle(
              fontSize: 50,
              color: Colors.white.withOpacity(0.7),
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 3,
                width: 80,
                color: secondaryColor,
                margin: const EdgeInsets.fromLTRB(0, 13, 10, 0),
              ),
              Expanded(
                child: ReadMoreText(
                  about,
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
              ),
            ],
          ),
        ],
      ),
    );
  }
}
