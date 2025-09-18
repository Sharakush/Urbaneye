// import 'package:flutter/material.dart';
// import 'package:flutter_web_example/helpers/style.dart';
// //import 'package:major_project1/helpers/style.dart';

// class MobileMenu extends StatelessWidget {
//   const MobileMenu({ Key key }) : super(key: key);

//  @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: Container(
//         color: active,
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [

//               InkWell(
//                 onTap: () {},
//                 child: Text(
//                   'Pricing',
//                   style: TextStyle(color: Colors.white, fontSize: 22),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
//                 child: Divider(
//                 ),
//               ),
//               InkWell(
//                 onTap: () {},
//                 child: Text(
//                   'Login',
//                   style: TextStyle(color: Colors.white, fontSize: 22),
//                 ),
//               ),
//               Expanded(
//                 child: Align(
//                   alignment: Alignment.bottomCenter,
//                   child: Text(
//                     'Copyright © 2020 | Santos Enoque',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 14,
//                     ),
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
// Make sure the correct style.dart file is imported based on your project structure
import 'package:major_project1/helpers/style.dart'; // Corrected import for your active color

class MobileMenu extends StatelessWidget {
  const MobileMenu({Key? key}) : super(key: key); // Key? for null safety

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: active, // Use the active color from style.dart
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Pricing Menu Item
              InkWell(
                onTap: () {},
                child: Text(
                  'Pricing',
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                child: Divider(),
              ),
              // Login Menu Item
              InkWell(
                onTap: () {},
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
              ),
              // Copyright Text at the bottom
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    'Copyright © 2020 | Santos Enoque',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
