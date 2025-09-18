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

class _AnalysisPageState extends State<AnalysisPage> {
  XFile? _image;
  Uint8List? _imageBytes;
  bool _loading = false;
  final ImagePicker _picker = ImagePicker();

  // Class colors
  final Map<String, Color> colors = {
    "building": Colors.blue.withOpacity(0.5),
    "forest": Colors.purple.withOpacity(0.5),
  };

  Map<String, double> _classCoverage = {};

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

   
      final uri = Uri.parse("$endpoint?api_key=$apiKey&format=json&confidence=0");
      final req = http.MultipartRequest('POST', uri);
      req.files.add(http.MultipartFile.fromBytes('file', bytes, filename: 'image.jpg'));
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
          double x = p["x"];
          double y = p["y"];
          double w = p["width"];
          double h = p["height"];

          double boxArea = w * h;
          classAreas[cls] = (classAreas[cls] ?? 0) + boxArea;
        }

        // Compute % coverage
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Analysis")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: _loading ? null : _pickAndAnalyze,
              child: const Text("Pick Image & Analyze"),
            ),
            const SizedBox(height: 20),
            if (_loading) const CircularProgressIndicator(),
            const SizedBox(height: 20),
            if (_imageBytes != null)
              Expanded(
                child: Stack(
                  children: [
                    InteractiveViewer(
                      child: Image.memory(_imageBytes!, fit: BoxFit.contain),
                    ),
                    
                    ..._classCoverage.entries.map((e) {
                      return Positioned(
                        left: 10,
                        top: 10 + 20.0 * _classCoverage.keys.toList().indexOf(e.key),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 6, vertical: 2),
                          color: colors[e.key] ?? Colors.grey.withOpacity(0.5),
                          child: Text(
                            "${e.key}: ${e.value.toStringAsFixed(2)}%",
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      );
                    }).toList(),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
