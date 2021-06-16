class ColorPalette {
  late final String id;
  late final String title;
  late final List<String> colors;

  ColorPalette({required String id, required this.title, required this.colors});

  ColorPalette.fromJson(String id, Map<String, dynamic> json) {
    id = id;
    title = json['title'];
    colors = json['colors'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['colors'] = this.colors;
    return data;
  }
}
