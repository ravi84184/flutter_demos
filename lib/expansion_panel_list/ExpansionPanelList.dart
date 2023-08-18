import 'package:flutter/material.dart';

class ExpansionPanelListScreen extends StatefulWidget {
  const ExpansionPanelListScreen({super.key});

  @override
  State<ExpansionPanelListScreen> createState() => _ExpansionPanelListState();
}

class _ExpansionPanelListState extends State<ExpansionPanelListScreen> {
  List<Item> _data = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _data = generateItems(5);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ExpansionPanelList'),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(16.0),
          child: _buildPanel(),
        ),
      ),
    );
  }

  List<Item> generateItems(int numberOfItems) {
    return List<Item>.generate(numberOfItems, (int index) {
      return Item(
        headerValue: 'Question ${index + 1}',
        expandedValue: 'Answer ${index + 1}',
      );
    });
  }

  Widget _buildPanel() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _data[index].isExpanded = !isExpanded;
        });
      },
      elevation: 2,
      // Panel elevation
      expandedHeaderPadding: const EdgeInsets.all(8.0),
      // Padding for expanded header
      dividerColor: Colors.grey,
      // Divider color between panels
      children: _data.map<ExpansionPanel>((Item item) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(
                item.headerValue,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            );
          },
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(item.expandedValue),
          ),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }
}

class Item {
  Item({
    required this.expandedValue,
    required this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}
