import 'package:flutter/material.dart';
import 'package:chess_game/components/piece.dart'; // Assuming this is where the chess piece is defined

class Square extends StatelessWidget {
  const Square({
    super.key,
    required this.isWhite,
    this.piece,
    required this.isselcted,
    required this.ontap,
  });

  final bool isWhite;
  final chesspiece? piece;
  final bool isselcted;
  final void Function()? ontap;

  @override
  Widget build(BuildContext context) {
    // Define the color for selected squares or normal squares
    Color squareColor = isselcted
        ? Colors.blue
        : (isWhite ? Colors.grey[400]! : Colors.grey[600]!);

    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: MediaQuery.of(context).size.width / 8, // Adjusts to screen size
        height: MediaQuery.of(context).size.width / 8, // Maintain square ratio
        color: squareColor, // Use the selected square color
        child: piece != null
            ? Image.asset(
                piece!.imagepath,
                color: piece!.iswhiter ? Colors.white : Colors.black,
              )
            : null, // If no piece, leave the square empty
      ),
    );
  }
}
