import "package:brainbridge/provider/counter.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";

int mn = 0;
int cr = -1;
int cc = -1;

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

int _counter = 0;

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return solver();
  }
}

var lst = [
  [0, 0, 0, 7, 0, 0, 5, 1, 0],
  [0, 8, 0, 2, 4, 9, 0, 0, 0],
  [4, 0, 0, 0, 5, 0, 0, 0, 0],
  [0, 0, 8, 1, 6, 3, 0, 4, 0],
  [9, 0, 0, 5, 2, 0, 1, 0, 8],
  [0, 0, 5, 0, 0, 0, 0, 7, 0],
  [0, 9, 0, 3, 8, 2, 0, 0, 0],
  [0, 0, 0, 4, 0, 0, 6, 9, 0],
  [0, 0, 7, 0, 0, 0, 0, 0, 2]
];

class solver extends StatefulWidget {
  @override
  _solverState createState() => _solverState();
}

class _solverState extends State<solver> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('  Sudoku Solver'),
          centerTitle: true,
          leading: Icon(Icons.games),
        ),
        body: Container(
          margin: EdgeInsets.all(5),
          child: Column(
            children: <Widget>[
              Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.black)),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: grid_cell('00'),
                          ),
                          Expanded(
                            child: grid_cell('01'),
                          ),
                          Expanded(
                            child: grid_cell('02'),
                          ),
                          Expanded(
                            child: grid_cell('03'),
                          ),
                          Expanded(
                            child: grid_cell('04'),
                          ),
                          Expanded(
                            child: grid_cell('05'),
                          ),
                          Expanded(
                            child: grid_cell('06'),
                          ),
                          Expanded(
                            child: grid_cell('07'),
                          ),
                          Expanded(
                            child: grid_cell('08'),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: grid_cell('10'),
                          ),
                          Expanded(
                            child: grid_cell('11'),
                          ),
                          Expanded(
                            child: grid_cell('12'),
                          ),
                          Expanded(
                            child: grid_cell('13'),
                          ),
                          Expanded(
                            child: grid_cell('14'),
                          ),
                          Expanded(
                            child: grid_cell('15'),
                          ),
                          Expanded(
                            child: grid_cell('16'),
                          ),
                          Expanded(
                            child: grid_cell('17'),
                          ),
                          Expanded(
                            child: grid_cell('18'),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: grid_cell('20'),
                          ),
                          Expanded(
                            child: grid_cell('21'),
                          ),
                          Expanded(
                            child: grid_cell('22'),
                          ),
                          Expanded(
                            child: grid_cell('23'),
                          ),
                          Expanded(
                            child: grid_cell('24'),
                          ),
                          Expanded(
                            child: grid_cell('25'),
                          ),
                          Expanded(
                            child: grid_cell('26'),
                          ),
                          Expanded(
                            child: grid_cell('27'),
                          ),
                          Expanded(
                            child: grid_cell('28'),
                          ),
                        ],
                      ),
                    ],
                  )), // grid_0
              Container(
                decoration: BoxDecoration(
                    border: Border(
                  right: BorderSide(width: 1, color: Colors.black),
                  left: BorderSide(width: 1, color: Colors.black),
                )),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: grid_cell('30'),
                        ),
                        Expanded(
                          child: grid_cell('31'),
                        ),
                        Expanded(
                          child: grid_cell('32'),
                        ),
                        Expanded(
                          child: grid_cell('33'),
                        ),
                        Expanded(
                          child: grid_cell('34'),
                        ),
                        Expanded(
                          child: grid_cell('35'),
                        ),
                        Expanded(
                          child: grid_cell('36'),
                        ),
                        Expanded(
                          child: grid_cell('37'),
                        ),
                        Expanded(
                          child: grid_cell('38'),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: grid_cell('40'),
                        ),
                        Expanded(
                          child: grid_cell('41'),
                        ),
                        Expanded(
                          child: grid_cell('42'),
                        ),
                        Expanded(
                          child: grid_cell('43'),
                        ),
                        Expanded(
                          child: grid_cell('44'),
                        ),
                        Expanded(
                          child: grid_cell('45'),
                        ),
                        Expanded(
                          child: grid_cell('46'),
                        ),
                        Expanded(
                          child: grid_cell('47'),
                        ),
                        Expanded(
                          child: grid_cell('48'),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: grid_cell('50'),
                        ),
                        Expanded(
                          child: grid_cell('51'),
                        ),
                        Expanded(
                          child: grid_cell('52'),
                        ),
                        Expanded(
                          child: grid_cell('53'),
                        ),
                        Expanded(
                          child: grid_cell('54'),
                        ),
                        Expanded(
                          child: grid_cell('55'),
                        ),
                        Expanded(
                          child: grid_cell('56'),
                        ),
                        Expanded(
                          child: grid_cell('57'),
                        ),
                        Expanded(
                          child: grid_cell('58'),
                        ),
                      ],
                    ),
                  ],
                ),
              ), // grid_1
              Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.black)),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: grid_cell('60'),
                        ),
                        Expanded(
                          child: grid_cell('61'),
                        ),
                        Expanded(
                          child: grid_cell('62'),
                        ),
                        Expanded(
                          child: grid_cell('63'),
                        ),
                        Expanded(
                          child: grid_cell('64'),
                        ),
                        Expanded(
                          child: grid_cell('65'),
                        ),
                        Expanded(
                          child: grid_cell('66'),
                        ),
                        Expanded(
                          child: grid_cell('67'),
                        ),
                        Expanded(
                          child: grid_cell('68'),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: grid_cell('70'),
                        ),
                        Expanded(
                          child: grid_cell('71'),
                        ),
                        Expanded(
                          child: grid_cell('72'),
                        ),
                        Expanded(
                          child: grid_cell('73'),
                        ),
                        Expanded(
                          child: grid_cell('74'),
                        ),
                        Expanded(
                          child: grid_cell('75'),
                        ),
                        Expanded(
                          child: grid_cell('76'),
                        ),
                        Expanded(
                          child: grid_cell('77'),
                        ),
                        Expanded(
                          child: grid_cell('78'),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: grid_cell('80'),
                        ),
                        Expanded(
                          child: grid_cell('81'),
                        ),
                        Expanded(
                          child: grid_cell('82'),
                        ),
                        Expanded(
                          child: grid_cell('83'),
                        ),
                        Expanded(
                          child: grid_cell('84'),
                        ),
                        Expanded(
                          child: grid_cell('85'),
                        ),
                        Expanded(
                          child: grid_cell('86'),
                        ),
                        Expanded(
                          child: grid_cell('87'),
                        ),
                        Expanded(
                          child: grid_cell('88'),
                        ),
                      ],
                    ),
                  ],
                ),
              ), // grid_2
              Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height * 0.7 -
                          MediaQuery.of(context).size.width,
                      child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: nums(1),
                              ),
                              Expanded(
                                child: nums(2),
                              ),
                              Expanded(
                                child: nums(3),
                              ),
                              Expanded(
                                child: nums(4),
                              ),
                              Expanded(
                                child: nums(5),
                              ),
                            ],
                          )),
                    ),
                    Container(
                      child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: nums(6),
                              ),
                              Expanded(
                                child: nums(7),
                              ),
                              Expanded(
                                child: nums(8),
                              ),
                              Expanded(
                                child: nums(9),
                              ),
                              Expanded(
                                child: nums(0),
                              ),
                            ],
                          )),
                    ),
                  ],
                ),
              ), // numbers
              Container(
                height: MediaQuery.of(context).size.height * 0.15,
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                              padding: EdgeInsets.only(left: 5, right: 5),
                              child: ElevatedButton(
                                onPressed: () {
                                  m(context);
                                  setState(() {});
                                },
                                child: Text(
                                  "SOLVE",
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25),
                                ),
                                // color: Colors.green,
                                // borderSide: BorderSide(
                                //     color: Colors.green,
                                //     width: 2,
                                //     style: BorderStyle.solid),
                              )),
                        ),
                        // Expanded(
                        //   child: Container(
                        //       padding: EdgeInsets.only(left: 5, right: 5),
                        //       child: ElevatedButton(
                        //         onPressed: () {
                        //           clear();
                        //           setState(() {});
                        //         },
                        //         child: Text(
                        //           "CLEAN",
                        //           style: TextStyle(
                        //               color: Colors.grey,
                        //               fontWeight: FontWeight.bold,
                        //               fontSize: 25),
                        //         ),
                        //         // color: Colors.green,
                        //         // borderSide: BorderSide(
                        //         //     color: Colors.grey,
                        //         //     width: 2,
                        //         //     style: BorderStyle.solid),
                        //       )),
                        // ),
                      ],
                    )),
              ) // solve and cleangrid_cell
            ],
          ),
        ));
  }

  Widget grid_cell(String s) {
    int r = int.parse(s[0]);
    int c = int.parse(s[1]);
    double mini1 = MediaQuery.of(context).size.height * 0.1;
    double mini2 = MediaQuery.of(context).size.width * 0.1;
    if (mini1 > mini2) mini1 = mini2;
    String n = '';
    if (lst[r][c] != 0) n = lst[r][c].toString();
    bool safe = true;
    if (lst[r][c] != 0 && !issafe(r, c, lst[r][c])) safe = false;
    return GestureDetector(
      onTap: () {
        setState(() {
          cc = c;
          cr = r;
          nownum = lst[r][c];
        });
      }, // handle your onTap here
      child: Container(
        height: mini1,
        width: mini1,
        child: Center(
            child: Text('$n',
                style: lst[r][c] == nownum
                    ? TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 22)
                    : TextStyle(color: Colors.black, fontSize: 20))),
        decoration: BoxDecoration(
          border: Border(
              left: c % 3 == 0 && c > 0
                  ? BorderSide(width: 1.0, color: Colors.black)
                  : c > 0
                      ? BorderSide(width: 1.0, color: Colors.grey)
                      : BorderSide.none,
              top: r % 3 == 0
                  ? BorderSide.none
                  : BorderSide(width: 1.0, color: Colors.grey)),
          color: !safe
              ? Colors.deepOrange[200]
              : (insquare(r, c) || r == cr || c == cc) && (c != cc || r != cr)
                  ? Colors.grey[300]
                  : Colors.white,
        ),
      ),
    );
  }

  Widget nums(int x) {
    double mini1 = MediaQuery.of(context).size.height * 0.1;
    double mini2 = MediaQuery.of(context).size.width * 0.1;
    if (mini1 > mini2) mini1 = mini2;

    Container c = Container(
        width: mini1,
        height: mini1,
        child: ElevatedButton(
            onPressed: () {
              if (cc >= 0)
                setState(() {
                  lst[cr][cc] = x;
                  nownum = x;
                });
            },
            child: x == 0
                ? Icon(
                    Icons.flip,
                    color: x == nownum ? Colors.green : Colors.black,
                  )
                : Text(x.toString(),
                    style: TextStyle(
                        color: x == nownum ? Colors.green : Colors.black,
                        fontSize: 20))),
        decoration: BoxDecoration(
          border: Border(
            left: x != 1 && x != 6
                ? BorderSide(width: 1.0, color: Colors.black)
                : BorderSide.none,
          ),
          color: Colors.white,
        ));

    return c;
  }
}

