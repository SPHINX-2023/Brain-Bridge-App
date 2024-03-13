import 'package:brainbridge/provider/counter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> playlers = ['X', 'O'];
  final List<String> boardContent = ['', '', '', '', '', '', '', '', ''];
  String currentPlayler = 'X';
  int filledbox = 0; //x gets first turn

  Widget showContent(List<String> content, int index) {
    final contensts = content
        .map(
          (e) => InkWell(
            onTap: () {
              changeContent(index, currentPlayler);
            },
            child: Ink(
              child: Container(
                decoration: BoxDecoration(border: Border.all(width: 2)),
                child: Center(
                    child: Text(
                  e,
                  style: const TextStyle(
                      fontSize: 64, fontWeight: FontWeight.bold),
                )),
              ),
            ),
          ),
        )
        .toList();
    return contensts[index];
  }

  changeContent(int index, String playlerid) {
    if (boardContent[index] != '') {
      return;
    }
    if (currentPlayler == playlers[0]) {
      currentPlayler = playlers[1];
    } else {
      currentPlayler = playlers[0];
    }
    setState(() {
      boardContent[index] = playlerid;
      filledbox = filledbox + 1;
    });
    checkWinner();
  }

  checkWinner() {
    if (boardContent[0] == boardContent[1] &&
        boardContent[0] == boardContent[2] &&
        boardContent[0] != '') {
      showWinner();
    } else if (boardContent[3] == boardContent[4] &&
        boardContent[3] == boardContent[5] &&
        boardContent[3] != '') {
      showWinner();
    } else if (boardContent[6] == boardContent[7] &&
        boardContent[6] == boardContent[8] &&
        boardContent[6] != '') {
      showWinner();
    } else if (boardContent[0] == boardContent[3] &&
        boardContent[0] == boardContent[6] &&
        boardContent[0] != '') {
      showWinner();
    } else if (boardContent[1] == boardContent[4] &&
        boardContent[1] == boardContent[7] &&
        boardContent[1] != '') {
      showWinner();
    } else if (boardContent[2] == boardContent[5] &&
        boardContent[2] == boardContent[8] &&
        boardContent[2] != '') {
      showWinner();
    } else if (boardContent[0] == boardContent[4] &&
        boardContent[0] == boardContent[8] &&
        boardContent[0] != '') {
      showWinner();
    } else if (boardContent[2] == boardContent[4] &&
        boardContent[2] == boardContent[6] &&
        boardContent[2] != '') {
      showWinner();
    } else if (filledbox == 9) {
      showWinner(draw: true);
    }
  }

  showWinner({bool draw = false}) {
    if (currentPlayler == playlers[0]) {
      currentPlayler = playlers[1];
    } else {
      currentPlayler = playlers[0];
    }
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Center(
            child:
                draw ? const Text('Its Draw') : Text(currentPlayler + " wins")),
        content: ElevatedButton(
          onPressed: () {
            for (int i = 0; i < boardContent.length; i++) {
              boardContent[i] = '';
            }
            final countProvider =
                Provider.of<CountProvider>(context, listen: false);
            countProvider.setCount();
            Navigator.pop(context);
            setState(() {
              filledbox = 0;
            });
          },
          child: const Text("play Again"),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tick Tack Toe'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Center(
              child: Text(
                currentPlayler + '-Turn',
                style: const TextStyle(fontSize: 30),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3),
              itemBuilder: (context, index) {
                return showContent(boardContent, index);
              },
              itemCount: 9,
            ),
          ],
        ),
      ),
    );
  }
}
