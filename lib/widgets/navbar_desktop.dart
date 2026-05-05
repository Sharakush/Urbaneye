




// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:major_project1/helpers/style.dart';
// import 'package:major_project1/widgets/custom_button.dart';

// // 👉 Import your pages
// import 'package:major_project1/pages/analysis_page.dart';
// import 'package:major_project1/pages/environmental_impact_page.dart';

// class NavBar extends StatefulWidget {
//   @override
//   _NavBarState createState() => _NavBarState();
// }

// class _NavBarState extends State<NavBar> {
//   final List _isHovering = [false, false];

//   @override
//   Widget build(BuildContext context) {
//     var screenSize = MediaQuery.of(context).size;

//     return PreferredSize(
//       preferredSize: Size(screenSize.width, 1000),
//       child: Container(
//         color: Colors.transparent,
//         child: Padding(
//           padding: const EdgeInsets.all(20),
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               const SizedBox(width: 20),
//               Image.asset("assets/images/logo.png"),
//               Expanded(
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     SizedBox(width: screenSize.width / 8),

//                     // ---------------- Analysis Button ----------------
//                     InkWell(
//                       onHover: (value) {
//                         setState(() => _isHovering[0] = value);
//                       },
//                       hoverColor: Colors.transparent,
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => const AnalysisPage(),
//                           ),
//                         );
//                       },
//                       child: Column(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           const SizedBox(height: 12),
//                           Text(
//                             'Analysis',
//                             style: GoogleFonts.roboto(
//                               fontSize: 16,
//                               fontWeight: FontWeight.bold,
//                               color: _isHovering[0] ? active : disable,
//                             ),
//                           ),
//                           const SizedBox(height: 5),
//                           Visibility(
//                             maintainAnimation: true,
//                             maintainState: true,
//                             maintainSize: true,
//                             visible: _isHovering[0],
//                             child: Container(
//                               decoration: BoxDecoration(
//                                 color: active,
//                                 borderRadius: BorderRadius.circular(20),
//                               ),
//                               height: 7,
//                               width: 7,
//                             ),
//                           )
//                         ],
//                       ),
//                     ),

//                     SizedBox(width: screenSize.width / 20),

//                     // ---------------- Log In Button ----------------
//                     // InkWell(
//                     //   onHover: (value) {
//                     //     setState(() => _isHovering[1] = value);
//                     //   },
//                     //   hoverColor: Colors.transparent,
//                     //   onTap: () {},
//                     //   child: Column(
//                     //     mainAxisSize: MainAxisSize.min,
//                     //     children: [
//                     //       const SizedBox(height: 12),
//                     //       Text(
//                     //         'Log In',
//                     //         style: GoogleFonts.roboto(
//                     //           fontSize: 16,
//                     //           fontWeight: FontWeight.bold,
//                     //           color: _isHovering[1] ? active : disable,
//                     //         ),
//                     //       ),
//                     //       const SizedBox(height: 5),
//                     //       Visibility(
//                     //         maintainAnimation: true,
//                     //         maintainState: true,
//                     //         maintainSize: true,
//                     //         visible: _isHovering[1],
//                     //         child: Container(
//                     //           decoration: BoxDecoration(
//                     //             color: active,
//                     //             borderRadius: BorderRadius.circular(20),
//                     //           ),
//                     //           height: 7,
//                     //           width: 7,
//                     //         ),
//                     //       )
//                     //     ],
//                     //   ),
//                     // ),
//                     SizedBox(width: screenSize.width / 20),
//                   ],
//                 ),
//               ),

//               // ---------------- Effect Button ----------------
//               CustomButton(
//                 text: "Effect",
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (_) => const EnvironmentalImpactPage(),
//                     ),
//                   );
//                 },
//               ),

//               SizedBox(width: screenSize.width / 40),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:major_project1/helpers/style.dart';
// import 'package:major_project1/widgets/custom_button.dart';
// import 'package:major_project1/pages/analysis_page.dart';
// import 'package:major_project1/pages/environmental_impact_page.dart';

// const Color kPrimaryGreen = Color(0xFF2E7D32);
// const Color kDarkGreen    = Color(0xFF1B5E20);
// const Color kAccentGreen  = Color(0xFF66BB6A);
// const Color kNavBg        = Color(0xFFE8F5E9); // matches page background

// class NavBar extends StatefulWidget {
//   @override
//   _NavBarState createState() => _NavBarState();
// }

// class _NavBarState extends State<NavBar> {
//   final List<bool> _isHovering = [false, false];

//   @override
//   Widget build(BuildContext context) {
//     final screenSize = MediaQuery.of(context).size;

