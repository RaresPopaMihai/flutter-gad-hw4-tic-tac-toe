import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TicTacToe Game',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Color _greenPlayer = Colors.greenAccent;
  final Color _redPlayer = Colors.redAccent;
  Color _winnerColor = Colors.black;
  String _winnerPlayer = '';
  bool _gameEnded = false;
  int _containersOccupied = 0;
  int _currentPlayer = 1;
  List<Color> _ticTacToeBoard = List<Color>.filled(9, Colors.white);
  Color containerColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tic Tac Toe'),
        backgroundColor: Colors.yellowAccent,
      ),
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  changeColor(0, _currentPlayer);
                },
                child: AnimatedContainer(
                  width: MediaQuery.of(context).size.width / 3,
                  height: MediaQuery.of(context).size.width / 3,
                  decoration: BoxDecoration(
                    color: _ticTacToeBoard[0],
                    border: Border.all(),
                  ),
                  duration: const Duration(seconds: 1),
                ),
              ),
              GestureDetector(
                onTap: () {
                  changeColor(1, _currentPlayer);
                },
                child: AnimatedContainer(
                  width: MediaQuery.of(context).size.width / 3,
                  height: MediaQuery.of(context).size.width / 3,
                  decoration: BoxDecoration(
                    color: _ticTacToeBoard[1],
                    border: Border.all(),
                  ),
                  duration: const Duration(seconds: 1),
                ),
              ),
              GestureDetector(
                onTap: () {
                  changeColor(2, _currentPlayer);
                },
                child: AnimatedContainer(
                  width: MediaQuery.of(context).size.width / 3,
                  height: MediaQuery.of(context).size.width / 3,
                  decoration: BoxDecoration(
                    color: _ticTacToeBoard[2],
                    border: Border.all(),
                  ),
                  duration: const Duration(seconds: 1),
                ),
              )
            ],
          ),
          Row(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  changeColor(3, _currentPlayer);
                },
                child: AnimatedContainer(
                  width: MediaQuery.of(context).size.width / 3,
                  height: MediaQuery.of(context).size.width / 3,
                  decoration: BoxDecoration(
                    color: _ticTacToeBoard[3],
                    border: Border.all(),
                  ),
                  duration: const Duration(seconds: 1),
                ),
              ),
              GestureDetector(
                onTap: () {
                  changeColor(4, _currentPlayer);
                },
                child: AnimatedContainer(
                  width: MediaQuery.of(context).size.width / 3,
                  height: MediaQuery.of(context).size.width / 3,
                  decoration: BoxDecoration(
                    color: _ticTacToeBoard[4],
                    border: Border.all(),
                  ),
                  duration: const Duration(seconds: 1),
                ),
              ),
              GestureDetector(
                onTap: () {
                  changeColor(5, _currentPlayer);
                },
                child: AnimatedContainer(
                  width: MediaQuery.of(context).size.width / 3,
                  height: MediaQuery.of(context).size.width / 3,
                  decoration: BoxDecoration(
                    color: _ticTacToeBoard[5],
                    border: Border.all(),
                  ),
                  duration: const Duration(seconds: 1),
                ),
              )
            ],
          ),
          Row(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  changeColor(6, _currentPlayer);
                },
                child: AnimatedContainer(
                  width: MediaQuery.of(context).size.width / 3,
                  height: MediaQuery.of(context).size.width / 3,
                  decoration: BoxDecoration(
                    color: _ticTacToeBoard[6],
                    border: Border.all(),
                  ),
                  duration: const Duration(seconds: 1),
                ),
              ),
              GestureDetector(
                onTap: () {
                  changeColor(7, _currentPlayer);
                },
                child: AnimatedContainer(
                  width: MediaQuery.of(context).size.width / 3,
                  height: MediaQuery.of(context).size.width / 3,
                  decoration: BoxDecoration(
                    color: _ticTacToeBoard[7],
                    border: Border.all(),
                  ),
                  duration: const Duration(seconds: 1),
                ),
              ),
              GestureDetector(
                onTap: () {
                  changeColor(8, _currentPlayer);
                },
                child: AnimatedContainer(
                  width: MediaQuery.of(context).size.width / 3,
                  height: MediaQuery.of(context).size.width / 3,
                  decoration: BoxDecoration(
                    color: _ticTacToeBoard[8],
                    border: Border.all(),
                  ),
                  duration: const Duration(seconds: 1),
                ),
              )
            ],
          ),
          Text(
            _winnerPlayer,
            style: TextStyle(color: _winnerColor, fontSize: 40),
          ),
          Visibility(
            visible: _gameEnded,
            child: FilledButton(
                onPressed: () {
                  resetGame();
                },
                child: const Text('Play Again')),
          ),
        ],
      ),
    );
  }

  void changeColor(int selectedContainer, int currentPlayer) {
    if (_gameEnded) {
      return;
    }
    setState(() {
      Color currentColor = _ticTacToeBoard[selectedContainer];
      if (currentColor == Colors.white) {
        if (currentPlayer == 1) {
          currentColor = _greenPlayer;
          _currentPlayer++;
        } else {
          currentColor = _redPlayer;
          _currentPlayer--;
        }
        if (currentColor != Colors.white) {
          _ticTacToeBoard[selectedContainer] = currentColor;
          _containersOccupied++;
        }
        final Color winner = checkForWinner();
        if (winner != Colors.white) {
          if (winner == _greenPlayer) {
            _ticTacToeBoard = _ticTacToeBoard.map((Color color) => color == _redPlayer ? Colors.white : color).toList();
            _winnerPlayer = 'Green wins!';
          } else {
            _ticTacToeBoard =
                _ticTacToeBoard.map((Color color) => color == _greenPlayer ? Colors.white : color).toList();
            _winnerPlayer = 'Red wins!';
          }
          _winnerColor = winner;
          _gameEnded = true;
        }
        if (_containersOccupied == 9 && winner == Colors.white) {
          _winnerPlayer = "It's a tie!";
          _gameEnded = true;
        }
      }
    });
  }

  Color checkForWinner() {
    Color winner = Colors.white;
    winner = checkDiagonals();
    if (winner != Colors.white) {
      return winner;
    }
    winner = checkRows();
    if (winner != Colors.white) {
      return winner;
    }
    winner = checkColumns();
    return winner;
  }

  Color checkDiagonals() {
    Color diagonalColor = _ticTacToeBoard[0];
    if (diagonalColor != Colors.white && _ticTacToeBoard[4] == diagonalColor && _ticTacToeBoard[8] == diagonalColor) {
      leaveWinningCombination(_ticTacToeBoard, 0, 4, 8);
      return diagonalColor;
    }
    diagonalColor = _ticTacToeBoard[2];
    if (diagonalColor != Colors.white && _ticTacToeBoard[4] == diagonalColor && _ticTacToeBoard[6] == diagonalColor) {
      leaveWinningCombination(_ticTacToeBoard, 2, 4, 6);
      return diagonalColor;
    }
    return Colors.white;
  }

  Color checkRows() {
    Color rowColor = _ticTacToeBoard[0];
    if (rowColor != Colors.white && _ticTacToeBoard[1] == rowColor && _ticTacToeBoard[2] == rowColor) {
      leaveWinningCombination(_ticTacToeBoard, 0, 2, 3);
      return rowColor;
    }
    rowColor = _ticTacToeBoard[3];
    if (rowColor != Colors.white && _ticTacToeBoard[4] == rowColor && _ticTacToeBoard[5] == rowColor) {
      leaveWinningCombination(_ticTacToeBoard, 3, 4, 5);
      return rowColor;
    }
    rowColor = _ticTacToeBoard[6];
    if (rowColor != Colors.white && _ticTacToeBoard[7] == rowColor && _ticTacToeBoard[8] == rowColor) {
      leaveWinningCombination(_ticTacToeBoard, 6, 7, 8);
      return rowColor;
    }
    return Colors.white;
  }

  Color checkColumns() {
    Color columnColor = _ticTacToeBoard[0];
    if (columnColor != Colors.white && _ticTacToeBoard[3] == columnColor && _ticTacToeBoard[6] == columnColor) {
      leaveWinningCombination(_ticTacToeBoard, 0, 3, 6);
      return columnColor;
    }
    columnColor = _ticTacToeBoard[1];
    if (columnColor != Colors.white && _ticTacToeBoard[4] == columnColor && _ticTacToeBoard[7] == columnColor) {
      leaveWinningCombination(_ticTacToeBoard, 1, 4, 7);
      return columnColor;
    }
    columnColor = _ticTacToeBoard[2];
    if (columnColor != Colors.white && _ticTacToeBoard[5] == columnColor && _ticTacToeBoard[8] == columnColor) {
      leaveWinningCombination(_ticTacToeBoard, 2, 5, 8);
      return columnColor;
    }
    return Colors.white;
  }

  void resetGame() {
    setState(() {
      _gameEnded = false;
      _winnerPlayer = '';
      _winnerColor = Colors.black;
      _ticTacToeBoard = List<Color>.filled(9, Colors.white);
      _containersOccupied = 0;
    });
  }

  void leaveWinningCombination(List<Color> board, int i, int j, int k) {
    for (int z = 0; z < board.length; z++) {
      if (z != i && z != j && z != k) {
        board[z] = Colors.white;
      }
    }
  }
}
