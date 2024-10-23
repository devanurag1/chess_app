bool iswhite(int Index) {
  int x = Index % 8;
  int y = Index ~/ 8;

  bool iswhite = (x + y) % 2 == 0;
  return iswhite;
}
