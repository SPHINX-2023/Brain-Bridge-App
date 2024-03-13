class SudokuSolver {
  bool valid(List<List<int>> board, int value, Map<String, int> pos) {
    // check row
    for (int i = 0; i < 9; i++) {
      if (board[pos["row"]!][i] == value && pos["col"] != i) return false;
    }

    // check column
    for (int i = 0; i < 9; i++) {
      if (board[i][pos["col"]!] == value && pos["row"] != i) return false;
    }

    // check box
    int xCoordinate = pos["col"]! ~/ 3, yCoordinate = pos["row"]! ~/ 3;
    for (int i = yCoordinate * 3; i < yCoordinate * 3 + 3; i++)
      for (int j = xCoordinate * 3; j < xCoordinate * 3 + 3; j++)
        if (board[i][j] == value && (i != pos["row"] && j != pos["col"]))
          return false;
    return true;
  }

  Map<String, int>? findEmpty(List<List<int>> board) {
    for (int i = 0; i < 9; i++)
      for (int j = 0; j < 9; j++)
        if (board[i][j] == 0) return {"row": i, "col": j};

    return null;
  }

  List<List<int>> returnBoard(List<List<int>> board) {
    solve(board);
    return board;
  }

  bool solve(List<List<int>> board) {
    Map<String, int>? pos = findEmpty(board);
    if (pos == null) {
      return true;
    }
    for (int i = 1; i < 10; i++) {
      if (valid(board, i, pos)) {
        board[pos["row"]!][pos["col"]!] = i;
        if (solve(board)) return true;
        board[pos["row"]!][pos["col"]!] = 0;
      }
    }
    return false;
  }
}
