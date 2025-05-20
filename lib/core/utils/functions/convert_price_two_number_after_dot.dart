String removeTrailingZeros(double number) {
  String numString = number.toStringAsFixed(2);
  if (numString.contains('.')) {
    numString = numString.replaceAll(RegExp(r"0*$"), "");
    numString = numString.replaceAll(RegExp(r"\.$"), "");
  }
  return numString;
}
