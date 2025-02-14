```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      try {
        final jsonData = jsonDecode(response.body);
        // ... further processing of jsonData ...
      } on FormatException catch (e) {
        print('JSON format error: $e');
        // Handle the malformed JSON, perhaps retrying or using default values
      } catch (e) {
        print('Error decoding JSON or other error: $e');
      }
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e');
    // rethrow the exception or handle it appropriately
  }
}
```