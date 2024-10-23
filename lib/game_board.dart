import 'package:chess_game/components/piece.dart';
import 'package:chess_game/components/square.dart';
import 'package:flutter/material.dart';

class GameBoard extends StatefulWidget {
  const GameBoard({super.key});

  @override
  State<GameBoard> createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  List<List<chesspiece?>> board = [];

  chesspiece? selectedPiece;
  int selectedRow = -1;
  int selectedCol = -1;

  @override
  void initState() {
    super.initState();
    _initializeBoard();
  }

  // Handles selecting and moving pieces
  void handleSquareTap(int row, int col) {
    setState(() {
      if (board[row][col] != null) {
        // Select a piece if nothing is currently selected
        selectedPiece = board[row][col];
        selectedRow = row;
        selectedCol = col;
      }
    });
  }

  // Deselect the currently selected piece
  void _deselectPiece() {
    selectedPiece = null;
    selectedRow = -1;
    selectedCol = -1;
  }

  // Initialize the board with chess pieces
  void _initializeBoard() {
    // Initialize an 8x8 board with null values
    List<List<chesspiece?>> newBoard =
        List.generate(8, (index) => List.generate(8, (index) => null));

    // Place black pieces
    newBoard[0][0] = chesspiece(
        iswhiter: false,
        type: piecetype.rook,
        imagepath: "assets/images/rook.png");
    newBoard[0][7] = chesspiece(
        iswhiter: false,
        type: piecetype.rook,
        imagepath: "assets/images/rook.png");
    newBoard[0][1] = chesspiece(
        iswhiter: false,
        type: piecetype.knight,
        imagepath: "assets/images/knight.png");
    newBoard[0][6] = chesspiece(
        iswhiter: false,
        type: piecetype.knight,
        imagepath: "assets/images/knight.png");
    newBoard[0][2] = chesspiece(
        iswhiter: false,
        type: piecetype.bishop,
        imagepath: "assets/images/bishop.png");
    newBoard[0][5] = chesspiece(
        iswhiter: false,
        type: piecetype.bishop,
        imagepath: "assets/images/bishop.png");
    newBoard[0][3] = chesspiece(
        iswhiter: false,
        type: piecetype.queen,
        imagepath: "assets/images/queen.png");
    newBoard[0][4] = chesspiece(
        iswhiter: false,
        type: piecetype.king,
        imagepath: "assets/images/king.png");

    // Black pawns
    for (int i = 0; i < 8; i++) {
      newBoard[1][i] = chesspiece(
        imagepath: "assets/images/pawn.png",
        iswhiter: false,
        type: piecetype.pawn,
      );
    }

    // Place white pieces
    newBoard[7][0] = chesspiece(
        iswhiter: true,
        type: piecetype.rook,
        imagepath: "assets/images/rook.png");
    newBoard[7][7] = chesspiece(
        iswhiter: true,
        type: piecetype.rook,
        imagepath: "assets/images/rook.png");
    newBoard[7][1] = chesspiece(
        iswhiter: true,
        type: piecetype.knight,
        imagepath: "assets/images/knight.png");
    newBoard[7][6] = chesspiece(
        iswhiter: true,
        type: piecetype.knight,
        imagepath: "assets/images/knight.png");
    newBoard[7][2] = chesspiece(
        iswhiter: true,
        type: piecetype.bishop,
        imagepath: "assets/images/bishop.png");
    newBoard[7][5] = chesspiece(
        iswhiter: true,
        type: piecetype.bishop,
        imagepath: "assets/images/bishop.png");
    newBoard[7][3] = chesspiece(
        iswhiter: true,
        type: piecetype.queen,
        imagepath: "assets/images/queen.png");
    newBoard[7][4] = chesspiece(
        iswhiter: true,
        type: piecetype.king,
        imagepath: "assets/images/king.png");

    // White pawns
    for (int i = 0; i < 8; i++) {
      newBoard[6][i] = chesspiece(
        imagepath: "assets/images/pawn.png",
        iswhiter: true,
        type: piecetype.pawn,
      );
    }

    board = newBoard;
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 8 * 8,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 8),
      itemBuilder: (context, index) {
        int row = index ~/ 8;
        int col = index % 8;

        // Alternating colors for the squares
        bool isWhiteSquare = (row + col) % 2 == 0;
        bool isSelected = selectedRow == row && selectedCol == col;

        return Square(
          isWhite: isWhiteSquare,
          piece: board[row][col],
          isselcted: isSelected,
          ontap: () {
            handleSquareTap(row, col);
          },
        );
      },
    );
  }
}
