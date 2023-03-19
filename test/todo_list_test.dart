import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing_example/todo_list.dart';

void main() {
  testWidgets('Add and remove a todo', (widgetTester) async {
    // build the widget
    await widgetTester.pumpWidget(const TodoList());

    // enter 'hi' into the TextField
    await widgetTester.enterText(find.byType(TextField), 'hi');

    // tap the add button
    await widgetTester.tap(find.byType(FloatingActionButton));

    // rebuild widget after state changed
    await widgetTester.pump();

    // the code below expect to find item on the screen
    expect(find.text('hi'),
        findsOneWidget); // would pass the test without rebuilding the widget because would find the text on the TextField
    expect(find.byType(FloatingActionButton),
        findsOneWidget); // would pass the test without rebuilding the widget because FloatingActionButton built w/o event
    expect(find.byType(Dismissible),
        findsOneWidget); // tested after rebuild the widget
    expect(find.byType(ListTile),
        findsOneWidget); // tested after rebuild the widget

    // the code below is to remove the todo

    // swipe the item to dismiss it
    await widgetTester.drag(find.byType(Dismissible), const Offset(500, 0));

    // build the widget until the dissmis animations ends
    await widgetTester.pumpAndSettle();

    // ensure that item is no longer on the screen
    expect(find.text('hi'), findsNothing);
    expect(find.byType(Dismissible), findsNothing);
    expect(find.byType(ListTile), findsNothing);
  });
}
