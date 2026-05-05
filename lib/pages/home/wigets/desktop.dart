

// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:get/get.dart'; // Ensure GetX is added in pubspec.yaml
// import 'package:major_project1/constants/content.dart';
// import 'package:major_project1/helpers/responsive.dart';
// import 'package:major_project1/helpers/style.dart';
// import 'package:major_project1/widgets/bottom_text_widget.dart';
// import 'package:url_launcher/url_launcher.dart'; // Required for launching URLs

// class DesktopScreen extends StatelessWidget {
//   const DesktopScreen({Key? key}) : super(key: key);

//   Future<void> _launchURL() async {
//     const url = 'https://b7a9e939cc301ba5c8.gradio.live/';
//     if (await canLaunch(url)) {
//       await launch(url);
//     } else {
//       throw 'Could not launch $url';
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     var screenSize = MediaQuery.of(context).size;

//     return Container(
//       constraints: BoxConstraints(maxWidth: 1440), // Maximum width for the screen
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           // Left side content
//           Expanded(
//             child: Padding(
//               padding: EdgeInsets.symmetric(horizontal: 40),
//               child: SingleChildScrollView(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     // "Because you deserve better" Text
//                     Text(
//                       "Building a better world",
//                       style: GoogleFonts.roboto(
//                         color: active,
//                         fontSize: 14,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     SizedBox(height: 15),

//                     // Main Heading
//                     RichText(
//                       text: TextSpan(
//                         children: [
//                           TextSpan(text: "The Satellite-Based "),
//                           TextSpan(
//                             text: "Human Settlement",
//                             style: GoogleFonts.roboto(color: active),
//                           ),
//                           TextSpan(text: " Detection "),
//                           TextSpan(
//                             text: "System",
//                             style: GoogleFonts.roboto(color: active),
//                           ),
//                         ],
//                         style: GoogleFonts.roboto(
//                           fontSize: ResponsiveWidget.isMediumScreen(context)
//                               ? 38
//                               : 58,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 20),

//                     // Paragraph Text
//                     if (screenSize.height > 700)
//                       Text(
//                         mainParagraph,
//                         style: GoogleFonts.roboto(
//                           fontSize: 20,
//                           letterSpacing: 1.5,
//                           height: 1.5,
//                         ),
//                       ),

//                     SizedBox(height: 20),

//                     // Email Input and Button
//                     Container(
//                       padding: EdgeInsets.all(8),
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(40),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.black.withOpacity(.1),
//                             offset: Offset(0, 40),
//                             blurRadius: 80,
//                           ),
//                         ],
//                       ),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Row(
//                             children: [
//                               Icon(Icons.forest_outlined),
//                               SizedBox(width: 8),
//                               Text(
//                                 "Analyze human settlements and surrounding land cover ",
//                                 style: TextStyle(fontSize: 16),
//                               ),
//                             ],
//                           ),
//                           ElevatedButton(
//                             onPressed: _launchURL, // Launch URL when button pressed
//                             child: Text("Get Started"),
//                           ),
//                         ],
//                       ),
//                     ),

//                     SizedBox(height: screenSize.height / 14),

