import 'package:test/test.dart';
import '../bin/main.dart';

void main() {
  test('Test Case 1', () {});
  test('hanoi', () {
    expect(
        checkWinInNMoves([
          [1, 2],
          [],
          [3, 4]
        ], 3),
        [
          [2],
          [1],
          [3, 4]
        ]);
    expect(
        checkWinInNMoves([
          [],
          [1, 2],
          [3, 4]
        ], 3),
        [
          [1],
          [2],
          [3, 4]
        ]);
    expect(
        checkWinInNMoves([
          [1, 2, 3, 4],
          [],
          []
        ], 15),
        [
          [2, 3, 4],
          [1],
          []
        ]);
  });
}
