// // import 'package:flutter/material.dart';
// // //import 'package:flutter_web_example/helpers/style.dart';
// // //import 'package:flutter_web_example/widgets/button.dart';
// // import 'package:google_fonts/google_fonts.dart';
// // import 'package:major_project1/helpers/style.dart';
// // import 'package:major_project1/widgets/button.dart';

// // class NavBar extends StatefulWidget {
// //   @override
// //   _NavBarState createState() => _NavBarState();
// // }

// // class _NavBarState extends State<NavBar> {
// //     final List _isHovering = [
// //     false,
// //     false,
// //   ];

// //   @override
// //   Widget build(BuildContext context) {
// //     var screenSize = MediaQuery.of(context).size;

// //     return PreferredSize(
// //           preferredSize: Size(screenSize.width, 1000),
// //           child: Container(
// //             color: Colors.transparent,
// //             child: Padding(
// //               padding: EdgeInsets.all(20),
// //               child: Row(
// //                 crossAxisAlignment: CrossAxisAlignment.center,
// //                 children: [
// //                   SizedBox(width: 20,),
// //                   Image.asset("assets/images/logo.png"),
// //                   Expanded(
// //                     child: Row(
// //                       mainAxisAlignment: MainAxisAlignment.end,
// //                       children: [
// //                         SizedBox(width: screenSize.width / 8),
// //                         InkWell(
// //                           onHover: (value) {
// //                             setState(() {
// //                               value
// //                                   ? _isHovering[0] = true
// //                                   : _isHovering[0] = false;
// //                             });
// //                           },
// //                           hoverColor: Colors.transparent,
// //                           onTap: () {},
// //                           child: Column(
// //                             mainAxisSize: MainAxisSize.min,
// //                             children: [
// //                               SizedBox(
// //                                 height: 12,
// //                               ),
// //                               Text(
// //                                 'Analysis',
// //                                 style: GoogleFonts.roboto(
// //                                   fontSize: 16,
// //                                   fontWeight: FontWeight.bold,
// //                                   color: _isHovering[0] ? active : disable,
// //                                 ),
// //                               ),
// //                               SizedBox(height: 5),
// //                               Visibility(
// //                                 maintainAnimation: true,
// //                                 maintainState: true,
// //                                 maintainSize: true,
// //                                 visible: _isHovering[0],
// //                                 child: Container(
// //                                   decoration: BoxDecoration(
// //                                       color: active,
// //                                       borderRadius: BorderRadius.circular(20)),
// //                                   height: 7,
// //                                   width: 7,
// //                                 ),
// //                               )
// //                             ],
// //                           ),
// //                         ),
// //                         SizedBox(width: screenSize.width / 20),
// //                         InkWell(
// //                           onHover: (value) {
// //                             setState(() {
// //                               value
// //                                   ? _isHovering[1] = true
// //                                   : _isHovering[1] = false;
// //                             });
// //                           },
// //                           hoverColor: Colors.transparent,
// //                           onTap: () {},
// //                           child: Column(
// //                             mainAxisSize: MainAxisSize.min,
// //                             children: [
// //                               SizedBox(
// //                                 height: 12,
// //                               ),
// //                               Text(
// //                                 'Log In',
// //                                 style: GoogleFonts.roboto(
// //                                   fontSize: 16,
// //                                   fontWeight: FontWeight.bold,
// //                                   color: _isHovering[1] ? active : disable,
// //                                 ),
// //                               ),
// //                               SizedBox(height: 5),
// //                               Visibility(
// //                                 maintainAnimation: true,
// //                                 maintainState: true,
// //                                 maintainSize: true,
// //                                 visible: _isHovering[1],
// //                                 child: Container(
// //                                   decoration: BoxDecoration(
// //                                       color: active,
// //                                       borderRadius: BorderRadius.circular(20)),
// //                                   height: 7,
// //                                   width: 7,
// //                                 ),
// //                               )
// //                             ],
// //                           ),
// //                         ),
// //                         SizedBox(width: screenSize.width / 20),
// //                       ],
// //                     ),
// //                   ),
// //                   CustomButton(text: "Register",),
// //                   SizedBox(width: screenSize.width / 40),
// //                 ],
// //               ),
// //             ),
// //           ),
// //         );
// //   }
// // }



// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:major_project1/helpers/style.dart';
// import 'package:major_project1/widgets/button.dart';

// // 👉 Import the new page
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
//                         // 👉 Navigate to the new AnalysisPage
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
//                     InkWell(
//                       onHover: (value) {
//                         setState(() => _isHovering[1] = value);
//                       },
//                       hoverColor: Colors.transparent,
//                       onTap: () {},
//                       child: Column(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           const SizedBox(height: 12),
//                           Text(
//                             'Log In',
//                             style: GoogleFonts.roboto(
//                               fontSize: 16,
//                               fontWeight: FontWeight.bold,
//                               color: _isHovering[1] ? active : disable,
//                             ),
//                           ),
//                           const SizedBox(height: 5),
//                           Visibility(
//                             maintainAnimation: true,
//                             maintainState: true,
//                             maintainSize: true,
//                             visible: _isHovering[1],
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
//                   ],
//                 ),
//               ),
//                CustomButton(
//   text: "Effect",
//   onPressed: () {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (_) => const EnvironmentalImpactPage(),
//       ),
//     );
//   },
// ),
//               SizedBox(width: screenSize.width / 40),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }




import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project1/helpers/style.dart';
import 'package:major_project1/widgets/custom_button.dart';

// 👉 Import your pages
import 'package:major_project1/pages/analysis_page.dart';
import 'package:major_project1/pages/environmental_impact_page.dart';

class NavBar extends StatefulWidget {
  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  final List _isHovering = [false, false];

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return PreferredSize(
      preferredSize: Size(screenSize.width, 1000),
      child: Container(
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(width: 20),
              Image.asset("assets/images/logo.png"),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(width: screenSize.width / 8),

                    // ---------------- Analysis Button ----------------
                    InkWell(
                      onHover: (value) {
                        setState(() => _isHovering[0] = value);
                      },
                      hoverColor: Colors.transparent,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AnalysisPage(),
                          ),
                        );
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(height: 12),
                          Text(
                            'Analysis',
                            style: GoogleFonts.roboto(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: _isHovering[0] ? active : disable,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Visibility(
                            maintainAnimation: true,
                            maintainState: true,
                            maintainSize: true,
                            visible: _isHovering[0],
                            child: Container(
                              decoration: BoxDecoration(
                                color: active,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              height: 7,
                              width: 7,
                            ),
                          )
                        ],
                      ),
                    ),

                    SizedBox(width: screenSize.width / 20),

                    // ---------------- Log In Button ----------------
                    InkWell(
                      onHover: (value) {
                        setState(() => _isHovering[1] = value);
                      },
                      hoverColor: Colors.transparent,
                      onTap: () {},
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(height: 12),
                          Text(
                            'Log In',
                            style: GoogleFonts.roboto(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: _isHovering[1] ? active : disable,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Visibility(
                            maintainAnimation: true,
                            maintainState: true,
                            maintainSize: true,
                            visible: _isHovering[1],
                            child: Container(
                              decoration: BoxDecoration(
                                color: active,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              height: 7,
                              width: 7,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(width: screenSize.width / 20),
                  ],
                ),
              ),

              // ---------------- Effect Button ----------------
              CustomButton(
                text: "Effect",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const EnvironmentalImpactPage(),
                    ),
                  );
                },
              ),

              SizedBox(width: screenSize.width / 40),
            ],
          ),
        ),
      ),
    );
  }
}
