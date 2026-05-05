// import 'dart:convert';
// import 'dart:typed_data';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:http/http.dart' as http;

// class EnvironmentalImpactPage extends StatefulWidget {
//   const EnvironmentalImpactPage({Key? key}) : super(key: key);

//   @override
//   State<EnvironmentalImpactPage> createState() =>
//       _EnvironmentalImpactPageState();
// }

// class _EnvironmentalImpactPageState extends State<EnvironmentalImpactPage> {
//   final ImagePicker _picker = ImagePicker();
//   Uint8List? _imageBytes;
//   bool _loading = false;

//   Map<String, double> _ratios = {}; 
//   String _status = "";

//   Future<void> _pickAndAnalyze() async {
//   final XFile? picked = await _picker.pickImage(source: ImageSource.gallery);
//   if (picked == null) return;

//   setState(() {
//     _imageBytes = null;
//     _loading = true;
//     _ratios.clear();
//     _status = "";
//   });

//   try {
//     final bytes = await picked.readAsBytes();
//     setState(() => _imageBytes = bytes);

//     const apiKey = "PMbRJpHoXPb88qiFWJxl";
//     const model = "detection-xdxfj/1";

//     final uri = Uri.parse(
//       "https://detect.roboflow.com/$model?api_key=$apiKey&confidence=0.3",
//     );

//     final req = http.MultipartRequest('POST', uri);

//     req.files.add(
//       http.MultipartFile.fromBytes(
//         'file',
//         bytes,
//         filename: 'image.jpg',
//       ),
//     );

//     final streamed = await req.send();
//     final response = await http.Response.fromStream(streamed);

//     print("STATUS: ${response.statusCode}");
//     print("BODY: ${response.body}");

//     if (response.statusCode == 200) {
//       final data = jsonDecode(response.body);

//       List predictions = data["predictions"] ?? [];

//       if (predictions.isEmpty) {
//         setState(() {
//           _status = "No objects detected ❌";
//         });
//         return;
//       }

//       double totalArea = 0;
//       Map<String, double> classAreas = {};

//       for (var p in predictions) {
//         String cls = p["class"].toString().toLowerCase();

//         double w = (p["width"] ?? 0).toDouble();
//         double h = (p["height"] ?? 0).toDouble();

//         double area = w * h;

//         totalArea += area;
//         classAreas[cls] = (classAreas[cls] ?? 0) + area;
//       }

//       Map<String, double> ratios = {};
//       if (totalArea > 0) {
//         classAreas.forEach((cls, area) {
//           ratios[cls] = (area / totalArea) * 100;
//         });
//       }

//       // 🔥 Flexible mapping (no breakage)
//                       double buildingRatio =
//               ratios['building'] ?? ratios['house'] ?? ratios['structure'] ?? 0.0;

//           double treeRatio =
//               ratios['tree'] ?? ratios['vegetation'] ?? ratios['forest'] ?? 0.0;

//           // 🔥 DEBUG (important once)
//           print("Building: $buildingRatio");
//           print("Tree: $treeRatio");

//           String status;

//           if (buildingRatio == 0 && treeRatio == 0) {
//             status = "No data detected ❌";
//           }
//           else if (treeRatio >= 60) {
//             status = "Healthy: Green dominant 🌿";
//           }
//           else if (buildingRatio >= 50) {
//             status = "Danger: Over construction 🚨";
//           }
//           else if (treeRatio >= 30 && buildingRatio <= 40) {
//             status = "Safe: Balanced ⚠️";
//           }
//           else {
//             status = "Unbalanced region ⚠️";
//           }   
//       setState(() {
//         _ratios = ratios;
//         _status = status;
//       });
//     } else {
//       throw Exception("API Error ${response.statusCode}");
//     }
//   } catch (e) {
//     print("ERROR: $e");
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text("Failed: $e")),
//     );
//   } finally {
//     setState(() => _loading = false);
//   }
// }


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Environmental Impact")),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             ElevatedButton(
//               onPressed: _loading ? null : _pickAndAnalyze,
//               child: const Text("Pick Image & Analyze"),
//             ),
//             const SizedBox(height: 20),
//             if (_loading) const Center(child: CircularProgressIndicator()),
//             if (_imageBytes != null)
//               Center(
//                 child: Image.memory(
//                   _imageBytes!,
//                   width: 300,
//                   height: 200,
//                   fit: BoxFit.contain,
//                 ),
//               ),
//             const SizedBox(height: 20),
//             if (_ratios.isNotEmpty) ...[
//               const Text(
//                 "Area Coverage (%)",
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 10),

              
//               if (_ratios.containsKey("building"))
//                 Text(
//                   "Building: ${_ratios["building"]!.toStringAsFixed(2)}%",
//                   style: const TextStyle(fontSize: 16),
//                 ),
//               if (_ratios.containsKey("tree"))
//                 Text(
//                   "Tree: ${_ratios["tree"]!.toStringAsFixed(2)}%",
//                   style: const TextStyle(fontSize: 16),
//                 ),

