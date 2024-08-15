import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BlogDataProvider {
  Future<String> fetchBlogs() async {
    const String url = 'https://intent-kit-16.hasura.app/api/rest/blogs';
    const String adminSecret =
        '32qR4KmXOIpsGPQKMqEJHGJS27G5s7HdSKO3gdtQd2kv5e852SiYwWNfxkZOBuQ6';

    try {
      final response = await http.get(Uri.parse(url), headers: {
        'x-hasura-admin-secret': adminSecret,
      });

      if (response.statusCode == 200) {
        // Request successful, handle the response data here
        debugPrint('Response data: ${response.body}');
        return response.body;
      } else {
        // Request failed
        debugPrint('Request failed with status code: ${response.statusCode}');
        debugPrint('Response data: ${response.body}');
        return response.body;
      }
    } catch (e) {
      // Handle any errors that occurred during the request
      debugPrint('Error: $e');
      return e.toString();
    }
  }
}
