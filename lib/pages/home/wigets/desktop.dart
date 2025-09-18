

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart'; // Ensure GetX is added in pubspec.yaml
import 'package:major_project1/constants/content.dart';
import 'package:major_project1/helpers/responsive.dart';
import 'package:major_project1/helpers/style.dart';
import 'package:major_project1/widgets/bottom_text_widget.dart';
import 'package:url_launcher/url_launcher.dart'; // Required for launching URLs

class DesktopScreen extends StatelessWidget {
  const DesktopScreen({Key? key}) : super(key: key);

  Future<void> _launchURL() async {
    const url = 'https://47d1e208a59037e9ae.gradio.live';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Container(
      constraints: BoxConstraints(maxWidth: 1440), // Maximum width for the screen
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left side content
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // "Because you deserve better" Text
                    Text(
                      "Building a better world",
                      style: GoogleFonts.roboto(
                        color: active,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 15),

                    // Main Heading
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(text: "The Satellite-Based "),
                          TextSpan(
                            text: "Human Settlement",
                            style: GoogleFonts.roboto(color: active),
                          ),
                          TextSpan(text: " Detection "),
                          TextSpan(
                            text: "System",
                            style: GoogleFonts.roboto(color: active),
                          ),
                        ],
                        style: GoogleFonts.roboto(
                          fontSize: ResponsiveWidget.isMediumScreen(context)
                              ? 38
                              : 58,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),

                    // Paragraph Text
                    if (screenSize.height > 700)
                      Text(
                        mainParagraph,
                        style: GoogleFonts.roboto(
                          fontSize: 20,
                          letterSpacing: 1.5,
                          height: 1.5,
                        ),
                      ),

                    SizedBox(height: 20),

                    // Email Input and Button
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(40),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(.1),
                            offset: Offset(0, 40),
                            blurRadius: 80,
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.forest_outlined),
                              SizedBox(width: 8),
                              Text(
                                "Analyze human settlements and surrounding land cover ",
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                          ElevatedButton(
                            onPressed: _launchURL, // Launch URL when button pressed
                            child: Text("Get Started"),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: screenSize.height / 14),

                    // Bottom Text
                    if (screenSize.height > 700)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BottomText(
                            mainText: "20+",
                            secondaryText:
                                "Urban development projects\nmonitored annually",
                          ),
                          BottomText(
                            mainText: "500+",
                            secondaryText:
                                "Disaster-prone areas\ntracked for early warning",
                          ),
                          BottomText(
                            mainText: "1M+",
                            secondaryText:
                                "Changes in land cover\ndetected globally",
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ),
          ),

          // Right side content (image)
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(height: screenSize.width / 28),
                  Image.asset(
                    "assets/images/img.png",
                    width: screenSize.width / 2,
                    fit: BoxFit.contain,
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
