import 'package:flutter/material.dart';

class MyWidgetList extends StatelessWidget {
  MyWidgetList({super.key});
  final List<String> items = List.generate(10000, (index) => "Item $index");

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Long List',
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Long List"),
        ),
        body: ListView.builder(
            // adding key to make test env find the list easily and scroll through it
            key: const Key('long_list'),
            itemCount: items.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  // add key to each Text widget to make test env easily find particular
                  // widget within the list and verify that the text is correct
                  key: Key('item_${index}_text'),
                  items[index],
                ),
              );
            }),
      ),
    );
  }
}
