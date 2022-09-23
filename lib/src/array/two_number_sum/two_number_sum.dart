import 'package:collection/collection.dart';
import 'package:test/test.dart';

// O(n^2) time | O(1) space
// List<int> twoSum(List<int> nums, int target) {
//   for (final item in nums) {
//     for (final item2 in nums) {
//       if (item + item2 == target && item != item2) {
//         return [item, item2];
//       }
//     }
//   }

//   return [];
// }

// O(n) time | O(n) space
// List<int> twoSum(List<int> nums, int target) {
//   final seen = <int, int>{};
//   for (var index = 0; index < nums.length; ++index) {
//     final number = nums[index];

//     final complement = target - number;
//     if (seen.containsKey(complement)) {
//       return [number, complement];
//     } else {
//       seen[number] = index;
//     }
//   }
//   return [];
// }

// O(nLogN) time | O(1) space
List<int> twoSum(List<int> nums, int target) {
  nums.sort();
  var left = 0;
  var right = nums.length - 1;
  var currentSum = 0;

  while (left < right) {
    currentSum = nums[left] + nums[right];
    if (currentSum == target) {
      return [nums[left], nums[right]];
    } else if (currentSum < target) {
      left++;
    } else {
      right--;
    }
  }
  return [];
}

void main() {
  test('test 1', () {
    expect(
      const DeepCollectionEquality.unordered()
          .equals(twoSum([3, 5, -4, 8, 11, 1, -1, 6], 10), [-1, 11]),
      isTrue,
    );
  });

  test('test 2', () {
    expect(twoSum([1, 2, 3, 4], 12), <int>[]);
  });

  test('test 3', () {
    expect(
      const DeepCollectionEquality.unordered()
          .equals(twoSum([1, 2, 3, 4, 5, 6, 7, 8, 9, 15], 18), [15, 3]),
      isTrue,
    );
  });
}
