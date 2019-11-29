// Part 1
// Tower of Hanoi - 3 Moves
// Write a function which will check win in 3 moves, use the code you wrote yesterday

// Part 2
// Tower of Hanoi - N Moves
// Write a function which will check win in N moves for a given state of Tower of Hanoi
// The function will take an additional parameter 'n' (number of moves)

// Stretch: Show all moves which lead to win, given a state.

List<List<List<int>>> possibleMoves(List<List<int>> input) {
  List<List<List<int>>> output = [];
  for (int i = 0; i < input.length; i++) {
    for (int j = 0; j < input.length; j++) {
      if (i != j) {
        if (canBeStacked(input[i], input[j])) {
          input[j].insert(0, input[i].removeAt(0));
          addToOutputList(output, input);
          input[i].insert(0, input[j].removeAt(0));
        }
      }
    }
  }
  return output;
}

checkWinInNMoves(List<List<int>> input, int n) {
//  List<List<List<int>>> output = [];
  List<List<List<int>>> allMoves = possibleMoves(input);
  if (n == 1) {
    return checkWinInOneMove(input);
  }
  for (var move in allMoves) {
    if (checkWinInNMoves(move, n - 1) != null) {
      return move;
    }
  }

  return null;
}

List<List<int>> checkWinInOneMove(List<List<int>> input) {
  List<List<List<int>>> allMoves = possibleMoves(input);
  for (var move in allMoves) {
    if (isFinalMove(move)) {
//      print(move);
      return move;
    }
  }
  return null;
}

bool isFinalMove(List<List<int>> input) => input[0].isEmpty && input[1].isEmpty;

void addToOutputList(List<List<List<int>>> output, List<List<int>> source) {
  List<List<int>> temp = [];
  for (List outer in source) {
    List<int> innerList = [];
    for (int i = 0; i < outer.length; i++) {
      innerList.add(outer[i]);
    }
    temp.add(innerList);
  }
  output.add(temp);
}

bool canBeStacked(List<int> tower1, List<int> tower2) =>
    (tower1.isNotEmpty && (tower2.isEmpty || tower1[0] < tower2[0]));

main() {
//  print(checkWinInNMoves([
//    [1, 2],
//    [],
//    [3, 4]
//  ], 3));
//  print(checkWinInNMoves([
//    [],
//    [1, 2],
//    [3, 4]
//  ], 3));
//  print(checkWinInNMoves([
//    [1, 2, 3, 4],
//    [],
//    []
//  ], 15));
  List<List<int>> currentMove = [[1, 2, 3, 4], [], []];
  int n = 15;
  while (currentMove!=null&&!isFinalMove(currentMove)) {
    currentMove = checkWinInNMoves(currentMove, n);
    print(currentMove);
    n--;
  }
}
