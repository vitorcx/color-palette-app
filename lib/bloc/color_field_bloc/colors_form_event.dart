abstract class ColorsFormEvent {
  const ColorsFormEvent();
}

class ChangeColorEvent extends ColorsFormEvent {
  final List<int> colors;
  final int newColor;
  final int index;

  const ChangeColorEvent(
      {required this.colors, required this.newColor, required this.index});
}
