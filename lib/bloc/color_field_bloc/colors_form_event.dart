abstract class ColorsFormEvent {
  const ColorsFormEvent();
}

class ChangeColorsFormEvent extends ColorsFormEvent {
  final List<int> colors;
  final int index;
  final String title;
  final String id;

  const ChangeColorsFormEvent(
      {required this.colors,
      required this.index,
      required this.title,
      required this.id});
}