int nownum = 0;

void clear() {
  for (int i = 0; i < 9; i++) for (int j = 0; j < 9; j++) lst[i][j] = 0;
}

bool issafe(int r, int c, int v) {
  for (int i = 0; i < 9; i++) if (lst[r][i] == v && i != c) return false;
  for (int i = 0; i < 9; i++) if (lst[i][c] == v && i != r) return false;

  int boxRowStart = r - r % 3;
  int boxColStart = c - c % 3;

  for (int i = boxRowStart; i < boxRowStart + 3; i++)
    for (int j = boxColStart; j < boxColStart + 3; j++)
      if (lst[i][j] == v && (i != r || c != j)) return false;
  return true;
}

bool isSafe(int row, int col, int num) {
  for (int d = 0; d < 9; d++) if (lst[row][d] == num) return false;

  for (int r = 0; r < 9; r++) if (lst[r][col] == num) return false;

  int boxRowStart = row - row % 3;
  int boxColStart = col - col % 3;

  for (int r = boxRowStart; r < boxRowStart + 3; r++)
    for (int d = boxColStart; d < boxColStart + 3; d++)
      if (lst[r][d] == num) return false;
  return true;
}

bool solveSudoku() {
  cn++;
  if (cn > 40000) return false;

  int row = -1;
  int col = -1;
  bool isEmpty = true;
  for (int i = 0; i < 9; i++) {
    for (int j = 0; j < 9; j++)
      if (lst[i][j] == 0) {
        row = i;
        col = j;
        isEmpty = false;
        break;
      }
    if (!isEmpty) break;
  }
  if (isEmpty) return true;
  for (int num = 1; num <= 9; num++)
    if (isSafe(row, col, num)) {
      lst[row][col] = num;
      if (solveSudoku())
        return true;
      else
        lst[row][col] = 0;
    }
  return false;
}

int cn = 0;
void m(BuildContext context) {
  cn = 0;
  bool allright = true;
  for (int i = 0; i < 9; i++) {
    for (int j = 0; j < 9; j++) {
      if (!issafe(i, j, lst[i][j]) || lst[i][j] == 0) {
        allright = false;
        break;
      }
    }
    if (!allright) {
      break;
    }
  }

  if (allright) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Sudoku Solved!"),
          content: Text(
              "Congratulations! You've successfully solved the Sudoku puzzle."),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                final countProvider =
                    Provider.of<CountProvider>(context, listen: false);
                countProvider.setCount();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
    clear();
  } else {
    _showMyDialog(context);
  }
}

bool insquare(int r, int c) {
  int br = cr - cr % 3;
  int bc = cc - cc % 3;
  if (r >= br && r < br + 3) if (c >= bc && c < bc + 3) return true;
  return false;
}

Future<void> _showMyDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true, // user must tapgrid_cell!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Not Solved !!"),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('Try Again '),
            ],
          ),
        ),
        actions: <Widget>[
          ElevatedButton(
            child: Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
