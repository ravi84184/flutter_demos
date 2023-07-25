import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class AutoCompleteSearchScreen extends StatefulWidget {
  const AutoCompleteSearchScreen({super.key});

  @override
  State<AutoCompleteSearchScreen> createState() =>
      _AutoCompleteSearchScreenState();
}

class _AutoCompleteSearchScreenState extends State<AutoCompleteSearchScreen> {
  final TextEditingController _controller = TextEditingController();
  List<String> countries = [
    'United States',
    'Canada',
    'India',
    'Australia',
    'United Kingdom',
    'Germany',
    // Add more countries...
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Auto-Complete Search List'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TypeAheadField(
              textFieldConfiguration: TextFieldConfiguration(
                autofocus: true,
                controller: _controller,
                decoration: const InputDecoration(
                  hintText: 'Search country...',
                ),
              ),
              suggestionsCallback: (pattern) {
                return countries
                    .where((country) =>
                        country.toLowerCase().contains(pattern.toLowerCase()))
                    .toList();
              },
              itemBuilder: (context, suggestion) {
                return ListTile(
                  title: Text(suggestion),
                );
              },
              onSuggestionSelected: (suggestion) {
                _controller.text = suggestion;
                // Handle when a suggestion is selected.
                print('Selected country: $suggestion');
              },
            ),
          ],
        ),
      ),
    );
  }
}
