import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing_example/my_widget.dart';

void main() {
  // testWidgets is provided by flutter_test, testWidgets itself also provide WidgetTester
  testWidgets('MyWidget has a title and message', (widgetTester) async {
    // create the widget by telling the tester to build it
    await widgetTester.pumpWidget(const MyWidget(title: 'T', message: 'M'));

    // create the finder
    // It creates a Finder that searches for widgets that display a specific String of text
    final titleFinder = find.text('T');
    final messageFinder = find.text('M');

    // ensure that the widget appears on screen/widgettree once
    expect(titleFinder, findsOneWidget);
    expect(messageFinder, findsOneWidget);
  });

  testWidgets('finds a widget using a key', (widgetTester) async {
    // define the test key
    const testKey = Key('K');
    await widgetTester.pumpWidget(MaterialApp(
      key: testKey,
      home: Container(),
    ));
    expect(find.byKey(testKey), findsOneWidget);
  });

  testWidgets('finds a specific widget instance', (widgetTester) async {
    const childWidget = Padding(padding: EdgeInsets.zero);
    await widgetTester.pumpWidget(Container(
      child: childWidget,
    ));
    expect(find.byWidget(childWidget), findsOneWidget);
  });
}
