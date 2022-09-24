import 'package:test/test.dart';

bool isValidSubsequence(List<int> array, List<int> sequence) {
  var position = 0;

  for (final value in array) {
    if (sequence[position] == value) {
      position++;
    }
  }
  return position == sequence.length;
}

void main() {
  test('test 1', () {
    expect(
      isValidSubsequence(
        [5, 1, 22, 25, 6, -1, 8, 10],
        [1, 6, -1, 10],
      ),
      isTrue,
    );
  });

  test('test 2', () {
    expect(
      isValidSubsequence(
        [5, 1, 22, 25, 6, -1, 8, 10],
        [5, 1, 22, 25, 6, -1, 8, 10],
      ),
      isTrue,
    );
  });

  test('test 3', () {
    expect(
      isValidSubsequence(
        [5, 1, 22, 25, 6, -1, 8, 10],
        [5, 1, 25, 22, 6, -1, 8, 10],
      ),
      isFalse,
    );
  });

  test('test 4', () {
    expect(
      isValidSubsequence(
        [5, 1, 22, 25, 6, -1, 8, 10],
        [4, 5, 1, 22, 25, 6, -1, 8, 10],
      ),
      isFalse,
    );
  });

  test('test 5', () {
    expect(
      isValidSubsequence([5, 1, 22, 25, 6, -1, 8, 10], [1, 6, -1, -1]),
      isFalse,
    );
  });
}
