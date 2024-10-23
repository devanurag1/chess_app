// ignore_for_file: public_member_api_docs, sort_constructors_first
enum piecetype { bishop, king, knight, pawn, queen, rook }

class chesspiece {
  late bool iswhiter;
  late piecetype type;
  late String imagepath;
  chesspiece({
    required this.iswhiter,
    required this.type,
    required this.imagepath,
  });
}
