import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:color_palette/models/color_palette_model.dart';

class ColorPaletteFirebase {
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<void> addColorPalette(Map<String, dynamic> colorPalette) async {
    await _firebaseFirestore.collection('color_palettes').add(colorPalette);
  }

  Future<void> removeColorPalette(String id) async {
    await _firebaseFirestore.doc(id).delete();
  }

  Future<List<ColorPalette>> getColorPalettes() async {
    QuerySnapshot snapshot =
        await _firebaseFirestore.collection('color_palettes').get();
    List<ColorPalette> colorPalettes = List.empty();
    snapshot.docs.map((doc) {
      colorPalettes.add(
          ColorPalette.fromJson(doc.id, doc.data() as Map<String, dynamic>));
    });
    return colorPalettes;
  }
}