//                     // Bottom Text
//                     if (screenSize.height > 700)
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           BottomText(
//                             mainText: "20+",
//                             secondaryText:
//                                 "Urban development projects\nmonitored annually",
//                           ),
//                           BottomText(
//                             mainText: "500+",
//                             secondaryText:
//                                 "Disaster-prone areas\ntracked for early warning",
//                           ),
//                           BottomText(
//                             mainText: "1M+",
//                             secondaryText:
//                                 "Changes in land cover\ndetected globally",
//                           ),
//                         ],
//                       ),
//                   ],
//                 ),
//               ),
//             ),
//           ),

//           // Right side content (image)
//           Expanded(
//             child: SingleChildScrollView(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   SizedBox(height: screenSize.width / 28),
//                   Image.asset(
//                     "assets/images/img.png",
//                     width: screenSize.width / 2,
//                     fit: BoxFit.contain,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }



// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:major_project1/constants/content.dart';
// import 'package:major_project1/helpers/responsive.dart';
// import 'package:major_project1/helpers/style.dart';
// import 'package:major_project1/widgets/bottom_text_widget.dart';
// import 'package:url_launcher/url_launcher.dart';

// // ─── Color palette — matches AppBar(0xFF2E7D32) used in other pages ──────────
// const Color kDarkGreen      = Color(0xFF1B5E20); // deepest green
// const Color kPrimaryGreen   = Color(0xFF2E7D32); // same as AppBar
// const Color kMediumGreen    = Color(0xFF388E3C);
// const Color kAccentGreen    = Color(0xFF66BB6A); // bright accent
// const Color kBgLight        = Color(0xFFE8F5E9); // same bg as other pages
// const Color kBgCard         = Color(0xFFF1F8E9);
// const Color kTextDark       = Color(0xFF1B3A1F);
// const Color kTextMuted      = Color(0xFF4E6B52);

// class DesktopScreen extends StatelessWidget {
//   const DesktopScreen({Key? key}) : super(key: key);

//   Future<void> _launchURL() async {
//     const url = 'https://b7a9e939cc301ba5c8.gradio.live/';
//     final uri = Uri.parse(url);
//     if (await canLaunchUrl(uri)) {
//       await launchUrl(uri, mode: LaunchMode.externalApplication);
//     } else {
//       throw 'Could not launch $url';
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final screenSize = MediaQuery.of(context).size;
//     final isMedium = ResponsiveWidget.isMediumScreen(context);

//     return Container(
//       constraints: const BoxConstraints(maxWidth: 1440),
//       decoration: const BoxDecoration(
//         // Subtle green-tinted background — warmer and more natural than plain beige
//         gradient: LinearGradient(
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//           colors: [
//             Color(0xFFEEF7EE), // very light green-white
//             Color(0xFFE8F5E9), // matches other pages
//             Color(0xFFDCEDDC),
//           ],
//           stops: [0.0, 0.5, 1.0],
//         ),
//       ),
//       child: Stack(
//         children: [
//           // ── Decorative background circle (top-right glow) ─────────────────
//           Positioned(
//             top: -80,
//             right: -80,
//             child: Container(
//               width: 340,
//               height: 340,
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 color: kPrimaryGreen.withOpacity(0.07),
//               ),
//             ),
//           ),
//           // ── Decorative circle (bottom-left) ───────────────────────────────
//           Positioned(
//             bottom: -60,
//             left: -60,
//             child: Container(
//               width: 260,
//               height: 260,
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 color: kAccentGreen.withOpacity(0.08),
//               ),
//             ),
//           ),

//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               // ── LEFT SIDE ─────────────────────────────────────────────────
//               Expanded(
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(
//                       horizontal: 48, vertical: 40),
//                   child: SingleChildScrollView(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         // Tag line
//                         Container(
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 14, vertical: 6),
//                           decoration: BoxDecoration(
//                             color: kPrimaryGreen.withOpacity(0.12),
//                             borderRadius: BorderRadius.circular(20),
//                             border: Border.all(
//                               color: kPrimaryGreen.withOpacity(0.3),
//                               width: 1,
//                             ),
//                           ),
//                           child: Row(
//                             mainAxisSize: MainAxisSize.min,
//                             children: [
//                               const Icon(Icons.eco_rounded,
//                                   size: 15, color: kPrimaryGreen),
//                               const SizedBox(width: 6),
//                               Text(
//                                 "Building a better world",
//                                 style: GoogleFonts.sourceSerif4(
//                                   color: kPrimaryGreen,
//                                   fontSize: 13,
//                                   fontWeight: FontWeight.w600,
//                                   letterSpacing: 0.4,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),

//                         const SizedBox(height: 22),

//                         // Main heading
//                         RichText(
//                           text: TextSpan(
//                             style: GoogleFonts.sourceSerif4(
//                               fontSize: isMedium ? 36 : 52,
//                               fontWeight: FontWeight.w800,
//                               color: kTextDark,
//                               height: 1.15,
//                             ),
//                             children: [
//                               const TextSpan(text: "The Satellite-Based\n"),
//                               TextSpan(
//                                 text: "Human Settlement\n",
//                                 style: GoogleFonts.sourceSerif4(
//                                   color: kPrimaryGreen,
//                                   fontSize: isMedium ? 36 : 52,
//                                   fontWeight: FontWeight.w800,
//                                 ),
//                               ),
//                               const TextSpan(text: "Detection "),
//                               TextSpan(
//                                 text: "System",
//                                 style: GoogleFonts.sourceSerif4(
//                                   color: kMediumGreen,
//                                   fontSize: isMedium ? 36 : 52,
//                                   fontWeight: FontWeight.w800,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),

//                         const SizedBox(height: 22),

//                         // Paragraph
//                         if (screenSize.height > 700)
//                           Text(
//                             mainParagraph,
//                             style: GoogleFonts.lato(
//                               fontSize: 17,
//                               color: kTextMuted,
//                               letterSpacing: 0.3,
//                               height: 1.7,
//                             ),
//                           ),

//                         const SizedBox(height: 30),

//                         // CTA bar
//                         Container(
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 16, vertical: 10),
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(40),
//                             border: Border.all(
//                               color: kPrimaryGreen.withOpacity(0.2),
//                               width: 1.5,
//                             ),
//                             boxShadow: [
//                               BoxShadow(
//                                 color: kPrimaryGreen.withOpacity(0.1),
//                                 offset: const Offset(0, 8),
//                                 blurRadius: 24,
//                               ),
//                             ],
//                           ),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Row(
//                                 children: [
//                                   Container(
//                                     width: 36,
//                                     height: 36,
//                                     decoration: BoxDecoration(
//                                       color: kPrimaryGreen.withOpacity(0.1),
//                                       shape: BoxShape.circle,
//                                     ),
//                                     child: const Icon(
//                                         Icons.satellite_alt_rounded,
//                                         size: 18,
//                                         color: kPrimaryGreen),
//                                   ),
//                                   const SizedBox(width: 12),
//                                   Text(
//                                     "Analyze human settlements & land cover",
//                                     style: GoogleFonts.lato(
//                                       fontSize: 14.5,
//                                       color: kTextMuted,
//                                       fontWeight: FontWeight.w500,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               ElevatedButton(
//                                 onPressed: _launchURL,
//                                 style: ElevatedButton.styleFrom(
//                                   backgroundColor: kPrimaryGreen,
//                                   foregroundColor: Colors.white,
//                                   padding: const EdgeInsets.symmetric(
//                                       horizontal: 24, vertical: 14),
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(30),
//                                   ),
//                                   elevation: 4,
//                                   shadowColor:
//                                       kPrimaryGreen.withOpacity(0.4),
//                                 ),
//                                 child: Text(
//                                   "Get Started",
//                                   style: GoogleFonts.lato(
//                                     fontSize: 14.5,
//                                     fontWeight: FontWeight.w700,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),

