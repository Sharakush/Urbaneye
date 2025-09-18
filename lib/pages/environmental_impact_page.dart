import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class EnvironmentalImpactPage extends StatefulWidget {
  const EnvironmentalImpactPage({Key? key}) : super(key: key);

  @override
  State<EnvironmentalImpactPage> createState() =>
      _EnvironmentalImpactPageState();
}

class _EnvironmentalImpactPageState extends State<EnvironmentalImpactPage> {
  final ImagePicker _picker = ImagePicker();
  Uint8List? _imageBytes;
  bool _loading = false;

  Map<String, double> _ratios = {}; 
  String _status = "";

  Future<void> _pickAndAnalyze() async {
    final XFile? picked = await _picker.pickImage(source: ImageSource.gallery);
    if (picked == null) return;

    setState(() {
      _imageBytes = null;
      _loading = true;
      _ratios.clear();
      _status = "";
    });

    try {
      final bytes = await picked.readAsBytes();
      setState(() => _imageBytes = bytes);

      const apiKey = "2v5ufBDpkaKcS3FisPB2"; 
      const endpoint = "https://detect.roboflow.com/detection-xdxfj/1";

      final uri =
          Uri.parse("$endpoint?api_key=$apiKey&format=json&confidence=0");
      final req = http.MultipartRequest('POST', uri);
      req.files.add(http.MultipartFile.fromBytes('file', bytes,
          filename: 'image.jpg'));
      final streamed = await req.send();
      final response = await http.Response.fromStream(streamed);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        List predictions = data["predictions"];

       
        double totalArea = 0;
        Map<String, double> classAreas = {};

        for (var p in predictions) {
          String cls = p["class"];

        
          if (cls.toLowerCase() == "road") continue;

          double w = p["width"];
          double h = p["height"];
          totalArea += w * h;
          classAreas[cls] = (classAreas[cls] ?? 0) + (w * h);
        }

        Map<String, double> ratios = {};
        if (totalArea > 0) {
          classAreas.forEach((cls, area) {
            ratios[cls] = (area / totalArea) * 100;
          });
        }

        double buildingRatio = ratios['building'] ?? 0.0;
        double treeRatio = ratios['tree'] ?? 0.0;

        String status;
        if (ratios.isEmpty) {
          status = "No building/tree detected ❌";
        } else if (buildingRatio <= 40 && treeRatio >= 30) {
          status = "Healthy: Good natural balance 🌿";
        } else if (buildingRatio > 60 && treeRatio < 20) {
          status = "Danger: Requires immediate improvement 🚨";
        } else {
          status = "Safe: Moderate balance ⚠️";
        }

        setState(() {
          _ratios = ratios;
          _status = status;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Environmental Impact")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: _loading ? null : _pickAndAnalyze,
              child: const Text("Pick Image & Analyze"),
            ),
            const SizedBox(height: 20),
            if (_loading) const Center(child: CircularProgressIndicator()),
            if (_imageBytes != null)
              Center(
                child: Image.memory(
                  _imageBytes!,
                  width: 300,
                  height: 200,
                  fit: BoxFit.contain,
                ),
              ),
            const SizedBox(height: 20),
            if (_ratios.isNotEmpty) ...[
              const Text(
                "Area Coverage (%)",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),

              
              if (_ratios.containsKey("building"))
                Text(
                  "Building: ${_ratios["building"]!.toStringAsFixed(2)}%",
                  style: const TextStyle(fontSize: 16),
                ),
              if (_ratios.containsKey("tree"))
                Text(
                  "Tree: ${_ratios["tree"]!.toStringAsFixed(2)}%",
                  style: const TextStyle(fontSize: 16),
                ),

              const SizedBox(height: 20),
              const Text(
                "Environment Status:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                _status,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: _status.contains("Danger")
                      ? Colors.red
                      : _status.contains("Safe")
                          ? Colors.orange
                          : Colors.green,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Facts & Recommendations:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                "- Excessive construction reduces natural areas and harms biodiversity.\n"
                "- Maintaining greenery, lakes, and forest cover ensures sustainable living.\n"
                "- Aim for natural areas to cover at least 40-50% of the land.\n"
                "- Visualizing area coverage helps plan urban expansion responsibly.",
                style: TextStyle(fontSize: 16),
              ),
            ],
          ],
        ),
      ),
    );
  }
}



