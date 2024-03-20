import 'dart:io';

import 'package:path/path.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ClassificationService {
  // ignore: constant_identifier_names
  static const String BASE_URL = 'http://34.74.255.72:5000';

  Future<ClassificationResponse?> classify(File image) async {
    final Uri uri = Uri.parse("$BASE_URL/upload");

    // Open a bytestream
    http.ByteStream stream = http.ByteStream(image.openRead().cast());

    // Get file length
    int length = await image.length();

    http.MultipartRequest request = http.MultipartRequest("POST", uri);

    // Multipart that takes file
    var multipartFile = http.MultipartFile('image', stream, length,
        filename: basename(image.path));

    // Add file to multipart
    request.files.add(multipartFile);

    // Send
    final streamedResponse = await request.send();

    String body = await streamedResponse.stream.bytesToString();

    // Convert the body to JSON
    return ClassificationResponse.fromJson(
        jsonDecode(body) as Map<String, dynamic>);
  }
}

class ClassificationResponse {
  final bool status;
  final String OMT;
  final bool Recyclability;
  final String message;

  const ClassificationResponse({
    required this.status,
    required this.OMT,
    required this.Recyclability,
    required this.message,
  });

  factory ClassificationResponse.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'status': bool status,
        'OMT': String OMT,
        'Recylability': bool Recyclability,
        'message': String message,
      } =>
        ClassificationResponse(
            status: status,
            OMT: OMT,
            Recyclability: Recyclability,
            message: message),
      _ =>
        throw const FormatException('Failed to load classification response.'),
    };
  }
}
