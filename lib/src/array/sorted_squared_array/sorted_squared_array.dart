import 'package:test/test.dart';

// Inefficient solution O(n(log(n)))
// List<int> sortedSquaredArray(List<int> arr) {
//   return arr.map((e) => e * e).toList()..sort();
// }
// O(n) time | O(n) space
List<int> sortedSquaredArray(List<int> arr) {
  final output = List.filled(arr.length, 0);

  final totalIndex = arr.length - 1;
  var minIndex = 0;
  var maxIndex = totalIndex;

  for (var i = 0; i < arr.length; i++) {
    final min = arr[minIndex];
    final max = arr[maxIndex];

    if (min.abs() > max.abs()) {
      output[totalIndex - i] = min * min;
      minIndex++;
    } else {
      output[totalIndex - i] = max * max;
      maxIndex--;
    }
  }
  return output;
}

void main() {
  test(
    'test 1',
    () {
      expect(
        sortedSquaredArray(
          [-7, -5, -4, 3, 6, 8, 9],
        ),
        [9, 16, 25, 36, 49, 64, 81],
      );
    },
  );
}