//     return PreferredSize(
//       preferredSize: Size(screenSize.width, 80),
//       child: Container(
//         // Match the page background — no more yellow/beige
//         color: kNavBg,
//         padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 12),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             // ── Logo + Brand name ─────────────────────────────────────────
//             Row(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 // Tree logo with green tinted circle bg
//                 Container(
//                   padding: const EdgeInsets.all(6),
//                   decoration: BoxDecoration(
//                     color: kPrimaryGreen.withOpacity(0.1),
//                     shape: BoxShape.circle,
//                     border: Border.all(
//                       color: kPrimaryGreen.withOpacity(0.2),
//                       width: 1.5,
//                     ),
//                   ),
//                   child: Image.asset(
//                     "assets/images/logo.png",
//                     width: 36,
//                     height: 36,
//                   ),
//                 ),
//                 const SizedBox(width: 10),
//                 // Brand name
//                 RichText(
//                   text: TextSpan(
//                     children: [
//                       TextSpan(
//                         text: "Urban",
//                         style: GoogleFonts.sourceSerif4(
//                           fontSize: 20,
//                           fontWeight: FontWeight.w800,
//                           color: kDarkGreen,
//                           letterSpacing: 0.2,
//                         ),
//                       ),
//                       TextSpan(
//                         text: "Eye",
//                         style: GoogleFonts.sourceSerif4(
//                           fontSize: 20,
//                           fontWeight: FontWeight.w800,
//                           color: kAccentGreen,
//                           letterSpacing: 0.2,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),

//             const Spacer(),

//             // ── Analysis nav item ─────────────────────────────────────────
//             _NavItem(
//               label: "Analysis",
//               isHovering: _isHovering[0],
//               icon: Icons.analytics_rounded,
//               onHover: (v) => setState(() => _isHovering[0] = v),
//               onTap: () => Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (_) => const AnalysisPage()),
//               ),
//             ),

//             const SizedBox(width: 12),

//             // ── Effect button ─────────────────────────────────────────────
//             _NavItem(
//               label: "Effect",
//               isHovering: _isHovering[1],
//               icon: Icons.eco_rounded,
//               onHover: (v) => setState(() => _isHovering[1] = v),
//               onTap: () => Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (_) => const EnvironmentalImpactPage()),
//               ),
//               isPrimary: true,
//             ),

//             const SizedBox(width: 16),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // ─── Reusable nav item ────────────────────────────────────────────────────────
// class _NavItem extends StatelessWidget {
//   final String label;
//   final bool isHovering;
//   final IconData icon;
//   final Function(bool) onHover;
//   final VoidCallback onTap;
//   final bool isPrimary;

//   const _NavItem({
//     required this.label,
//     required this.isHovering,
//     required this.icon,
//     required this.onHover,
//     required this.onTap,
//     this.isPrimary = false,
//   });

//   @override
//   Widget build(BuildContext context) {
//     if (isPrimary) {
//       // Filled pill button style
//       return MouseRegion(
//         onEnter: (_) => onHover(true),
//         onExit: (_) => onHover(false),
//         child: GestureDetector(
//           onTap: onTap,
//           child: AnimatedContainer(
//             duration: const Duration(milliseconds: 200),
//             padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//             decoration: BoxDecoration(
//               color: isHovering ? kDarkGreen : kPrimaryGreen,
//               borderRadius: BorderRadius.circular(30),
//               boxShadow: [
//                 BoxShadow(
//                   color: kPrimaryGreen.withOpacity(isHovering ? 0.4 : 0.2),
//                   blurRadius: isHovering ? 16 : 8,
//                   offset: const Offset(0, 4),
//                 ),
//               ],
//             ),
//             child: Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Icon(icon, size: 16, color: Colors.white),
//                 const SizedBox(width: 7),
//                 Text(
//                   label,
//                   style: GoogleFonts.lato(
//                     fontSize: 15,
//                     fontWeight: FontWeight.w700,
//                     color: Colors.white,
//                     letterSpacing: 0.3,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       );
//     }

//     // Outlined style for secondary nav items
//     return MouseRegion(
//       onEnter: (_) => onHover(true),
//       onExit: (_) => onHover(false),
//       child: GestureDetector(
//         onTap: onTap,
//         child: AnimatedContainer(
//           duration: const Duration(milliseconds: 200),
//           padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
//           decoration: BoxDecoration(
//             color: isHovering
//                 ? kPrimaryGreen.withOpacity(0.1)
//                 : Colors.transparent,
//             borderRadius: BorderRadius.circular(30),
//             border: Border.all(
//               color: isHovering
//                   ? kPrimaryGreen.withOpacity(0.5)
//                   : kPrimaryGreen.withOpacity(0.25),
//               width: 1.5,
//             ),
//           ),
//           child: Row(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Icon(
//                 icon,
//                 size: 16,
//                 color: isHovering ? kPrimaryGreen : const Color(0xFF4E6B52),
//               ),
//               const SizedBox(width: 7),
//               Text(
//                 label,
//                 style: GoogleFonts.lato(
//                   fontSize: 15,
//                   fontWeight: FontWeight.w700,
//                   color: isHovering ? kPrimaryGreen : const Color(0xFF4E6B52),
//                   letterSpacing: 0.3,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project1/pages/analysis_page.dart';
import 'package:major_project1/pages/environmental_impact_page.dart';

