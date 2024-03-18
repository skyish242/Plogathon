import 'package:http/http.dart' as http;
import 'dart:convert';

class ImageClassifier {
  static const String BASE_URL = 'http://34.73.225.113:5000';

  Future<ClassificationResponse?> classify(String image) async {
    final Uri uri = Uri.parse("$BASE_URL/classify");

    final response = await http.post(
      uri,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({'image': image}),
    );

    if (response.statusCode == 200) {
      return ClassificationResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
    }
    return null;
  }
}

class ClassificationResponse {
  final bool recylable;
  final String instructions;

  const ClassificationResponse({
    required this.recylable,
    required this.instructions,
  });

  factory ClassificationResponse.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'recylable': bool recylable,
        'instructions': String instructions,
      } =>
        ClassificationResponse(
          recylable: recylable,
          instructions: instructions,
        ),
      _ =>
        throw const FormatException('Failed to load classification response.'),
    };
  }
}
