import 'package:dev_ikram/utils/colors.dart';
import 'package:dev_ikram/view/home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _buildTheme(Brightness.dark),
      debugShowCheckedModeBanner: false,
      title: 'Ikram',
      home: const HomeWithPopup(),
    );
  }
}

ThemeData _buildTheme(brightness) {
  var baseTheme = ThemeData(
    brightness: brightness,
    primarySwatch: blackSwatch,
  );

  return baseTheme.copyWith(
    textTheme: GoogleFonts.montserratTextTheme(baseTheme.textTheme),
    primaryColor: const Color(0xff425C5A),
    scaffoldBackgroundColor: Colors.white,
  );
}

/// New Widget that wraps your Home page and adds the popup
class HomeWithPopup extends StatefulWidget {
  const HomeWithPopup({super.key});

  @override
  State<HomeWithPopup> createState() => _HomeWithPopupState();
}

class _HomeWithPopupState extends State<HomeWithPopup> {
  bool _showPopup = true; // Controls whether the popup is visible or not

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Your original Home page
          Home(),

          // Bottom popup
          if (_showPopup)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                margin: const EdgeInsets.all(8),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 6,
                      offset: Offset(0, -2),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Earning message
                    const Expanded(
                      child: Text(
                        "Warning: Site still under construction. Some features might be a bit like a half-finished masterpiece—getting there, but not quite there yet!",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16, color: Colors.white),

                      ),
                    ),

                    // Close button
                    IconButton(
                      onPressed: () {
                        setState(() {
                          _showPopup = false; // Hide the popup
                        });
                      },
                      icon: const Icon(Icons.close, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