const Color kPrimaryGreen = Color(0xFF2E7D32);
const Color kDarkGreen    = Color(0xFF1B5E20);
const Color kNavBg        = Color(0xFFE8F5E9);

class NavBar extends StatefulWidget {
  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  final List<bool> _isHovering = [false, false];

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return PreferredSize(
      preferredSize: Size(screenSize.width, 80),
      child: Container(
        color: kNavBg,
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // ── Brand ───────────────────────────────────────────────────
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 58,
                      height: 58,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: kPrimaryGreen.withOpacity(0.07),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(7),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        border: Border.all(
                          color: kPrimaryGreen.withOpacity(0.25),
                          width: 2,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: kPrimaryGreen.withOpacity(0.15),
                            blurRadius: 10,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Image.asset(
                        "assets/images/logo.png",
                        width: 32,
                        height: 32,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Urban",
                            style: GoogleFonts.sourceSerif4(
                              fontSize: 26,
                              fontWeight: FontWeight.w900,
                              color: kDarkGreen,
                              letterSpacing: -0.5,
                            ),
                          ),
                          TextSpan(
                            text: "Eye",
                            style: GoogleFonts.sourceSerif4(
                              fontSize: 26,
                              fontWeight: FontWeight.w900,
                              color: kPrimaryGreen,
                              letterSpacing: -0.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Text(
                    //   "SATELLITE INTELLIGENCE",
                    //   style: GoogleFonts.lato(
                    //     fontSize: 9.5,
                    //     color: kPrimaryGreen.withOpacity(0.55),
                    //     fontWeight: FontWeight.w700,
                    //     letterSpacing: 2.0,
                    //   ),
                    // ),
                  ],
                ),
              ],
            ),

            const Spacer(),

            // ── Analysis button ──────────────────────────────────────────
            _NavButton(
              label: "Analysis",
              icon: Icons.analytics_rounded,
              isHovering: _isHovering[0],
              onHover: (v) => setState(() => _isHovering[0] = v),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const AnalysisPage()),
              ),
              isPrimary: false,
            ),

            const SizedBox(width: 14),

            // ── Effect button ────────────────────────────────────────────
            _NavButton(
              label: "Effect",
              icon: Icons.eco_rounded,
              isHovering: _isHovering[1],
              onHover: (v) => setState(() => _isHovering[1] = v),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const EnvironmentalImpactPage()),
              ),
              isPrimary: true,
            ),

            const SizedBox(width: 8),
          ],
        ),
      ),
    );
  }
}

class _NavButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool isHovering;
  final Function(bool) onHover;
  final VoidCallback onTap;
  final bool isPrimary;

  const _NavButton({
    required this.label,
    required this.icon,
    required this.isHovering,
    required this.onHover,
    required this.onTap,
    this.isPrimary = false,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => onHover(true),
      onExit: (_) => onHover(false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
          decoration: BoxDecoration(
            color: isPrimary
                ? (isHovering ? kDarkGreen : kPrimaryGreen)
                : (isHovering ? kPrimaryGreen.withOpacity(0.1) : Colors.white),
            borderRadius: BorderRadius.circular(34),
            border: Border.all(
              color: isPrimary
                  ? Colors.transparent
                  : (isHovering
                      ? kPrimaryGreen.withOpacity(0.6)
                      : kPrimaryGreen.withOpacity(0.3)),
              width: 1.8,
            ),
            boxShadow: [
              BoxShadow(
                color: kPrimaryGreen.withOpacity(isPrimary
                    ? (isHovering ? 0.45 : 0.25)
                    : (isHovering ? 0.12 : 0.06)),
                blurRadius: isHovering ? 20 : 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: 19,
                color: isPrimary
                    ? Colors.white
                    : (isHovering ? kPrimaryGreen : const Color(0xFF3A5C3E)),
              ),
              const SizedBox(width: 9),
              Text(
                label,
                style: GoogleFonts.lato(
                  fontSize: 16.5,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.2,
                  color: isPrimary
                      ? Colors.white
                      : (isHovering ? kPrimaryGreen : const Color(0xFF3A5C3E)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}