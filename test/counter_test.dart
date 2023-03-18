import 'package:flutter_testing_example/counter.dart';
import 'package:test/test.dart';

void main() {
  // individual test, not for the group
  // test(
  //   'Counter value should be incremented',
  //   () {
  //     final counter = Counter();
  //     counter.increment();
  //     expect(counter.value, 1);
  //   },
  // );

  // test the entire class using group function
  group("Counter", () {
    test('value should be start at 0', () {
      expect(Counter().value, 0);
    });
    test('value should be incremented', () {
      final counter = Counter();
      counter.increment();
      expect(counter.value, 1);
    });
    test('value should be decremented', () {
      final counter = Counter();
      counter.decrement();
      expect(counter.value, -1);
    });
  });
}