//                         SizedBox(height: screenSize.height / 14),

//                         // Stats row
//                         if (screenSize.height > 700)
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               _StatCard(
//                                 value: "20+",
//                                 label:
//                                     "Urban development\nprojects monitored",
//                                 icon: Icons.location_city_rounded,
//                               ),
//                               _StatCard(
//                                 value: "500+",
//                                 label:
//                                     "Disaster-prone areas\ntracked for early warning",
//                                 icon: Icons.warning_amber_rounded,
//                               ),
//                               _StatCard(
//                                 value: "1M+",
//                                 label:
//                                     "Land cover changes\ndetected globally",
//                                 icon: Icons.public_rounded,
//                               ),
//                             ],
//                           ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),

//               // ── RIGHT SIDE ────────────────────────────────────────────────
//               Expanded(
//                 child: SingleChildScrollView(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       SizedBox(height: screenSize.width / 28),
//                       // Subtle card behind the image
//                       Container(
//                         margin: const EdgeInsets.only(right: 32),
//                         padding: const EdgeInsets.all(24),
//                         decoration: BoxDecoration(
//                           color: kPrimaryGreen.withOpacity(0.06),
//                           borderRadius: BorderRadius.circular(32),
//                           border: Border.all(
//                             color: kPrimaryGreen.withOpacity(0.12),
//                             width: 1.5,
//                           ),
//                         ),
//                         child: Image.asset(
//                           "assets/images/img.png",
//                           width: screenSize.width / 2.2,
//                           fit: BoxFit.contain,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// // ─── Stat card widget ─────────────────────────────────────────────────────────
// class _StatCard extends StatelessWidget {
//   final String value;
//   final String label;
//   final IconData icon;

//   const _StatCard({
//     required this.value,
//     required this.label,
//     required this.icon,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(16),
//         border: Border.all(
//           color: kPrimaryGreen.withOpacity(0.15),
//           width: 1.5,
//         ),
//         boxShadow: [
//           BoxShadow(
//             color: kPrimaryGreen.withOpacity(0.08),
//             blurRadius: 12,
//             offset: const Offset(0, 4),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Icon(icon, size: 20, color: kPrimaryGreen),
//           const SizedBox(height: 8),
//           Text(
//             value,
//             style: GoogleFonts.sourceSerif4(
//               fontSize: 32,
//               fontWeight: FontWeight.w800,
//               color: kDarkGreen,
//               height: 1,
//             ),
//           ),
//           const SizedBox(height: 4),
//           Text(
//             label,
//             style: GoogleFonts.lato(
//               fontSize: 12.5,
//               color: kTextMuted,
//               height: 1.5,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

// }


import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project1/constants/content.dart';
import 'package:major_project1/helpers/responsive.dart';
import 'package:major_project1/helpers/style.dart';
import 'package:major_project1/widgets/bottom_text_widget.dart';
import 'package:url_launcher/url_launcher.dart';

const Color kDarkGreen    = Color(0xFF1B5E20);
const Color kPrimaryGreen = Color(0xFF2E7D32);
const Color kMediumGreen  = Color(0xFF388E3C);
const Color kAccentGreen  = Color(0xFF66BB6A);
const Color kBgLight      = Color(0xFFE8F5E9);
const Color kTextDark     = Color(0xFF1B3A1F);
const Color kTextMuted    = Color(0xFF4E6B52);

class DesktopScreen extends StatelessWidget {
  const DesktopScreen({Key? key}) : super(key: key);

  Future<void> _launchURL() async {
    const url = 'https://b7a9e939cc301ba5c8.gradio.live/';
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isMedium = ResponsiveWidget.isMediumScreen(context);

    // Fill the entire available space — no maxWidth constraint that causes dead space
    return SizedBox.expand(
      child: Container(
        // Full-bleed green gradient — covers the whole screen including right edge
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFEEF7EE),
              Color(0xFFE8F5E9),
              Color(0xFFDCEDDC),
            ],
            stops: [0.0, 0.5, 1.0],
          ),
        ),
        child: Stack(
          children: [
            // Decorative circles
            Positioned(
              top: -80,
              right: -80,
              child: Container(
                width: 340,
                height: 340,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: kPrimaryGreen.withOpacity(0.07),
                ),
              ),
            ),
            Positioned(
              bottom: -60,
              left: -60,
              child: Container(
                width: 260,
                height: 260,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: kAccentGreen.withOpacity(0.08),
                ),
              ),
            ),

            // Main content — no scrolling, fills screen height
            Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // ── LEFT SIDE ──────────────────────────────────────────
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 48, vertical: 36),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Tag badge
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 14, vertical: 6),
                          decoration: BoxDecoration(
                            color: kPrimaryGreen.withOpacity(0.12),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: kPrimaryGreen.withOpacity(0.3),
                              width: 1,
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(Icons.eco_rounded,
                                  size: 15, color: kPrimaryGreen),
                              const SizedBox(width: 6),
                              Text(
                                "Building a better world",
                                style: GoogleFonts.sourceSerif4(
                                  color: kPrimaryGreen,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.4,
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 20),

                        // Main heading
                        RichText(
                          text: TextSpan(
                            style: GoogleFonts.sourceSerif4(
                              fontSize: isMedium ? 34 : 50,
                              fontWeight: FontWeight.w800,
                              color: kTextDark,
                              height: 1.15,
                            ),
                            children: [
                              const TextSpan(text: "The Satellite-Based\n"),
                              TextSpan(
                                text: "Human Settlement\n",
                                style: GoogleFonts.sourceSerif4(
                                  color: kPrimaryGreen,
                                  fontSize: isMedium ? 34 : 50,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              const TextSpan(text: "Detection "),
                              TextSpan(
                                text: "System",
                                style: GoogleFonts.sourceSerif4(
                                  color: kMediumGreen,
                                  fontSize: isMedium ? 34 : 50,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 18),

                        // Paragraph
                        Text(
                          mainParagraph,
                          style: GoogleFonts.lato(
                            fontSize: 16,
                            color: kTextMuted,
                            letterSpacing: 0.3,
                            height: 1.65,
                          ),
                        ),

                        const SizedBox(height: 28),

                        // CTA bar
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(40),
                            border: Border.all(
                              color: kPrimaryGreen.withOpacity(0.2),
                              width: 1.5,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: kPrimaryGreen.withOpacity(0.1),
                                offset: const Offset(0, 8),
                                blurRadius: 24,
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 36,
                                    height: 36,
                                    decoration: BoxDecoration(
                                      color: kPrimaryGreen.withOpacity(0.1),
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(
                                        Icons.satellite_alt_rounded,
                                        size: 18,
                                        color: kPrimaryGreen),
                                  ),
                                  const SizedBox(width: 12),
                                  Text(
                                    "Analyze human settlements & land cover",
                                    style: GoogleFonts.lato(
                                      fontSize: 14.5,
                                      color: kTextMuted,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              ElevatedButton(
                                onPressed: _launchURL,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: kPrimaryGreen,
                                  foregroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 24, vertical: 14),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  elevation: 4,
                                  shadowColor: kPrimaryGreen.withOpacity(0.4),
                                ),
                                child: Text(
                                  "Get Started",
                                  style: GoogleFonts.lato(
                                    fontSize: 14.5,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 36),

                        // Stats row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _StatCard(
                              value: "20+",
                              label: "Urban development\nprojects monitored",
                              icon: Icons.location_city_rounded,
                            ),
                            _StatCard(
                              value: "500+",
                              label: "Disaster-prone areas\ntracked for early warning",
                              icon: Icons.warning_amber_rounded,
                            ),
                            _StatCard(
                              value: "1M+",
                              label: "Land cover changes\ndetected globally",
                              icon: Icons.public_rounded,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                // ── RIGHT SIDE ─────────────────────────────────────────
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        right: 40, top: 36, bottom: 36),
                    child: Center(
                      child: Container(
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: kPrimaryGreen.withOpacity(0.06),
                          borderRadius: BorderRadius.circular(32),
                          border: Border.all(
                            color: kPrimaryGreen.withOpacity(0.12),
                            width: 1.5,
                          ),
                        ),
                        child: Image.asset(
                          "assets/images/img.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Stat card ────────────────────────────────────────────────────────────────
class _StatCard extends StatelessWidget {
  final String value;
  final String label;
  final IconData icon;

  const _StatCard({
    required this.value,
    required this.label,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: kPrimaryGreen.withOpacity(0.15),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: kPrimaryGreen.withOpacity(0.08),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20, color: kPrimaryGreen),
          const SizedBox(height: 8),
          Text(
            value,
            style: GoogleFonts.sourceSerif4(
              fontSize: 32,
              fontWeight: FontWeight.w800,
              color: kDarkGreen,
              height: 1,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: GoogleFonts.lato(
              fontSize: 12.5,
              color: kTextMuted,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}