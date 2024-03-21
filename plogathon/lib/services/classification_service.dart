import 'dart:io';

import 'package:path/path.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ClassificationService {
  // ignore: constant_identifier_names
  static const String BASE_URL = 'http://34.149.243.172';

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

    print(body);
    // Convert the body to JSON
    return ClassificationResponse.fromJson(
        jsonDecode(body) as Map<String, dynamic>);
  }
}

class ClassificationResponse {
  final bool status;
  final String omt;
  final bool recyclability;
  final String message;

  const ClassificationResponse({
    required this.status,
    required this.omt,
    required this.recyclability,
    required this.message,
  });

  factory ClassificationResponse.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'message': String message,
        'omt': String omt,
        'status': bool status,
        'recyclability': bool recyclability,
      } =>
        ClassificationResponse(
            status: status,
            omt: omt,
            recyclability: recyclability,
            message: message),
      _ =>
        throw const FormatException('Failed to load classification response.'),
    };
  }
}
