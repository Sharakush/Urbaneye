// import 'dart:typed_data';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'dart:ui' as ui;

// class AnalysisPage extends StatefulWidget {
//   const AnalysisPage({Key? key}) : super(key: key);

//   @override
//   State<AnalysisPage> createState() => _AnalysisPageState();
// }

// class _AnalysisPageState extends State<AnalysisPage> {
//   XFile? _image;
//   Uint8List? _imageBytes;
//   bool _loading = false;
//   final ImagePicker _picker = ImagePicker();

//   // Class colors
//   final Map<String, Color> colors = {
//     "building": Colors.blue.withOpacity(0.5),
//     "forest": Colors.purple.withOpacity(0.5),
//   };

//   Map<String, double> _classCoverage = {};

//   Future<void> _pickAndAnalyze() async {
//     final XFile? picked = await _picker.pickImage(source: ImageSource.gallery);
//     if (picked == null) return;

//     setState(() {
//       _image = picked;
//       _imageBytes = null;
//       _loading = true;
//       _classCoverage.clear();
//     });

//     try {
//       final bytes = await picked.readAsBytes();
//       setState(() => _imageBytes = bytes);

//       const apiKey = "2v5ufBDpkaKcS3FisPB2";
//       const endpoint = "https://detect.roboflow.com/detection-xdxfj/1";

   
//       final uri = Uri.parse("$endpoint?api_key=$apiKey&format=json&confidence=0");
//       final req = http.MultipartRequest('POST', uri);
//       req.files.add(http.MultipartFile.fromBytes('file', bytes, filename: 'image.jpg'));
//       final streamed = await req.send();
//       final response = await http.Response.fromStream(streamed);

//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);
//         List predictions = data["predictions"];

       
//         ui.Codec codec = await ui.instantiateImageCodec(bytes);
//         ui.FrameInfo fi = await codec.getNextFrame();
//         ui.Image image = fi.image;
//         int width = image.width;
//         int height = image.height;

//         double totalArea = width * height.toDouble();
//         Map<String, double> classAreas = {};

        
//         for (var p in predictions) {
//           String cls = p["class"];
//           double x = p["x"];
//           double y = p["y"];
//           double w = p["width"];
//           double h = p["height"];

//           double boxArea = w * h;
//           classAreas[cls] = (classAreas[cls] ?? 0) + boxArea;
//         }

//         // Compute % coverage
//         Map<String, double> coverage = {};
//         classAreas.forEach((cls, area) {
//           coverage[cls] = (area / totalArea) * 100;
//         });
//         setState(() => _classCoverage = coverage);
//       } else {
//         throw Exception("API error: ${response.statusCode}");
//       }
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text("Failed: $e")));
//     } finally {
//       setState(() => _loading = false);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Analysis")),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           children: [
//             ElevatedButton(
//               onPressed: _loading ? null : _pickAndAnalyze,
//               child: const Text("Pick Image & Analyze"),
//             ),
//             const SizedBox(height: 20),
//             if (_loading) const CircularProgressIndicator(),
//             const SizedBox(height: 20),
//             if (_imageBytes != null)
//               Expanded(
//                 child: Stack(
//                   children: [
//                     InteractiveViewer(
//                       child: Image.memory(_imageBytes!, fit: BoxFit.contain),
//                     ),
                    
//                     ..._classCoverage.entries.map((e) {
//                       return Positioned(
//                         left: 10,
//                         top: 10 + 20.0 * _classCoverage.keys.toList().indexOf(e.key),
//                         child: Container(
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 6, vertical: 2),
//                           color: colors[e.key] ?? Colors.grey.withOpacity(0.5),
//                           child: Text(
//                             "${e.key}: ${e.value.toStringAsFixed(2)}%",
//                             style: const TextStyle(
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                         ),
//                       );
//                     }).toList(),
//                   ],
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:ui' as ui;

class AnalysisPage extends StatefulWidget {
  const AnalysisPage({Key? key}) : super(key: key);

  @override
  State<AnalysisPage> createState() => _AnalysisPageState();
}

