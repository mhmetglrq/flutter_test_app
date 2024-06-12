import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_app/counter.dart';

void main() {
  late Counter counter;
  setUp(() {
    counter = Counter();
  });
  //Testing
  group(
    "Counter Class - ",
    () {
      test(
        "given counter class when it is instantiated then value of count should be zero",
        () {
          // Arrange
          // Act
          final val = counter.count;
          // Assert
          expect(val, 0);
        },
      );

      test(
        "given counter class when it is incremented then the value should be one",
        () {
          // Arrange
          // Act
          counter.incrementCounter();
          // Assert
          expect(counter.count, 1);
        },
      );

      test(
        "given counter class when it is decremented then the value should be -1",
        () {
          // Arrange
          // Act
          counter.decrementCounter();
          // Assert
          expect(counter.count, -1);
        },
      );

      test(
        "given counter class when it is reseted then the value should be 0",
        () {
          // Arrange
          // Act
          counter.resetCounter();
          final val = counter.count;
          // Assert
          expect(val, 0);
        },
      );
    },
  );
}