//               const SizedBox(height: 20),
//               const Text(
//                 "Environment Status:",
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               Text(
//                 _status,
//                 style: TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                   color: _status.contains("Danger")
//                       ? Colors.red
//                       : _status.contains("Safe")
//                           ? Colors.orange
//                           : Colors.green,
//                 ),
//               ),
//               const SizedBox(height: 20),
//               const Text(
//                 "Facts & Recommendations:",
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 8),
//               const Text(
//                 "- Excessive construction reduces natural areas and harms biodiversity.\n"
//                 "- Maintaining greenery, lakes, and forest cover ensures sustainable living.\n"
//                 "- Aim for natural areas to cover at least 40-50% of the land.\n"
//                 "- Visualizing area coverage helps plan urban expansion responsibly.",
//                 style: TextStyle(fontSize: 16),
//               ),
//             ],
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class EnvironmentalImpactPage extends StatefulWidget {
  const EnvironmentalImpactPage({Key? key}) : super(key: key);

  @override
  State<EnvironmentalImpactPage> createState() =>
      _EnvironmentalImpactPageState();
}

class _EnvironmentalImpactPageState extends State<EnvironmentalImpactPage>
    with SingleTickerProviderStateMixin {
  final ImagePicker _picker = ImagePicker();
  Uint8List? _imageBytes;
  bool _loading = false;

  String _status = "";
  String _statusLevel = ""; // "healthy" | "balanced" | "danger" | "critical"
  List<String> _recommendations = [];
  Map<String, double> _classCoverage = {};

  late AnimationController _pulseController;
  late Animation<double> _pulseAnimation;

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

  /// More accurate environmental impact score using weighted formula
  Map<String, dynamic> _calculateImpact(Map<String, double> ratios) {
    // Normalize ratios relative to detected objects only
    double buildingRatio = ratios['building'] ?? ratios['house'] ?? ratios['structure'] ?? 0.0;
    double treeRatio = ratios['tree'] ?? ratios['vegetation'] ?? ratios['forest'] ?? 0.0;
    double roadRatio = ratios['road'] ?? ratios['street'] ?? 0.0;
    double waterRatio = ratios['water'] ?? ratios['lake'] ?? ratios['river'] ?? 0.0;

    // Green score: trees + water contribute positively
    double greenScore = treeRatio + (waterRatio * 0.5);
    // Urban pressure: buildings + roads contribute negatively
    double urbanScore = buildingRatio + (roadRatio * 0.7);

    String status;
    String level;
    List<String> recs;

    if (treeRatio == 0 && buildingRatio == 0) {
      status = "No detectable land features";
      level = "unknown";
      recs = [
        "Try uploading a clearer satellite/aerial image.",
        "Ensure the image shows land features like buildings, roads, or vegetation.",
        "Use images with at least 300×300 resolution for best detection.",
      ];
    } else if (greenScore >= 60) {
      status = "Excellent — Healthy Green Cover 🌿";
      level = "healthy";
      recs = [
        "This region has outstanding green coverage. Protect forested areas from encroachment.",
        "Continue conserving biodiversity corridors and wildlife habitats.",
        "Implement buffer zones around dense vegetation to prevent urban sprawl.",
        "Encourage eco-tourism as a sustainable alternative to development.",
      ];
    } else if (greenScore >= 35 && urbanScore <= 40) {
      status = "Good — Balanced Ecosystem ✅";
      level = "balanced";
      recs = [
        "Maintain current green-to-urban balance — it's close to ideal.",
        "Introduce urban greening: rooftop gardens, tree-lined streets, mini forests.",
        "Set a goal: at least 40% natural cover within the next 5 years.",
        "Regulate new construction permits to protect remaining vegetation.",
      ];
    } else if (urbanScore >= 50 && greenScore < 35) {
      status = "Warning — Urban Pressure Detected 🚨";
      level = "danger";
      recs = [
        "Halt unplanned construction — vegetation cover is critically low.",
        "Plant at least 5 trees for every new structure built in this area.",
        "Restore degraded land with native plant species to revive biodiversity.",
        "Develop green corridors connecting fragmented patches of vegetation.",
        "Introduce stormwater management systems to prevent urban flooding.",
      ];
    } else if (urbanScore >= 70) {
      status = "Critical — Severe Environmental Degradation 🔴";
      level = "critical";
      recs = [
        "URGENT: This region shows extreme urbanization with minimal natural cover.",
        "Immediately impose a moratorium on further construction.",
        "Launch large-scale afforestation programs — at least 10,000 trees needed.",
        "Restore wetlands and natural water bodies to counter urban heat islands.",
        "Implement mandatory green space ratios in all future urban planning.",
        "Engage local government and NGOs for environmental rehabilitation.",
      ];
    } else {
      status = "Moderate — Unbalanced Land Use ⚠️";
      level = "warning";
      recs = [
        "Land use is unbalanced — urban and green areas need better ratio.",
        "Promote vertical gardens and green rooftops in densely built areas.",
        "Protect remaining tree cover from being cleared for roads or buildings.",
        "Encourage community-level composting and urban farming initiatives.",
        "Map and monitor green cover changes every 6 months via satellite imaging.",
      ];
    }

    return {
      "status": status,
      "level": level,
      "recommendations": recs,
      "greenScore": greenScore,
      "urbanScore": urbanScore,
    };
  }

  Future<void> _pickAndAnalyze() async {
    final XFile? picked = await _picker.pickImage(source: ImageSource.gallery);
    if (picked == null) return;

    setState(() {
      _imageBytes = null;
      _loading = true;
      _status = "";
      _statusLevel = "";
      _recommendations = [];
      _classCoverage.clear();
    });

    try {
      final bytes = await picked.readAsBytes();
      setState(() => _imageBytes = bytes);

      const apiKey = "PMbRJpHoXPb88qiFWJxl";
      const model = "detection-xdxfj/1";

      final uri = Uri.parse(
        "https://detect.roboflow.com/$model?api_key=$apiKey&confidence=0.3",
      );

      final req = http.MultipartRequest('POST', uri);
      req.files.add(http.MultipartFile.fromBytes('file', bytes, filename: 'image.jpg'));

      final streamed = await req.send();
      final response = await http.Response.fromStream(streamed);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        List predictions = data["predictions"] ?? [];

        // Get image dimensions for real area coverage
        ui.Codec codec = await ui.instantiateImageCodec(bytes);
        ui.FrameInfo fi = await codec.getNextFrame();
        ui.Image image = fi.image;
        double totalImageArea = image.width * image.height.toDouble();

        Map<String, double> classAreas = {};

        for (var p in predictions) {
          String cls = p["class"].toString().toLowerCase();
          double w = (p["width"] ?? 0).toDouble();
          double h = (p["height"] ?? 0).toDouble();
          classAreas[cls] = (classAreas[cls] ?? 0) + (w * h);
        }

        // Coverage relative to image area (more accurate)
        Map<String, double> coverage = {};
        classAreas.forEach((cls, area) {
          coverage[cls] = (area / totalImageArea) * 100;
        });

        final impact = _calculateImpact(coverage);

        setState(() {
          _classCoverage = coverage;
          _status = impact["status"];
          _statusLevel = impact["level"];
          _recommendations = List<String>.from(impact["recommendations"]);
        });
      } else {
        throw Exception("API Error ${response.statusCode}");
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed: $e")),
      );
    } finally {
      setState(() => _loading = false);
    }
  }

  Color get _statusColor {
    switch (_statusLevel) {
      case "healthy": return const Color(0xFF2E7D32);
      case "balanced": return const Color(0xFF388E3C);
      case "warning": return const Color(0xFFF57F17);
      case "danger": return const Color(0xFFE65100);
      case "critical": return const Color(0xFFC62828);
      default: return Colors.grey;
    }
  }

  IconData get _statusIcon {
    switch (_statusLevel) {
      case "healthy": return Icons.eco_rounded;
      case "balanced": return Icons.check_circle_rounded;
      case "warning": return Icons.warning_amber_rounded;
      case "danger": return Icons.dangerous_rounded;
      case "critical": return Icons.crisis_alert_rounded;
      default: return Icons.help_outline_rounded;
    }
  }

  Color get _recCardColor {
    switch (_statusLevel) {
      case "healthy": return const Color(0xFFE8F5E9);
      case "balanced": return const Color(0xFFF1F8E9);
      case "warning": return const Color(0xFFFFF8E1);
      case "danger": return const Color(0xFFFFF3E0);
      case "critical": return const Color(0xFFFFEBEE);
      default: return const Color(0xFFECEFF1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8F5E9),
      appBar: AppBar(
        backgroundColor: const Color(0xFF2E7D32),
        elevation: 0,
        title: const Text(
          "Environmental Impact",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.4,
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // ─── Header card ───────────────────────────────────────────────
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.green.withOpacity(0.12),
                    blurRadius: 16,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  const Icon(Icons.nature_people_rounded,
                      size: 46, color: Color(0xFF2E7D32)),
                  const SizedBox(height: 10),
                  const Text(
                    "Land Health Analyzer",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1B5E20),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "Upload a satellite or aerial image to assess environmental health and get recommendations.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 13.5,
                      color: Colors.grey[600],
                      height: 1.45,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // ─── Button ─────────────────────────────────────────────────────
            _loading
                ? Column(
                    children: [
                      const CircularProgressIndicator(
                        color: Color(0xFF2E7D32),
                        strokeWidth: 3.5,
                      ),
                      const SizedBox(height: 14),
                      Text(
                        "Analyzing environment...",
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  )
                : ScaleTransition(
                    scale: _imageBytes == null
                        ? _pulseAnimation
                        : const AlwaysStoppedAnimation(1.0),
                    child: SizedBox(
                      width: 250,
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

            // ─── Image ──────────────────────────────────────────────────────
            if (_imageBytes != null) ...[
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.green.withOpacity(0.18),
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

              const SizedBox(height: 26),

              // ─── Environmental Status Card ───────────────────────────────
              if (_status.isNotEmpty)
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: _statusColor.withOpacity(0.08),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: _statusColor.withOpacity(0.4),
                      width: 2,
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 56,
                        height: 56,
                        decoration: BoxDecoration(
                          color: _statusColor.withOpacity(0.15),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(_statusIcon,
                            color: _statusColor, size: 30),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Environmental Status",
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey[600],
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              _status,
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w800,
                                color: _statusColor,
                                height: 1.3,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

              const SizedBox(height: 20),

              // ─── Recommendations ─────────────────────────────────────────
              if (_recommendations.isNotEmpty) ...[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Icon(Icons.lightbulb_rounded,
                          color: _statusColor, size: 22),
                      const SizedBox(width: 8),
                      Text(
                        "Facts & Recommendations",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          color: const Color(0xFF1B5E20),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                ..._recommendations.asMap().entries.map((entry) {
                  final int i = entry.key;
                  final String rec = entry.value;
                  return Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 14),
                    decoration: BoxDecoration(
                      color: _recCardColor,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: _statusColor.withOpacity(0.2),
                        width: 1,
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 28,
                          height: 28,
                          margin: const EdgeInsets.only(top: 1),
                          decoration: BoxDecoration(
                            color: _statusColor.withOpacity(0.15),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(
                              "${i + 1}",
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: _statusColor,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            rec,
                            style: TextStyle(
                              fontSize: 14.5,
                              color: Colors.grey[800],
                              height: 1.5,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ],
            ],

            // ─── Empty state ────────────────────────────────────────────────
            if (_imageBytes == null && !_loading) ...[
              const SizedBox(height: 40),
              Icon(Icons.landscape_rounded,
                  size: 84, color: Colors.green.withOpacity(0.22)),
              const SizedBox(height: 14),
              Text(
                "No image selected yet",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[500],
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                "Upload a satellite image to begin analysis",
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey[400],
                ),
              ),
            ],

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
