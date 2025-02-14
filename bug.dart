```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      // Here's where the bug might occur if the JSON is malformed or unexpected
      final jsonData = jsonDecode(response.body);
      // ... further processing of jsonData ...
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e');
    // rethrow the exception or handle it appropriately
  }
}
```