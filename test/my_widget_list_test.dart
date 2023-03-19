import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing_example/my_widget_list.dart';

void main() {
  testWidgets('Counter increments smoke test', (widgetTester) async {
    await widgetTester.pumpWidget(MyWidgetList());
    final listFinder = find.byType(Scrollable);
    final itemFinder = find.byKey(const ValueKey('item_50_text'));

    // scroll until the item to be found appears
    await widgetTester.scrollUntilVisible(itemFinder, 500.0,
        scrollable: listFinder);

    // Verify that the item contains the correct text.
    expect(itemFinder, findsOneWidget);
  });
}
