import 'package:collection/collection.dart';
import 'package:test/test.dart';

// O(nLog(n) + mLog(m)) Time | O(1) Space
List<int> smallestDifference(List<int> arr1, List<int> arr2) {
  arr1.sort();
  arr2.sort();

  var i1 = 0;
  var i2 = 0;

  var smallestPair = List.filled(2, 0);

  num smallest = double.infinity;
  num current = double.infinity;

  while (i1 < arr1.length && i2 < arr2.length) {
    final first = arr1[i1];
    final second = arr2[i2];

    if (first < second) {
      current = second - first;
      i1++;
    } else if (second < first) {
      current = first - second;
      i2++;
    } else {
      return [first, second];
    }
    if (smallest > current) {
      smallest = current;
      smallestPair = [first, second];
    }
  }
  return smallestPair;
}

void main() {
  test(
    'test 1',
    () {
      expect(
        const DeepCollectionEquality.unordered().equals(
          smallestDifference(
            [-1, 5, 10, 20, 28, 3],
            [26, 134, 135, 15, 17],
          ),
          [26, 28],
        ),
        true,
      );
    },
  );

  test(
    'test 2',
    () {
      expect(
        const DeepCollectionEquality.unordered().equals(
          smallestDifference(
            [10, 1000, 9124, 2142, 59, 24, 596, 591, 124, -123],
            [-1441, -124, -25, 1014, 1500, 660, 410, 245, 530],
          ),
          [-123, -124],
        ),
        true,
      );
    },
  );

  test(
    'test 3',
    () {
      expect(
        const DeepCollectionEquality.unordered().equals(
          smallestDifference(
            [10, 0, 20, 25, 2000],
            [1005, 1006, 1014, 1032, 1031],
          ),
          [2000, 1032],
        ),
        true,
      );
    },
  );

  test(
    'test 4',
    () {
      expect(
        const DeepCollectionEquality.unordered().equals(
          smallestDifference(
            [-1, 5, 10, 20, 3],
            [26, 134, 135, 15, 17],
          ),
          [20, 17],
        ),
        true,
      );
    },
  );
}
