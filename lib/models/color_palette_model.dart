class ColorPalette {
  late final String id;
  late final String title;
  late final List<int> colors;

  ColorPalette({required this.id, required this.title, required this.colors});

  ColorPalette.fromJson(String id, Map<String, dynamic> json) {
    this.id = id;
    title = json['title'];
    colors = json['colors'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['colors'] = this.colors;
    return data;
  }
}
