
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:get/get.dart';
// import 'package:major_project1/pages/home.dart';
// import 'package:major_project1/helpers/style.dart';

// class LoginPage extends StatelessWidget {
//   LoginPage({Key? key}) : super(key: key);

//   final _formKey = GlobalKey<FormState>();
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Container(
//           constraints: BoxConstraints(maxWidth: 1440),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Expanded(
//                 child: Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 40),
//                   child: Form(
//                     key: _formKey,
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "Welcome Back",
//                           style: GoogleFonts.roboto(
//                             color: active,
//                             fontSize: 14,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         SizedBox(height: 15),
//                         RichText(
//                           text: TextSpan(
//                             children: [
//                               TextSpan(text: "Login to "),
//                               TextSpan(
//                                 text: "Satellite-Based ",
//                                 style: GoogleFonts.roboto(color: active),
//                               ),
//                               TextSpan(text: "Human Settlement"),
//                             ],
//                             style: GoogleFonts.roboto(
//                               fontSize: 38,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                         SizedBox(height: 20),
//                         TextFormField(
//                           controller: _emailController,
//                           decoration: InputDecoration(
//                             hintText: "Email",
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                           ),
//                           validator: (value) {
//                             if (value == null ||
//                                 value.isEmpty ||
//                                 !RegExp(r"^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$")
//                                     .hasMatch(value)) {
//                               return "Enter a valid email";
//                             }
//                             return null;
//                           },
//                         ),
//                         SizedBox(height: 15),
//                         TextFormField(
//                           controller: _passwordController,
//                           obscureText: true,
//                           decoration: InputDecoration(
//                             hintText: "Password",
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                           ),
//                           validator: (value) {
//                             if (value == null || value.length < 6) {
//                               return "Password must be at least 6 characters";
//                             }
//                             return null;
//                           },
//                         ),
//                         SizedBox(height: 15),
//                         ElevatedButton(
//                           onPressed: () {
//                             if (_formKey.currentState!.validate()) {
//                               Get.off(() => HomePage());
//                             }
//                           },
//                           child: Text("Login"),
//                           style: ElevatedButton.styleFrom(
//                             padding: EdgeInsets.symmetric(
//                                 vertical: 12, horizontal: 50),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               Expanded(
//                 child: Center(
//                   child: Image.asset(
//                     "assets/images/img.png",
//                     fit: BoxFit.contain,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
