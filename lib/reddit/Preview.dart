import 'package:karmello/reddit/Image.dart';

class Preview {
  List<Image> images;
  bool enabled;
  Preview.fromJson(Map<String, dynamic> json) {
    this.images = new List<Image>();
    for (Map<String, dynamic> imageModel in json['images']) {
      this.images.add(Image.fromJson(imageModel));
    }
    this.enabled = json['enabled'];
  }
}