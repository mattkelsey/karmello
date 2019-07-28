class Image {
  ImageData source;
  List<ImageData> resolutions;
  String id;
  Image.fromJson(Map<String, dynamic> json) {
    this.source = ImageData.fromJson(json['source']);
    this.resolutions = new List<ImageData>();
    for (Map<String, dynamic> imageDataModel in json['resolutions']) {
      this.resolutions.add(ImageData.fromJson(imageDataModel));
    }
    this.id = json['id'];
  }
}

class ImageData {
  final Uri url;
  final int width;
  final int height;

  ImageData.fromJson(Map<String, dynamic> json)
  : url = Uri.parse(json['url']),
    width = json['width'],
    height = json['height'];
}