class _AnalysisPageState extends State<AnalysisPage>
    with SingleTickerProviderStateMixin {
  XFile? _image;
  Uint8List? _imageBytes;
  bool _loading = false;
  final ImagePicker _picker = ImagePicker();
  late AnimationController _pulseController;
  late Animation<double> _pulseAnimation;

  // Class colors
  final Map<String, Color> colors = {
    "building": const Color(0xFF2E7D32).withOpacity(0.85),
    "forest": const Color(0xFF1B5E20).withOpacity(0.85),
    "road": const Color(0xFF795548).withOpacity(0.85),
    "tree": const Color(0xFF388E3C).withOpacity(0.85),
  };

  // Class icons
  final Map<String, IconData> classIcons = {
    "building": Icons.apartment_rounded,
    "forest": Icons.forest_rounded,
    "road": Icons.add_road_rounded,
    "tree": Icons.park_rounded,
  };

  Map<String, double> _classCoverage = {};

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat(reverse: true);
    _pulseAnimation = Tween<double>(begin: 1.0, end: 1.06).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  Future<void> _pickAndAnalyze() async {
    final XFile? picked = await _picker.pickImage(source: ImageSource.gallery);
    if (picked == null) return;

    setState(() {
      _image = picked;
      _imageBytes = null;
      _loading = true;
      _classCoverage.clear();
    });

    try {
      final bytes = await picked.readAsBytes();
      setState(() => _imageBytes = bytes);

      const apiKey = "2v5ufBDpkaKcS3FisPB2";
      const endpoint = "https://detect.roboflow.com/detection-xdxfj/1";

      final uri =
          Uri.parse("$endpoint?api_key=$apiKey&format=json&confidence=0");
      final req = http.MultipartRequest('POST', uri);
      req.files.add(
          http.MultipartFile.fromBytes('file', bytes, filename: 'image.jpg'));
      final streamed = await req.send();
      final response = await http.Response.fromStream(streamed);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        List predictions = data["predictions"];

        ui.Codec codec = await ui.instantiateImageCodec(bytes);
        ui.FrameInfo fi = await codec.getNextFrame();
        ui.Image image = fi.image;
        int width = image.width;
        int height = image.height;

        double totalArea = width * height.toDouble();
        Map<String, double> classAreas = {};

        for (var p in predictions) {
          String cls = p["class"];
          double w = p["width"];
          double h = p["height"];
          double boxArea = w * h;
          classAreas[cls] = (classAreas[cls] ?? 0) + boxArea;
        }

        Map<String, double> coverage = {};
        classAreas.forEach((cls, area) {
          coverage[cls] = (area / totalArea) * 100;
        });
        setState(() => _classCoverage = coverage);
      } else {
        throw Exception("API error: ${response.statusCode}");
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed: $e")));
    } finally {
      setState(() => _loading = false);
    }
  }

  Color _getColorForClass(String cls) {
    return colors[cls.toLowerCase()] ?? const Color(0xFF558B2F).withOpacity(0.85);
  }

  IconData _getIconForClass(String cls) {
    return classIcons[cls.toLowerCase()] ?? Icons.layers_rounded;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8F5E9), // light green background
      appBar: AppBar(
        backgroundColor: const Color(0xFF2E7D32),
        elevation: 0,
        title: const Text(
          "Land Analysis",
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.5,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Header card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.green.withOpacity(0.15),
                      blurRadius: 16,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    const Icon(Icons.satellite_alt_rounded,
                        size: 44, color: Color(0xFF2E7D32)),
                    const SizedBox(height: 10),
                    const Text(
                      "Satellite Image Analyzer",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1B5E20),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      "Upload a satellite image to detect buildings, roads, trees & more",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 13.5,
                        color: Colors.grey[600],
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 32),

              // Big centered button
              _loading
                  ? Column(
                      children: [
                        const CircularProgressIndicator(
                          color: Color(0xFF2E7D32),
                          strokeWidth: 3.5,
                        ),
                        const SizedBox(height: 14),
                        Text(
                          "Analyzing image...",
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    )
                  : ScaleTransition(
                      scale: _imageBytes == null ? _pulseAnimation : const AlwaysStoppedAnimation(1.0),
                      child: SizedBox(
                        width: 240,
                        height: 62,
                        child: ElevatedButton.icon(
                          onPressed: _pickAndAnalyze,
                          icon: const Icon(Icons.add_photo_alternate_rounded,
                              size: 26, color: Colors.white),
                          label: Text(
                            _imageBytes == null
                                ? "Pick Image & Analyze"
                                : "Change Image",
                            style: const TextStyle(
                              fontSize: 16.5,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                              letterSpacing: 0.3,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF2E7D32),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                            elevation: 6,
                            shadowColor: Colors.green.withOpacity(0.4),
                          ),
                        ),
                      ),
                    ),

              const SizedBox(height: 28),

              // Image display
              if (_imageBytes != null) ...[
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.green.withOpacity(0.2),
                          blurRadius: 20,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    child: InteractiveViewer(
                      child: Image.memory(
                        _imageBytes!,
                        fit: BoxFit.cover,
                        width: 300,
                        height: 160,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                // Prediction results
                if (_classCoverage.isNotEmpty) ...[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Detection Results",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: const Color(0xFF1B5E20),
                        letterSpacing: 0.3,
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),
                  ..._classCoverage.entries.map((e) {
                    final Color cardColor = _getColorForClass(e.key);
                    final IconData icon = _getIconForClass(e.key);
                    final double pct = e.value;

                    return Container(
                      margin: const EdgeInsets.only(bottom: 14),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.green.withOpacity(0.1),
                            blurRadius: 12,
                            offset: const Offset(0, 3),
                          ),
                        ],
                        border: Border.all(
                          color: cardColor.withOpacity(0.5),
                          width: 1.5,
                        ),
                      ),
                      child: Row(
                        children: [
                          // Icon circle
                          Container(
                            width: 52,
                            height: 52,
                            decoration: BoxDecoration(
                              color: cardColor.withOpacity(0.15),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(icon,
                                color: cardColor.withOpacity(1),
                                size: 26),
                          ),
                          const SizedBox(width: 16),
                          // Label & bar
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  e.key[0].toUpperCase() +
                                      e.key.substring(1),
                                  style: const TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFF1B5E20),
                                  ),
                                ),
                                const SizedBox(height: 6),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: LinearProgressIndicator(
                                    value: (pct / 100).clamp(0.0, 1.0),
                                    minHeight: 8,
                                    backgroundColor:
                                        Colors.grey.withOpacity(0.15),
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        cardColor),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 16),
                          // Percentage
                          Text(
                            "${pct.toStringAsFixed(1)}%",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w900,
                              color: cardColor.withOpacity(1),
                              letterSpacing: -0.5,
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ],
              ],

              // Empty state hint
              if (_imageBytes == null && !_loading) ...[
                const SizedBox(height: 40),
                Icon(Icons.image_search_rounded,
                    size: 80, color: Colors.green.withOpacity(0.25)),
                const SizedBox(height: 14),
                Text(
                  "No image selected yet",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[500],
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}